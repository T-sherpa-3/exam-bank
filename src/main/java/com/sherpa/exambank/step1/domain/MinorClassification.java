package com.sherpa.exambank.step1.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Objects;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MinorClassification {
    String subject;
    Long large;
    Long medium;
    Long small;
    Long topic;

    @Override
    public String toString() {
        return
                '{' +
                "\"subject\":\"" + subject + "\"" +
                ", \"large\":\"" + large +  "\"" +
                ", \"medium\":\"" + medium +  "\"" +
                ", \"small\":\"" + small +  "\"" +
                ", \"topic\":\"" + topic +  "\"" +
                "}";
    }
}
