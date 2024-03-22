package com.sherpa.exambank.method.controller;

import com.sherpa.exambank.method.domain.*;
import com.sherpa.exambank.method.service.MethodService;
import com.sherpa.exambank.outapi.resonse.ResponseSeven;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RequiredArgsConstructor
@Controller
@Slf4j
@RequestMapping("/exambank/customExam")
public class MethodController {

    private final MethodService methodService;


    @GetMapping("/step0")
    public String getStep0Page(){
        return "customexam/step0";
    }

    @PostMapping("/step0")
    public String postStep0Page(@RequestParam("subjectId") String subjectId, Model model) throws InstantiationException, IllegalAccessException {

        List<String> subjectInfo = methodService.findSubjectNameBySubjectId(subjectId);
        model.addAttribute("subjectId", subjectId);
        model.addAttribute("subjectName", subjectInfo.get(0));
        model.addAttribute("curriculumName", subjectInfo.get(1));

        ArrayList<ExamGroupByLargeChapterResponse> examListResponse = methodService.findSettingListBySubjectId(subjectId);
        model.addAttribute("examListResponse",examListResponse);

        return "customexam/step0";
    }

}
