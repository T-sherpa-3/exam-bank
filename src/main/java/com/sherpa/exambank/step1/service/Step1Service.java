package com.sherpa.exambank.step1.service;

import com.sherpa.exambank.step1.domain.*;
import com.sherpa.exambank.step1.mapper.Step1Mapper;
import com.sherpa.exambank.step2.domain.Step2Request;
import com.sherpa.exambank.step2.domain.Step2Response;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.*;
import java.net.URI;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@RequiredArgsConstructor
@Service
@Slf4j
public class Step1Service {
    private final Step1Mapper step1Mapper;
    @Value("${tsherpa.api.url}")
    private String tsherpaURL;

    public Step1Response step1Page(Subject subject) {
        String urn_chapterList = "/chapter/chapter-list";           // 단원정보
        String urn_evaluationList = "/chapter/evaluation-list";     // 평가영역

        // 단원 정보 트리 만들기
        List<Chapter> chapterList = postRequest(subject, urn_chapterList).getChapterList();
        Map<String, LinkedHashMap<String, ChapterNode>> map = new HashMap<>();
        for (Chapter chapter : chapterList) {
            makeChapterTree(chapter, map);
        }

        Step1Response response = Step1Response.builder()
                .chapterList(postRequest(subject, urn_chapterList).getChapterList())
                .evaluationList(postRequest(subject, urn_evaluationList).getEvaluationList())
                .chapterTree(map)
                .build();

        return response;
    }

    /**
     * 단원 정보 혹은 평가 영역 api를 호출하여 Step1Response 객체를 반환한다.
     * @param subject: 교과서 ID
     * @param urn:          요청 urn
     * @return Step1Response 객체(단원 정보 리스트, 평가 영역 리스트)
     */
    private Step1Response postRequest(Subject subject, String urn) {
        // 요청 url
        URI url = UriComponentsBuilder
                .fromUriString(tsherpaURL)
                .path(urn)
                .encode()
                .build()
                .toUri();

        // 요청 httpEntity의 header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // 요청 httpEntity의 body에 포함 될 jsonObject 생성
        JSONObject body = new JSONObject();
        body.put("subjectId", subject.getSubjectId());
        // 요청 HttpEntity
        HttpEntity<String> request = new HttpEntity<>(body.toString(), headers);

        // 요청 & 응답
        RestTemplate restTemplate = new RestTemplate();
        Step1Response step1Response = restTemplate.postForObject(
                url, request, Step1Response.class
        );

        return step1Response;
    }

    /**
     * 트리 구조 Map 생성
     * @param chapter: chapterList의 요소 한 개
     * @param map:     Map<부모 단원 ID, LinkedHashMap<단원 ID, 단원 노드>>
     */
    private void makeChapterTree(Chapter chapter, Map<String, LinkedHashMap<String, ChapterNode>> map) {
        String subjectId = chapter.getSubjectId();
        String largeChapterId = chapter.getLargeChapterId();
        String mediumChapterId = chapter.getMediumChapterId();
        String smallChapterId = chapter.getSmallChapterId();
        String topicChapterId = chapter.getTopicChapterId();

        // 주제의 정보를 담은 루트 노드가 없을 경우 생성
        if (!map.containsKey(subjectId)) {
            LinkedHashMap<String, ChapterNode> lhmap = new LinkedHashMap<>();
            map.put(subjectId, lhmap);
        }

        // 주제의 정보를 담은 루트 노드 아래에 대단원 노드를 추가한다.
        if (!map.get(subjectId).containsKey(largeChapterId)) {
            // chapter의 대단원 노드 생성
            ChapterNode node = ChapterNode.builder()
                    .chapterId(largeChapterId)
                    .chapterName(chapter.getLargeChapterName())
                    .dataCode("large")
                    .build();

            map.get(subjectId).put(largeChapterId, node);
        }

        // 대단원 노드가 없을 경우 생성
        if (!map.containsKey(largeChapterId)) {
            LinkedHashMap<String, ChapterNode> lhmap = new LinkedHashMap<>();
            map.put(largeChapterId, lhmap);
        }

        // 대단원 노드 아래에 중단원 노드를 추가한다.
        if (!map.get(largeChapterId).containsKey(mediumChapterId)) {
            // chapter의 중단원 노드
            ChapterNode node = ChapterNode.builder()
                    .chapterId(mediumChapterId)
                    .chapterName(chapter.getMediumChapterName())
                    .dataCode("medium")
                    .build();

            map.get(largeChapterId).put(mediumChapterId, node);
        }

        // 중단원 노드가 없을 경우 생성
        if (!map.containsKey(mediumChapterId)) {
            LinkedHashMap<String, ChapterNode> lhmap = new LinkedHashMap<>();
            map.put(mediumChapterId, lhmap);
        }

        // 중단원 노드 아래에 소단원 노드를 추가한다.
        if (!map.get(mediumChapterId).containsKey(smallChapterId)) {
            // chapter의 소단원 노드
            ChapterNode node = ChapterNode.builder()
                    .chapterId(smallChapterId)
                    .chapterName(chapter.getSmallChapterName())
                    .dataCode("small")
                    .build();

            map.get(mediumChapterId).put(smallChapterId, node);
        }

        // 소단원 노드가 없을 경우 생성
        if (!map.containsKey(smallChapterId)) {
            LinkedHashMap<String, ChapterNode> lhmap = new LinkedHashMap<>();
            map.put(smallChapterId, lhmap);
        }

        // 소단원 노드 아래에 토픽 노드를 추가한다.
        if (!map.get(smallChapterId).containsKey(topicChapterId)) {
            // chapter의 토픽 노드
            ChapterNode node = ChapterNode.builder()
                    .chapterId(topicChapterId)
                    .chapterName(chapter.getTopicChapterName())
                    .dataCode("topic")
                    .build();

            map.get(smallChapterId).put(topicChapterId, node);
        }
    }

