package com.sherpa.exambank.step1.domain;

import com.sherpa.exambank.step2.domain.ItemDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class MoveExamStep2Item extends ItemDTO { // api #4 reponse
    private String passage;
    private String passageHtml;
    private String question;
    private String questionHtml;
    private String choice1Html;
    private String choice2Html;
    private String choice3Html;
    private String choice4Html;
    private String choice5Html;
    private String answer;
    private String answerHtml;
    private String explain;
    private String explainHtml;
}
