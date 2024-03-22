package com.sherpa.exambank.step3.domain;

import lombok.Data;

import java.util.List;

@Data
public class ItemListResponse {
    private String successYn;
    private List<ExamListDTO> itemList;
}