    public Step2Response moveExamStep2(Step2Request step2Request){
        // 5번 api 사용
        // map 정보 수정
        step2Request.setMinorClassification(step2Request.getChapterList());

        log.info("service moveExamStep2 : {}", step2Request);
        log.info("service moveExamStep2 : {}", step2Request.getMinorClassification());

        // 요청
        MoveExamStep2Response response = postMoveExamStep2Request("item-img/chapters/item-list", step2Request);
        List<MoveExamStep2Item> itemList = response.getItemList();

        // 응답
        Step2Response step2Response;
        if(itemList == null || itemList.isEmpty()){
            // itemsTotalCnt = 0 json 만들어서 리턴
            // 응답 객체 만들기
            step2Response = Step2Response.builder()
                    .itemsTotalCnt(0L)
                    .cntEqualYn("N")
                    .build();
        }else {
            // itemList를 순회하며 Map<난이도, List<문제>>를 만듦
            Map<String, List<MoveExamStep2Item>> itemMap = filterItemListByDifficultyCode(itemList);

            // 난이도별 출제할 문항 수 계산
            int[] resultCheckCntEqualYn = checkCntEqualYn(step2Request, itemMap);
            IntStream.of(resultCheckCntEqualYn)
                    .forEach(num -> log.info("moveExamStep2 resultCheckCntEqualYn: {}", Integer.toString(num)));
            Map<String, Integer> levelGroup = new HashMap<>();
            levelGroup.put("02", resultCheckCntEqualYn[2]); // 하
            levelGroup.put("03", resultCheckCntEqualYn[3]); // 중
            levelGroup.put("04", resultCheckCntEqualYn[4]); // 상

            // 난이도별 랜덤 출제
            Map<String, List<MoveExamStep2Item>> queListMap = setRandomQuestions(resultCheckCntEqualYn, itemMap);
            // 난이도별 랜덤 출제 문제 리스트 생성
            List<MoveExamStep2Item> resultItemList = new ArrayList<>();
            for(String diffCode: queListMap.keySet()){
                List<MoveExamStep2Item> tempList = queListMap.get(diffCode);
                if(tempList != null && !tempList.isEmpty()){
                    resultItemList.addAll(tempList);
                }
            }
            Collections.shuffle(resultItemList);

            // queIdList 넣기
            List<Long> queIdList = getQueIdList(queListMap);
            Arrays.stream(queIdList.toArray()).forEach(num -> log.info("queIdList : {}", num));

            // 응답 객체 만들기
            step2Response = Step2Response.builder()
                    .itemsTotalCnt(Integer.toUnsignedLong(resultCheckCntEqualYn[6]))
                    .cntEqualYn((resultCheckCntEqualYn[0] == 1) ? "N" : "Y")
                    .levelGroup(levelGroup)
                    .queIdList(queIdList)
                    .itemList(resultItemList)
                    .build();
        }

        return step2Response;
    }

    // moveExamStep2 요청
    private MoveExamStep2Response postMoveExamStep2Request(String urn, Step2Request step2Request) {
        // 요청 url
        URI url = UriComponentsBuilder
                .fromUriString(tsherpaURL)
                .path(urn)
                .encode()
                .build()
                .toUri();

        // 요청 httpEntity의 header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // 요청 httpEntity의 body에 포함 될 jsonObject 생성
        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("minorClassification", step2Request.getMinorClassification());
        requestBody.put("activityCategoryList", step2Request.getActivityCategoryList());
        requestBody.put("levelCnt", step2Request.getLevelCnt());
        requestBody.put("questionForm", step2Request.getQuestionForm());
        // 요청 HttpEntity
        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

        // 요청 & 응답
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<MoveExamStep2Response> responseEntity;
        try {
            responseEntity = restTemplate.exchange(
                    url, HttpMethod.POST, requestEntity, MoveExamStep2Response.class);
        } catch (RestClientException e) {
            // 예외 처리
            return null;
        }

        MoveExamStep2Response moveExamStep2Response = responseEntity.getBody();
        return moveExamStep2Response;
    }

