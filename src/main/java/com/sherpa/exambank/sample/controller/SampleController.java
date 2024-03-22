package com.sherpa.exambank.sample.controller;

import com.sherpa.exambank.sample.service.SampleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class SampleController {

    private final SampleService sampleService;

    @RequestMapping({"","/"})
    public String mainPage(){
        return "redirect:/exambank/booklist";
    }

    @RequestMapping("/sample")
    public String sampleHome(){
        return "sample";
    }

    @RequestMapping("/customTest/step0")
    public String methodPage(){
        return "customexam/step0";
    }

    @RequestMapping("/customTest/step1")
    public String firstStepPage(){
        return "customexam/step1";
    }

    @RequestMapping("/customTest/step2")
    public String secondStepPage(){
        return "customexam/step2";
    }

    @RequestMapping("/customTest/step3")
    public String thirdStepPage(){
        return "customexam/step3";
    }

    @RequestMapping("/customExam/complete")
    public String completePage(){
        return "customexam/complete";
    }

    @RequestMapping("/customExam/pdftest")
    public String pdfTestPage(){
        return "TestDirectory/Test2";
    }

}
