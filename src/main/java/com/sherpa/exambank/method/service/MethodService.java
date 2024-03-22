package com.sherpa.exambank.method.service;

import com.sherpa.exambank.method.domain.*;
import com.sherpa.exambank.outapi.resonse.ResponseSeven;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RequiredArgsConstructor
@Service
@Slf4j
public class MethodService {

    @Value("${tsherpa.api.url}")
    private String tsherpaURL;

    /**
     * step0 상단 교과서명과 교육과정 정보 출력을 위한 조회
     * @param subjectId 교과서ID
     * @return 리스트[교과서명, 교육과정]
     */
    public List<String> findSubjectNameBySubjectId(String subjectId) throws InstantiationException, IllegalAccessException {
        // 교과서 정보 얻어오기
        Step0ChapterResponse step0ChapterResponse = postForChapterListBySubjectId(subjectId); // api #1 교재별 단원 리스트 조회

        String subjectName = step0ChapterResponse.getChapterList().get(0).getSubjectName();
        String curriculumName = step0ChapterResponse.getChapterList().get(0).getCurriculumName();

        List<String> result = new ArrayList<>();
        result.add(subjectName);    // [0]
        result.add(curriculumName); // [1]

        return result;
    }

    /**
     * step0 대단원명, 대단원별 셋팅지 정보 조회
     * @param subjectId 교과서ID
     * @return 대단원을 기준으로 그룹화된 셋팅지 응답 리스트
     */
    public ArrayList<ExamGroupByLargeChapterResponse> findSettingListBySubjectId(String subjectId) {
        // 셋팅지 리스트 얻어오기
        Step0ExamResponse step0ExamResponse =  postForExamListBySubjectId(subjectId); // api #16 교재&대단원 별 T셀파 셋팅지 리스트 조회
        List<ExamList> examList = step0ExamResponse.getExamList(); // 셋팅지 리스트만 List에 담기

        // 대단원 기준 셋팅지 그룹화 작업
        ArrayList<String> largeChapterIdList = new ArrayList<>();
        ArrayList<String> largeChapterNameList = new ArrayList<>();
        ArrayList<ArrayList<String>> examListByLargeChapterId = new ArrayList<>();

        for (ExamList exam : examList) {

            // 대단원 id 추출 후 리스트 추가
            String largeChapterId = exam.getLargeChapterId();
            if (!largeChapterIdList.contains(largeChapterId)) {
                largeChapterIdList.add(largeChapterId);
            }

            // 대단원 name 추출 후 리스트 추가
            String largeChapterName = exam.getLargeChapterName();
            if (!largeChapterNameList.contains(largeChapterName))
                largeChapterNameList.add(largeChapterName);

            // 대단원 Id 포함 시험지 정보 추출 후 리스트 추가
            ArrayList<String> examInfo = new ArrayList<>();
            examInfo.add(largeChapterId);
            examInfo.add(exam.getExamId());
            examInfo.add(exam.getExamName());
            examInfo.add(String.valueOf(exam.getItemCnt()));
            examListByLargeChapterId.add(examInfo);
        }
        // 대단원 ID, 대단원 Name 정렬
        largeChapterIdList.sort(String::compareTo);
        largeChapterNameList.sort(String::compareTo);


        ArrayList<ExamGroupByLargeChapterResponse> examGroupByLargeChapterResponses = new ArrayList<>();
        for(String id : largeChapterIdList){
            examGroupByLargeChapterResponses.add(
                    new ExamGroupByLargeChapterResponse(id, largeChapterNameList.get(largeChapterIdList.indexOf(id)))
            );
            log.info(examGroupByLargeChapterResponses.toString());
        }

        for (ArrayList<String> examInfo: examListByLargeChapterId) {
//            if(String.valueOf(examInfo.get(0)).equals())
            log.info(String.valueOf(examInfo.get(0)));
            for(String id:largeChapterIdList) {
                if (String.valueOf(examInfo.get(0)).equals(id)){
                    ExamGroupByLargeChapterResponse matchedResponse = examGroupByLargeChapterResponses.get(largeChapterIdList.indexOf(id));
                    matchedResponse.getExamInfoList().add(new ExamGroupByLargeChapterResponse.ExamInfo(
                            examInfo.get(1),examInfo.get(2),examInfo.get(3)
                    ));
                }
            }
        }
        log.info(String.valueOf(examGroupByLargeChapterResponses));
        return examGroupByLargeChapterResponses;


    }

