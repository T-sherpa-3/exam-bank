package com.sherpa.exambank.step1.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class Subject {
    protected String curriculumCode;      // 교육과정
    protected String curriculumName;
    protected String subjectId;           // 교과서
    protected String subjectName;
}
