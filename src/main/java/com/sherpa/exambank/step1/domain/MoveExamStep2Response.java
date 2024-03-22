package com.sherpa.exambank.step1.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MoveExamStep2Response {
    private String errorCode;
    private String errorMessage;

    private String successYn;
    private List<MoveExamStep2Item> itemList;
}
