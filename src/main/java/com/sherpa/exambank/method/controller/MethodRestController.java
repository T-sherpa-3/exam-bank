package com.sherpa.exambank.method.controller;

import com.sherpa.exambank.method.domain.ExamGroupByLargeChapterResponse;
import com.sherpa.exambank.method.domain.SettingExamRequest;
import com.sherpa.exambank.method.service.MethodService;
import com.sherpa.exambank.outapi.resonse.ResponseSeven;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@RestController
@Slf4j
@RequestMapping("/exambank/customExamAPI")
public class MethodRestController {

    private final MethodService methodService;


    @PostMapping("/getSettingItemList")
    @ResponseBody
    public ResponseSeven getSettingItemList(@RequestBody SettingExamRequest settingExamRequest) throws InstantiationException, IllegalAccessException {
        log.info("test "+String.valueOf(settingExamRequest));
        // if(저장된 시험지가 없다면)
        ResponseSeven response = methodService.findItemListBySettingExamId(settingExamRequest);


        return response;
    }


}