    // itemList를 순회하며 Map<난이도, List<문제>>를 만듦
    // 난이도별 문제 List 생성
    private Map<String, List<MoveExamStep2Item>> filterItemListByDifficultyCode(List<MoveExamStep2Item> itemList){
        Map<String, List<MoveExamStep2Item>> itemMap = new HashMap<>();
        String difficultyCode;
        for(int i=0; i<itemList.size(); i++){
            // 현재 난이도
            difficultyCode = itemList.get(i).getDifficultyCode();

            if(!itemMap.containsKey(difficultyCode)){   // 현재 난이도의 list가 없을 경우 생성
                List<MoveExamStep2Item> list = new ArrayList<>();
                itemMap.put(difficultyCode, list);
            }

            // 현재 난이도의 문제 리스트에 현재 문제를 넣는다.
            itemMap.get(difficultyCode).add(itemList.get(i));
        }

        return itemMap;
    }

    // 요청사항 충족 여부 & 난이도별 출제할 문제 개수 계산
    public int[] checkCntEqualYn(Step2Request step2Request, Map<String, List<MoveExamStep2Item>> itemMap) {
        // 1. itemList를 순회하며 난이도별 문제 리스트(Map<난이도, List<문제>>)를 만듦 -> filterItemListByDifficultyCode()
        // 2. totalLevelCnt 배열을 만듦 (api를 통해 가져온 문제들의 난이도별 문제 개수 배열)
        // 3. availableLevelCnt 배열을 만듦
        // 3-1. 먼저 사용자의 요청에 맞춘다.
        // 3-2. 제일 낮은 난이도부터 부족한 문제 개수를 채워 최대한 총 문제 개수를 맞춘다.
        // 요청 > 가능 -> available을 가능 개수에 맞춤 & required += (요청-가능)
        // 요청 <= 가능 -> available을 요청 개수에 맞춤
        // 02 하, 03 중, 04 상

        // 2. totalLevelCnt 배열을 만듦
        // 0: 요청 미충족 여부(1 = 미충족), 1: 최하 ~ 5: 최상, 6: 총 개수
        int[] totalLevelCnt = new int[7];   // api 통해 얻은 난이도별 총 문제 개수
        for(String s: itemMap.keySet()){
            Integer i = Integer.parseInt(s);
            totalLevelCnt[i] = itemMap.get(s).size();
        }

        IntStream.of(totalLevelCnt)
                .forEach(num -> log.info("checkCntEqualYn totalLevelCnt: {}", Integer.toString(num)));

        // 3. 난이도별 출제할 문제 개수 배열을 만듦
        int[] requested = new int[7];   // 사용자의 요청
        int[] required = new int[7];    // 사용자의 요청 - 전체 문제 개수
        boolean cntEqualYn = true;      // 사용자의 요청에 부합한지 여부
        // totalLevelCnt: 최종적으로 출제할 난이도별 문제 개수
        // 3-1. 먼저 사용자의 요청에 맞춘다.
        for(int i=2; i<=4; i++){
            // requested 구하기
            String reqStr = step2Request.getLevelCnt().get(i-1);    // i 난이도의 사용자가 요청한 문제 개수
            Integer reqCnt = Integer.parseInt(reqStr);
            requested[i] = reqCnt;
            requested[6] += requested[i];   // 누적 합

            // required 구하기
            required[i] = requested[i] - totalLevelCnt[i];

            // totalLevelCnt 구하기
            if (required[i] <= 0){   // 사용자 요청에 맞춤
                totalLevelCnt[i] = requested[i];
            }
            // else -> 사용자 요청 개수보다 부족
            totalLevelCnt[6] += totalLevelCnt[i];   // 누적 합
        }
        required[6] = requested[6] - totalLevelCnt[6];  // 부족한 문제 총 개수
        if(required[6] > 0) cntEqualYn = false;

        IntStream.of(requested)
                .forEach(num -> log.info("checkCntEqualYn requested: {}", Integer.toString(num)));

        IntStream.of(required)
                .forEach(num -> log.info("checkCntEqualYn required: {}", Integer.toString(num)));

        // 3-2. 제일 낮은 난이도부터 부족한 문제 개수를 채워 최대한 총 문제 개수를 맞춘다.
        for(int i=2; i<=4; i++){
            // 부족한 문제 개수가 0
            if(required[6] <= 0)    break;
            // 사용자의 요청 문제 개수가 0
            if(requested[i] <= 0)   continue;

            if(required[i] < 0){    // 출제 가능한 잉여 문제가 있다.
                int absRequired = Math.abs(required[i]); // 잉여 문제 개수
                int temp = Math.min(absRequired, required[6]); // 잉여 문제 개수와 부족한 문제 총 개수 중 최소 값

                totalLevelCnt[i] += temp;
                required[6] -= temp;    // 부족한 문제 총 개수 갱신
                totalLevelCnt[6] += temp;   // 출제 문제 총 개수 갱신
            }
        }

        if(!cntEqualYn) totalLevelCnt[0] = 1;   // 요청에 부합하지 않을 경우, 1
        return totalLevelCnt;
    }

