package com.sherpa.exambank.step2.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.sherpa.exambank.step2.domain.Step2Request;
import com.sherpa.exambank.step2.domain.Step2Response;
import com.sherpa.exambank.step2.service.Step2Service_jy;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class Step2Controller_jy {
    private final Step2Service_jy step2Service;

    @PostMapping("/customExam/step2/jy")
    public String moveToStep2(@ModelAttribute("new_form") Step2Request step2Request, Model model) throws JsonProcessingException {
        // log.info("moveToStep2 : {}", step2Request);
        Step2Response step2Response = step2Service.moveToStep2(step2Request);

        model.addAttribute("step2Response", step2Response);
        log.info("moveToStep2 : {}", String.valueOf(step2Response));
        return "customexam/step2";
    }
}
