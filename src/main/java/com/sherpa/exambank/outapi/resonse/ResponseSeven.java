package com.sherpa.exambank.outapi.resonse;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.sherpa.exambank.method.domain.Item;
import lombok.Data;

import java.util.List;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ResponseSeven {
    private String successYn;
    private List<Item> itemList;
}
