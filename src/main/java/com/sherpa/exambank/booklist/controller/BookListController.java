package com.sherpa.exambank.booklist.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@Controller
@Slf4j
@RequestMapping("/exambank")
public class BookListController {

    /**
     * 교재 목록 출력
     */
    @GetMapping("/booklist")
    public String getBookList() {
        return "exambank/main";
    }

    /**
     * 시험지 목록 출력
     */
    @GetMapping("/storage")
    public String getStorageList() {
        return "exambank/storage";
    }
}
