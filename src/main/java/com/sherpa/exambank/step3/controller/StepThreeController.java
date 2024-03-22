package com.sherpa.exambank.step3.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.sherpa.exambank.step3.domain.*;
import com.sherpa.exambank.step3.service.StepThreeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class StepThreeController {

    private final StepThreeService stepThreeService;

    ItemListRequest itemListRequest = new ItemListRequest();


    @GetMapping("/customExam/step3")
    public String getStepThree(Model model, String subjectId) {
            return "customexam/step3";
    }

    @PostMapping("/customExam/step3")
    public String postStep3Page(/*@RequestParam("itemIdList") String itemIdList, */Model model) throws InstantiationException, IllegalAccessException {

////        // 교과서 정보 얻어오기
////        Step3ChapterResponse step3ChapterResponse =  stepThreeService.postChapterListBySubjectId(subjectId);
////        String subjectName = step3ChapterResponse.getChapterList().get(0).getSubjectName();
////        String curriculumName = step3ChapterResponse.getChapterList().get(0).getCurriculumName();
//
//        // 문제 정보
//        ItemListResponse itemListResponse =  stepThreeService.postByItemIdList(itemIdList);
//        List<ExamListDTO> examListDTOList = itemListResponse.getItemList();
//
//        HashMap<String,String> largeChapterMap = new HashMap<>(); // largeChapterId, largeChapterName
//
//        ArrayList<String> largeChapterIdList = new ArrayList<>();
//        ArrayList<String> largeChapterNameList = new ArrayList<>();
//        ArrayList<ArrayList<String>> examListByLargeChapterId = new ArrayList<>();
//
//        for (ExamListDTO exam : examListDTOList) {
//
//            // 대단원 id 추출 후 리스트 추가
//            String largeChapterId = String.valueOf(exam.getLargeChapterId());
//            if (!largeChapterIdList.contains(largeChapterId)) {
//                largeChapterIdList.add(largeChapterId);
//            }
//
//            // 대단원 name 추출 후 리스트 추가
//            String largeChapterName = exam.getLargeChapterName();
//            if (!largeChapterNameList.contains(largeChapterName))
//                largeChapterNameList.add(largeChapterName);
//
//            // 대단원 Id 포함 시험지 정보 추출 후 리스트 추가
//            ArrayList<String> ExamInfo = new ArrayList<>();
//            ExamInfo.add(largeChapterId);
////            ExamInfo.add(exam.getExamId());
////            ExamInfo.add(exam.getExamName());
////            ExamInfo.add(String.valueOf(exam.getItemCnt()));
//            examListByLargeChapterId.add(ExamInfo);
//        }
//        largeChapterIdList.sort(String::compareTo);
//        log.info(largeChapterIdList.toString());
//        largeChapterNameList.sort(String::compareTo);
//        log.info(largeChapterNameList.toString());
//
//
//        // 새로운 코드 추가
//        ArrayList<ExamByLargeChapterResponse> examByLargeChapterResponses = new ArrayList<>();
//        for (String id : largeChapterIdList) {
//            // 대단원 ID와 대단원 이름을 이용하여 ExamByLargeChapterResponse 객체를 생성하고 리스트에 추가
//            examByLargeChapterResponses.add(new ExamByLargeChapterResponse(id, largeChapterNameList.get(largeChapterIdList.indexOf(id))));
//        }
//
//// 시험 정보를 대단원 별로 매핑하여 ExamByLargeChapterResponse 객체에 추가
//        for (ArrayList<String> examInfo : examListByLargeChapterId) {
//            for (String id : largeChapterIdList) {
//                if (String.valueOf(examInfo.get(0)).equals(id)) {
//                    // 대단원 ID와 일치하는 ExamByLargeChapterResponse 객체를 찾고 시험 정보를 추가
//                    ExamByLargeChapterResponse matchedResponse = examByLargeChapterResponses.get(largeChapterIdList.indexOf(id));
//                    matchedResponse.getExamInfoList().add(new ExamByLargeChapterResponse.ExamInfo(
//                            examInfo.get(1), examInfo.get(2), examInfo.get(3)
//                    ));
//                }
//            }
//        }
//        log.info(String.valueOf(examByLargeChapterResponses));
//        model.addAttribute("response",examByLargeChapterResponses);
////        model.addAttribute("chapterList", step3ChapterResponse.getChapterList());
//        model.addAttribute("itemIdList", itemListResponse.getItemList());

        return "customexam/step3";
    }

//    @PostMapping("/customeexam/step3")
//    public String postStepThree(Model model) throws JsonProcessingException {
//        List<ExamListDTO> examListDTOList = stepThreeService.postResponse();
//        log.info("examListDTOList: " + examListDTOList);
//        model.addAttribute("examListDTOList", examListDTOList);
//        return "customexam/step3"; // 모델 반환
//    }

    @GetMapping("/customExam/rangeList")
    public String getStepThree(Model model, ItemListRequest itemListRequest) {
        try {
            List<ItemListResponse> itemIdList = (List<ItemListResponse>) stepThreeService.getChapterThreeList(itemListRequest);
            model.addAttribute("itemIdList", itemIdList);
            return "customexam/step3"; // JSP 페이지 이름
        } catch (Exception e) {
            // 오류 처리
            log.error("Error occurred while fetching range list: " + e.getMessage());
            return "error-page"; // 에러 페이지로 이동하거나 다른 처리를 할 수 있음
        }
    }

    @PostMapping("/customExam/rangeList")
    @ResponseBody
    public ResponseEntity<ItemListResponse> rangeList(@RequestBody ItemListRequest itemListRequest) throws JsonProcessingException {
        log.info("call rangeList");

        try {
            ItemListResponse itemListResponse = stepThreeService.getChapterThreeList(itemListRequest).getBody();
            return new ResponseEntity<>(itemListResponse, HttpStatus.OK);
        } catch (HttpClientErrorException.BadRequest e) {
            // 서버에서 400 오류를 받았을 때 처리할 코드 추가
            log.error("Server returned a 400 Bad Request error: " + e.getRawStatusCode() + " - " + e.getStatusText());
            // 클라이언트에게 적절한 오류 메시지를 반환할 수 있도록 처리
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

/*    @PostMapping("/customExam/step3")
    @ResponseBody
    public ResponseEntity loadStep3(@RequestBody ){

    }*/

}

