package com.sherpa.exambank.step3.domain;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ExamListDTO {
    private final String itemIdList;

//    @Builder.Default
//    private Long[] itemIdList = new Long[0];

    private int itemNo;
    private Long itemId;
    private String questionFormCode;
    private String questionFormName;
    private String difficultyCode;
    private String difficultyName;
    private Long largeChapterId;
    private String largeChapterName;
    private Long mediumChapterId;
    private String mediumChapterName;
    private Long smallChapterId;
    private String smallChapterName;
    private Long topicChapterId;
    private String topicChapterName;
    private Long passageId;
    private String passageUrl;
    private String questionUrl;
    private String answerUrl;
    private String explainUrl;


     //생성자에 @JsonCreator 어노테이션 추가
    @JsonCreator
    public ExamListDTO(@JsonProperty("itemIdList") String itemIdList) {
        this.itemIdList = itemIdList;
    }
}
