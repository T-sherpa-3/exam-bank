package com.sherpa.exambank.step3.domain;

import com.sherpa.exambank.step2.domain.ItemDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
public class Step3Response {
    private List<Long> queIdList;
    private String subjectName;

    private List<Step3Request> step3RequestList;
}
