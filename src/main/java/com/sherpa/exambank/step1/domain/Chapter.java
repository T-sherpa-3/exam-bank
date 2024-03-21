package com.sherpa.exambank.step1.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class Chapter extends Subject{
    // private Long subjectId;     // 교과서 ID

    private Long domainId;      // 평가 영역 ID
    private String domainName;  // 평가 영역 명

    /*private String curriculumCode;      // 교육과정
    private String curriculumName;
    private String subjectId;           // 교과서
    private String subjectName;*/
    private String largeChapterId;      // 대단원
    private String largeChapterName;
    private String mediumChapterId;     // 중단원
    private String mediumChapterName;
    private String smallChapterId;      // 소단원
    private String smallChapterName;
    private String topicChapterId;      // 토픽
    private String topicChapterName;



}
