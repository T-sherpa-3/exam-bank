package com.sherpa.exambank.step3.domain;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ChapterList2 {

    /*
    response 형태
    {
        "curriculumCode": "15",
        "curriculumName": "2015개정 교육과정",
        "subjectId": "1136",
        "subjectName": "수학1(류희찬)",
        "largeChapterId": "113601",
        "largeChapterName": "Ⅰ. 소인수분해",
        "mediumChapterId": "11360101",
        "mediumChapterName": "1. 소수와 합성수",
        "smallChapterId": "1136010101",
        "smallChapterName": "1. 소수와 합성수",
        "topicChapterId": "113601010101",
        "topicChapterName": "거듭제곱으로 표현"
    }
     */
    private String curriculumCode;      // 교육과정
    private String curriculumName;
    private String subjectId;           // 교과서
    private String subjectName;
    private String largeChapterId;      // 대단원
    private String largeChapterName;
    private String mediumChapterId;     // 중단원
    private String mediumChapterName;
    private String smallChapterId;      // 소단원
    private String smallChapterName;
    private String topicChapterId;      // 토픽
    private String topicChapterName;

    // Jackson 오류로 인해서 객체를 JSON 내부 리스트로 사용할 때는 기본 생성자를 추가해야 함
    public ChapterList2() {
    }
}
