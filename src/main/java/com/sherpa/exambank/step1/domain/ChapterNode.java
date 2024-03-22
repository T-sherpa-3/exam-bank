package com.sherpa.exambank.step1.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChapterNode {
    private String chapterId;
    private String chapterName;
    private String dataCode;
    private String chkId;
    private Integer count;
}
