package com.sherpa.exambank.step2.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sherpa.exambank.step1.domain.MinorClassification;
import com.sherpa.exambank.step1.domain.MoveExamStep2Item;
import com.sherpa.exambank.step2.domain.ItemDTO;
import com.sherpa.exambank.step2.domain.Step2Request;
import com.sherpa.exambank.step2.domain.Step2Response;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class Step2Service_jy {
    public Step2Response moveToStep2(Step2Request step2Request) throws JsonProcessingException {
        Step2Response step2Response = Step2Response.builder()
                        .queIdList(step2Request.getQueArr())
                        .paperGubun(step2Request.getPaperGubun())
                        .subjectId(step2Request.getSubjectId())
                        .chapterList(step2Request.getChapterList())
                        .activityCategoryList(step2Request.getActivityCategoryList())
                        .questionForm(step2Request.getQuestionForm())
                        .build();

        ObjectMapper objectMapper = new ObjectMapper();
        // 문제 정보 List
        MoveExamStep2Item[] itemArray = objectMapper.readValue(step2Request.getItemListByForm(), MoveExamStep2Item[].class);
        List<MoveExamStep2Item> itemList = Arrays.asList(itemArray);
        step2Response.setItemList(itemList);

        // 난이도별 문제 개수
        Map<String, Integer> levelGroup = new HashMap<>();
        levelGroup.put("02", 0);
        levelGroup.put("03", 0);
        levelGroup.put("04", 0);
        for(int i=0; i<itemList.size(); i++){
            String itemDiffCode = itemList.get(i).getDifficultyCode();  // 문제의 난이도
            if(!levelGroup.containsKey(itemDiffCode)){
                levelGroup.put(itemDiffCode, 0);
            }
            int temp = levelGroup.get(itemDiffCode);
            levelGroup.put(itemDiffCode, ++temp);
        }
        step2Response.setLevelGroup(levelGroup);

        // 총 문제 개수
        step2Response.setItemsTotalCnt((long) itemList.size());

        // log.info("moveToStep2: {}", step2Request.getChapterListJSONString().toString());

        // 단원 정보 List
        MinorClassification[] minorClassificationArray = objectMapper.readValue(step2Request.getChapterListJSONString(), MinorClassification[].class);
        List<MinorClassification> mList = Arrays.asList(minorClassificationArray);
        step2Response.setChapterList(mList);

        return step2Response;

        // mList.stream().forEach(m -> log.info("moveToStep2 mList : {}", m.toString()));
    }
}
