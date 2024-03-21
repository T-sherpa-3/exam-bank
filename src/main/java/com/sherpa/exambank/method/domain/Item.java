package com.sherpa.exambank.method.domain;

import lombok.Data;

@Data
public class Item {
    
    private String itemNo;
    private String itemId;
    private String questionFormCode;
    private String questionFormName;
    private String difficultyCode;
    private String difficultyName;
    private String largeChapterId;
    private String largeChapterName;
    private String mediumChapterId;
    private String mediumChapterName;
    private String smallChapterId;
    private String smallChapterName;
    private String topicChapterId;
    private String topicChapterName;
    private String passageId;
    private String passageUrl;
    private String questionUrl;
    private String answerUrl;
    private String explainUrl;
}
