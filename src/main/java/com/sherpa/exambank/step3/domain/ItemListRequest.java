package com.sherpa.exambank.step3.domain;

import lombok.Data;

import java.util.List;

@Data
public class ItemListRequest {
    private List<Long> itemIdList;
}

