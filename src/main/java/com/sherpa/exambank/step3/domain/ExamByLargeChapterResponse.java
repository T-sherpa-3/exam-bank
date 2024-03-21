package com.sherpa.exambank.step3.domain;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

//@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class ExamByLargeChapterResponse {

    /*
    response 형태
    {
        "largeChapterId": "115901",
        "largeChapterName": "1. 문학의 샘",
        "examInfoList": [
            {
                "examId": 768,
                "examName": "중_ 국어 3-2(노)_1-1_단원평가_1회_T셀파",
                "itemCnt": "22"
            },
            {
                "examId": 768,
                "examName": "중_ 국어 3-2(노)_1-1_단원평가_1회_T셀파",
                "itemCnt": "22"
            }
            ...
        ]
    }
     */

    private String largeChapterId;
    private String largeChapterName;
    private List<ExamInfo> examInfoList;

    @Data
    public static class ExamInfo{
        private String examId;
        private String examName;
        private String itemCnt;

        public ExamInfo(String examId, String examName, String itemCnt) {
            this.examId = examId;
            this.examName = examName;
            this.itemCnt = itemCnt;
        }
    }

    public ExamByLargeChapterResponse(String largeChapterId, String largeChapterName) {
        this.largeChapterId = largeChapterId;
        this.largeChapterName = largeChapterName;
        this.examInfoList = new ArrayList<>();
    }
}
