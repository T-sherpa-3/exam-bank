package com.sherpa.exambank.method.mapper;

import com.sherpa.exambank.method.domain.Item;
import com.sherpa.exambank.sample.domain.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ItemMapper {
    List<BoardDTO> getAllBoardList();

    int insertItem(Item item);
}
