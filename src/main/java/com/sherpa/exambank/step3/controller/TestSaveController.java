package com.sherpa.exambank.step3.controller;

import com.sherpa.exambank.step3.domain.TestSaveDTO;
import com.sherpa.exambank.step3.service.TestSaveService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class TestSaveController {
    private final TestSaveService testSaveService;

    @PostMapping("/customExam/saveExamData")
    @ResponseBody
    public ResponseEntity<?> saveSecondResult(@RequestBody TestSaveDTO testSaveDTO) {
        log.info(String.valueOf(testSaveDTO));
        testSaveService.saveExamData(testSaveDTO);

        return ResponseEntity.status(HttpStatus.OK).body("");
    }

}
