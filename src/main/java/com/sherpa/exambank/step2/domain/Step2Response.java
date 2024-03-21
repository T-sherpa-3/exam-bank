package com.sherpa.exambank.step2.domain;

import com.sherpa.exambank.step1.domain.MinorClassification;
import com.sherpa.exambank.step1.domain.MoveExamStep2Item;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Step2Response {
    private List<Long> queIdList;   // 출제한 문제 ID 리스트
    private String cntEqualYn;      // step1의 출제 옵션에 부합한지 여부 "Y", "N"
    private Long itemsTotalCnt;     // 총 문제 개수
    private Map<String, Integer> levelGroup;    // 난이도별 문제 개수 <난이도 코드, 문제 개수>
    // "02":하 - "03":중 - "04":상

    private String paperGubun;  // "new"
    private String subjectId;   // 교과서 ID
    private List<MinorClassification> chapterList;  // 단원 정보 리스트
    private List<Long> activityCategoryList;    // 평가영역
    private String questionForm; // 문제 형태

    private List<MoveExamStep2Item> itemList; // 문제 리스트
}

/*
{
    "queIdList": [
        493750,
        493751,
        493752,
        493754,
        493753,
        521085,
        521087,
        521088,
        521282,
        521285,
        521284
    ],
    "cntEqualYn": "N",
    "itemsTotalCnt": 11,
    "levelGroup": {
        "03": 9,
        "04": 2
    }
}
*/

/*

[
        {
subject: 2,
large: 115901
medium:11590103
small:1159010301},
        {
subject: 2,
large: 115901
medium:11590103
small:1159010301}]*/
