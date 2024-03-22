package com.sherpa.exambank.step1.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Step1Response {
    private String successYn;
    private List<Evaluation> evaluationList;
    private List<Chapter> chapterList;
    private Map<String, LinkedHashMap<String, ChapterNode>> chapterTree;
}
