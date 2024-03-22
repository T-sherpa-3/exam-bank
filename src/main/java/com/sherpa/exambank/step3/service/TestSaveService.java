package com.sherpa.exambank.step3.service;

import com.sherpa.exambank.step3.domain.TestSaveDTO;
import com.sherpa.exambank.step3.mapper.TestSaveMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class TestSaveService {

    private final TestSaveMapper testSaveMapper;

    public void saveExamData(TestSaveDTO testSaveDTO) {
        // 시험지 정보 저장
        testSaveMapper.insertExamData(testSaveDTO);
        log.info(String.valueOf(testSaveDTO));

        // 시험지 문항 정보 저장
        testSaveMapper.insertExamItemData(testSaveDTO);

        // item_cnt 업데이트
        updateItemCount(testSaveDTO);
    }

    private void updateItemCount(TestSaveDTO testSaveDTO) {
        Long maxItemNo = testSaveMapper.getMaxItemNo(testSaveDTO.getSeq());
        if (maxItemNo != null) {
            testSaveMapper.updateItemCount(testSaveDTO.getSeq(), maxItemNo + 1);
        }
    }
}
