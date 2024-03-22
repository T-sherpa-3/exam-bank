package com.sherpa.exambank.step3.mapper;

import com.sherpa.exambank.step3.domain.TestSaveDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TestSaveMapper {

    void insertExamData(TestSaveDTO testSaveDTO);

    void insertExamItemData(TestSaveDTO testSaveDTO);

    Long getMaxItemNo(Long seq);

    void updateItemCount(@Param("seq") Long seq, @Param("itemCnt") Long itemCnt);
}
