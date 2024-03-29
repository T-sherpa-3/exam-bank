package com.sherpa.exambank.step2.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.sherpa.exambank.step1.service.Step1Service;
import com.sherpa.exambank.step2.domain.*;
import com.sherpa.exambank.step2.service.StepTwoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class StepTwoController {

    private final Step1Service step1Service;
    private final StepTwoService stepTwoService;

    /*@GetMapping("/customExam/step2")
    public String getStep2Page(){
        return "customexam/step2";
    }*/

    // step 2 좌측 아이템 리스트
    /*@PostMapping ("/customExam/step2/left")
    public String postStep2Page(Model model) throws JsonProcessingException {
        List<ItemDTO> itemDTOList = stepTwoService.postResponse();
        model.addAttribute("itemDTOList",itemDTOList);
        log.info("itemDTOList : " + itemDTOList);
        return "customexam/step2";
    }*/


    /**
     * step 2 유사문제 버튼 ajaxCall
     * @param similarItemListRequest
     * @param model
     * @return
     * @throws JsonProcessingException
     */
    @PostMapping("/customExam/similar-List")
    @ResponseBody
    public ResponseEntity similarQueList(@RequestBody SimilarItemListRequest similarItemListRequest, Model model) throws JsonProcessingException {
        log.info("호출 성공 : "+ similarItemListRequest);
        ResponseEntity<SimilarItemListResponse> similarItemList = stepTwoService.similarItemList(similarItemListRequest);
        model.addAttribute("similarItemList",similarItemList);
        log.info("similar-List response : "+similarItemList);

        return new ResponseEntity<>(similarItemList, HttpStatus.OK) ;
    }


    /**
     * step 2 출제 범위 ajaxCall
     * @param itemListRequest
     * @param model
     * @return
     * @throws JsonProcessingException
     */
    @PostMapping("/customExam/range-list")
    @ResponseBody
    public ResponseEntity rangeList(@RequestBody ItemListRequest itemListRequest, Model model) throws JsonProcessingException {
        log.info("call rangeList = {} ",itemListRequest);
        ResponseEntity<ItemListResponse> chapterIdList = stepTwoService.getChapterList(itemListRequest);
        model.addAttribute("chapterIdList",chapterIdList);
        return new ResponseEntity<>(chapterIdList, HttpStatus.OK);
    }

    /**
     * 재검색 기능 ( step1Service 메서드 활용 )
     * @param step2Request
     * @return
     */
    @PostMapping("/customExam/step2/rescan")
    public ResponseEntity<Step2Response> rescan(@RequestBody Step2Request step2Request) {
        log.info("rescan request = {}",step2Request);
        Step2Response step2Response = step1Service.moveExamStep2(step2Request);
        return ResponseEntity.ok(step2Response);
    }

    @PostMapping("/customExam/step2")
    public String moveToStep2(@ModelAttribute("new_form") Step2Request step2Request, Model model) throws JsonProcessingException {
        Step2Response step2Response = stepTwoService.moveToStep2(step2Request);

        model.addAttribute("step2Response", step2Response);
        return "customexam/step2";
    }
}