    // 문제 랜덤 출제
    // Map<난이도, List<문제 ID>>: 난이도별 출제 문제 리스트
    private Map<String, List<MoveExamStep2Item>> setRandomQuestions(int[] levelCnt, Map<String, List<MoveExamStep2Item>> itemMap){
        List<MoveExamStep2Item> itemList;   // 각 난이도별 문제 리스트
        Map<String, List<MoveExamStep2Item>> resultMap = new HashMap<>();  // 결과

        // 각 난이도별 문제 리스트를 shuffle하여 랜덤한 문제를 구힌다.
        for(int i=2; i<=4; i++) {    // 난이도 i: 하~상
            String diffCode = String.format("%02d", i); // 난이도 코드 문자열

            itemList = itemMap.get(diffCode);  // i 난이도의 문제 리스트
            if (levelCnt[i] <= 0 || itemList == null || itemList.isEmpty()) continue;

            log.info("diffCode: {}",diffCode);

            Collections.shuffle(itemList);  // 리스트 셔플
            resultMap.put(diffCode, itemList.subList(0, levelCnt[i]));  // 셔플된 리스트에서 levelCnt[난이도]개를 꺼내기
        }

        return resultMap;
    }

    // 출제할 문제의 itemId 리스트 생성
    private List<Long> getQueIdList(Map<String, List<MoveExamStep2Item>> queListMap) {
        List<Long> idList = new ArrayList<>();

        for(String difficultyCode: queListMap.keySet()){
            List<MoveExamStep2Item> qList = queListMap.get(difficultyCode);
            for(MoveExamStep2Item item: qList){
                idList.add(item.getItemId());
            }
        }

        return idList;
    }


    // 하단 미사용 메소드
    // map -> JSONObject
    public JSONObject convertMapToJson(Map<String, Object> map) {
        JSONObject json = new JSONObject();
        String key = "";
        Object value = null;
        for(Map.Entry<String, Object> entry : map.entrySet()) {
            key = entry.getKey();
            value = entry.getValue();
            json.put(key, value);
        }
        return json;
    }

    private List ResponseEntityToStep1DTOList(String response) throws ParseException {
        // [*****] null일 경우 예외처리

        // String으로 되어져있는 바디부분을 다시 JSON 형태로 파싱
        JSONParser parser = new JSONParser();
        JSONObject data = (JSONObject) parser.parse(response);

        // 파싱된 JSON에서 data 키값으로 get
        JSONArray dataList = (JSONArray) data.get("chapterList");

        // JSONArray -> List<JSONObject>
        List<JSONObject> chapterJsonList = (List<JSONObject>) dataList.stream()
                .collect(Collectors.toList());

        // List<JSONObject> -> List<Step1DTO>
        List<Chapter> chapterList = new ArrayList<>();
        for (JSONObject chapter : chapterJsonList) {
            Chapter s = Chapter.builder()
                    .curriculumCode(chapter.get("curriculumCode").toString())
                    .curriculumName(chapter.get("curriculumName").toString())
                    .subjectId(chapter.get("subjectId").toString())
                    .subjectName(chapter.get("subjectName").toString())
                    .largeChapterId(chapter.get("largeChapterId").toString())
                    .largeChapterName(chapter.get("largeChapterName").toString())
                    .mediumChapterId(chapter.get("mediumChapterId").toString())
                    .mediumChapterName(chapter.get("mediumChapterName").toString())
                    .smallChapterId(chapter.get("smallChapterId").toString())
                    .smallChapterName(chapter.get("smallChapterName").toString())
                    .topicChapterId(chapter.get("topicChapterId").toString())
                    .topicChapterName(chapter.get("topicChapterName").toString())
                    .build();
            chapterList.add(s);
        }

        return chapterList;
    }
}
