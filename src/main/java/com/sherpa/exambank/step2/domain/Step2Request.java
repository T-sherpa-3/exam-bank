package com.sherpa.exambank.step2.domain;

import com.sherpa.exambank.step1.domain.MinorClassification;
import com.sherpa.exambank.step1.domain.MoveExamStep2Item;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Step2Request {
    private List<MinorClassification> chapterList;
    private List<MinorClassification> minorClassification;
    private List<Long> activityCategoryList;    // 평가영역
    private List<String> levelCnt;  // 난이도별 문제 개수. 최하-하-중-상-최상
    private String questionForm;
    private List<Long> queArr;
    private String paperGubun;
    private String subjectId;

    private String chapterListJSONString;   // MoveToStep2
    private List<MoveExamStep2Item> itemList; // 문제 리스트
    private String itemListByForm; // 문제 리스트. stepOne.js에서 moveToStep2()를 통해 받음
}
