package com.sherpa.exambank.step3.domain;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class TestSaveDTO {
    private Long seq; // 시험지 시퀀스 넘버
    private String paperTitle; // 시험지명
    private List<Long> itemIdList; // 문항ID리스트
    private String subjectName;// 교과서명
}