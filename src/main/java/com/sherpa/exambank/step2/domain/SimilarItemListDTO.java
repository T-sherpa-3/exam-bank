package com.sherpa.exambank.step2.domain;

import lombok.Data;

import java.util.List;

@Data
public class SimilarItemListDTO {

    private List<Long> itemIdList;

}