    public Step0ChapterResponse postForChapterListBySubjectId(String subjectId) throws InstantiationException, IllegalAccessException {
        // 요청 url
        URI uri = UriComponentsBuilder
                .fromUriString(tsherpaURL)
                .path("/chapter/chapter-list") // api #1 교재별 단원 리스트 조회
                .encode()
                .build()
                .toUri();

        // 요청 httpEntity의 header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // 요청 httpEntity의 body에 포함 될 jsonObject 생성
        JSONObject step0RequestJson = new JSONObject();
        step0RequestJson.put("subjectId", subjectId);

        HttpEntity<String> request = new HttpEntity<>(step0RequestJson.toString(), headers);
        log.info("postwithParamAndBody request : " + request);

        // post 요청 및 응답
        RestTemplate restTemplate = new RestTemplate();
        Step0ChapterResponse response = restTemplate.postForObject(
                uri, request, Step0ChapterResponse.class
        );

        log.info(response.toString());

        // [*****] null일 경우 예외처리

        return response;

    }

    public Step0ExamResponse postForExamListBySubjectId(String subjectId) {
        // 요청 url
        URI uri = UriComponentsBuilder
                .fromUriString(tsherpaURL)
                .path("/chapter/exam-list") // api #16 교재&대단원 별 T셀파 셋팅지 리스트 조회
                .encode()
                .build()
                .toUri();

        // 요청 httpEntity의 header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // 요청 httpEntity의 body에 포함 될 jsonObject 생성
        JSONObject step0RequestJson = new JSONObject();
        step0RequestJson.put("subjectId", subjectId);

        HttpEntity<String> request = new HttpEntity<>(step0RequestJson.toString(), headers);
        log.info("postwithParamAndBody request : " + request);

        // post 요청 및 응답
        RestTemplate restTemplate = new RestTemplate();
        Step0ExamResponse response = restTemplate.postForObject(
                uri, request, Step0ExamResponse.class
        );

        log.info(response.toString());

        // [*****] null일 경우 예외처리

        return response;

    }

    /**
     * step0 셋팅지 ID에 따른  조회
     * @param examId  시험지ID
     * @return 리스트[교과서명, 교육과정]
     */
    public ResponseSeven findItemListBySettingExamId(SettingExamRequest settingExamRequest) throws InstantiationException, IllegalAccessException {
        // 요청 url
        URI uri = UriComponentsBuilder
                .fromUriString(tsherpaURL)
                .path("/item-img/exam/item-list") // api #7 교재&대단원 별 T셀파 셋팅지 리스트 조회
                .encode()
                .build()
                .toUri();

        // 요청 httpEntity의 header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // 요청 httpEntity의 body에 포함 될 jsonObject 생성
        JSONObject requestJson = new JSONObject();
        requestJson.put("examId", settingExamRequest.getExamId());
        log.info(settingExamRequest.getExamId());

        HttpEntity<String> request = new HttpEntity<>(requestJson.toString(), headers);
        log.info("postwithParamAndBody request : " + request);

        // post 요청 및 응답
        RestTemplate restTemplate = new RestTemplate();
        ResponseSeven response = restTemplate.postForObject(
                uri, request, ResponseSeven.class
        );
        log.info(response.toString());

        // [*****] null일 경우 예외처리


        if(response.getSuccessYn().equals("Y")){
            return response;
        } else {
            return null;
        }



    }
}
