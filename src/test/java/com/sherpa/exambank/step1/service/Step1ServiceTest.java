package com.sherpa.exambank.step1.service;

import com.sherpa.exambank.step1.domain.MoveExamStep2Item;
import com.sherpa.exambank.step2.domain.Step2Request;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
class Step1ServiceTest {
    @Autowired
    private Step1Service step1Service;

    @Test
    void checkCntEqualYn() {
        // given
        // 테스트 데이터
        Step2Request step2Request = Step2Request.builder()
                .levelCnt(Arrays.asList("0", "10", "10", "10", "0"))
                .build();
        List<MoveExamStep2Item> itemList = new ArrayList<>();
        for(int i=0; i<2; i++) {
            itemList.add(MoveExamStep2Item.builder().difficultyCode("02").build());
        }
        for(int i=0; i<30; i++) {
            itemList.add(MoveExamStep2Item.builder().difficultyCode("03").build());
        }
        for(int i=0; i<6; i++) {
            itemList.add(MoveExamStep2Item.builder().difficultyCode("04").build());
        }

        // when
        int[] when = new int[7]; //step1Service.checkCntEqualYn(step2Request, itemList);

        // then
        assertEquals(when[6], 1);
        int[] answer = new int[]{0, 2, 22, 6, 0};
        for(int i=0; i<5; i++){
            assertEquals(when[i], answer[i]);
        }
    }
}