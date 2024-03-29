package com.sherpa.exambank.step1.controller;

import com.sherpa.exambank.step1.domain.Step1Response;
import com.sherpa.exambank.step1.domain.Subject;
import com.sherpa.exambank.step1.service.Step1Service;
import com.sherpa.exambank.step2.domain.Step2Request;
import com.sherpa.exambank.step2.domain.Step2Response;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@Tag(name = "step1", description = "step1 API")
@RequiredArgsConstructor
@Controller
@Slf4j
public class Step1Controller {
    private final Step1Service step1Service;

    /**
     * step1 페이지 출력
     * @param subject: 교과서, 교육과정
     * @param model
     * @return: 교과서 ID에 해당하는 단원 정보, 평가 영역을 넣어 jsp 반환
     * @throws ParseException
     */
    @PostMapping("/customExam/step1")
    public String postStep1Page(@ModelAttribute("Subject") Subject subject, Model model) throws ParseException {
        Step1Response step1Response = step1Service.step1Page(subject);
        model.addAttribute("chapterList", step1Response.getChapterList());   // 단원 정보
        model.addAttribute("evaluationList", step1Response.getEvaluationList());   // 평가 영역
        model.addAttribute("chapterTree", step1Response.getChapterTree());   // 단원 정보 트리
        model.addAttribute("subject", subject); // 교과서 정보

        return "customexam/step1";
    }

    // step2 이동전 문항수 확인
    // stepOne.js의 moveExamStep2()
    @PostMapping("/customExam/loadStep2")
    public ResponseEntity<Step2Response> moveExamStep2(@RequestBody Step2Request step2Request) {
        Step2Response step2Response = step1Service.moveExamStep2(step2Request);

        return ResponseEntity.ok(step2Response);
    }

    // 문항 수 그려주기
    @PostMapping("/customExam/step1/count")
    public ResponseEntity drawItemCounts(@RequestBody Map<String, String> map){
        // listSmallItemCount
        // listTopicItemCount
        // successYn
        return new ResponseEntity<>("test", HttpStatus.OK);
    }
}
