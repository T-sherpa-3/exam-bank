package com.sherpa.exambank.step3.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sherpa.exambank.step1.domain.MoveExamStep2Item;
import com.sherpa.exambank.step3.domain.*;
import com.sherpa.exambank.step3.mapper.StepThreeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.DataInput;
import java.io.IOException;
import java.net.URI;
import java.util.Arrays;
import java.util.List;

import org.springframework.http.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class StepThreeService {

    private final StepThreeMapper stepThreeMapper;

    @Value("${tsherpa.api.url}")
    private String tsherpaURL;

//    public Step3ChapterResponse postChapterListBySubjectId(String subjectId) throws InstantiationException, IllegalAccessException {
//        // 요청 url
//        URI uri = UriComponentsBuilder
//                .fromUriString(tsherpaURL)
//                .path("/chapter/chapter-list") // api #1 교재별 단원 리스트 조회
//                .encode()
//                .build()
//                .toUri();
//
//        // 요청 httpEntity의 header 생성
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//        // 요청 httpEntity의 body에 포함 될 jsonObject 생성
//        JSONObject step3RequestJson = new JSONObject();
//        step3RequestJson.put("subjectId", subjectId);
//
//        HttpEntity<String> request = new HttpEntity<>(step3RequestJson.toString(), headers);
//        log.info("postwithParamAndBody request : " + request);
//
//        // post 요청 및 응답
//        RestTemplate restTemplate = new RestTemplate();
//        Step3ChapterResponse step3ChapterResponse = restTemplate.postForObject(
//                uri, request, Step3ChapterResponse.class
//        );
//
//        log.info(step3ChapterResponse.toString());
//
//        // [*****] null일 경우 예외처리
//
//        return step3ChapterResponse;
//
//    }

//    /**
//     * step 3 출제 범위
//     * @param itemListRequest
//     * @return
//     * @throws JsonProcessingException
//     */


    public ResponseEntity<ItemListResponse> getChapterThreeList(ItemListRequest itemListRequest) throws JsonProcessingException {
        URI uri = UriComponentsBuilder
                .fromUriString(tsherpaURL)
                .path("/item-img/item-list") // api #9 문항id 배열로 티셀파 문항 리스트 조회
                .encode()
                .build()
                .toUri();
        // 요청 httpEntity의 Header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // 요청 HttpEntity의 body에 포함될 JSONObject 생성
        ObjectMapper objectMapper = new ObjectMapper();

        // itemListRequest에서 요청할 데이터를 jsonobject로 변환
        String itemListRequestJsonObj = objectMapper.writeValueAsString(itemListRequest);
        log.info("itemListRequestJsonObj : "+ itemListRequestJsonObj);
        // itemList에 header 정보 넣은 객체 생성
        HttpEntity<String> itemListIncHeader = new HttpEntity<>(itemListRequestJsonObj,headers);
        log.info("itemListIncHeader : " + itemListIncHeader);
        // RestTemplate 인스턴스 생성
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<ItemListResponse> responseItemListDTO = restTemplate.postForEntity(uri,itemListIncHeader, ItemListResponse.class);
        log.info("responseItemListDTO : " + responseItemListDTO);
        return responseItemListDTO;
    }

    public ItemListResponse postByItemIdList(String itemIdList) {
        // 요청 url
        URI uri = UriComponentsBuilder
                .fromUriString(tsherpaURL)
                .path("/item-img/item-list")
                .encode()
                .build()
                .toUri();

        // 요청 httpEntity의 header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // 요청 httpEntity의 body에 포함 될 jsonObject 생성
        JSONObject step3RequestJson = new JSONObject();
        step3RequestJson.put("itemIdList", itemIdList);

        HttpEntity<String> request = new HttpEntity<>(step3RequestJson.toString(), headers);
        log.info("postwithParamAndBody request : " + request);

        // post 요청 및 응답
        RestTemplate restTemplate = new RestTemplate();
        ItemListResponse itemListResponse = restTemplate.postForObject(
                uri, request, ItemListResponse.class
        );

        log.info(itemListResponse.toString());

        // [*****] null일 경우 예외처리

        return itemListResponse;

    }

    public Step3Response moveToStep3(Step3Request step3Request) {
        Step3Response step3Response = Step3Response.builder()
                .queIdList(step3Request.getQueArr())
                .subjectName(step3Request.getSubjectName())
                .build();
        log.info("moveToStep3 Service ::::: = {}",step3Response);

        /*MoveExamStep2Item[] itemArray = objectMapper.readValue(step2Request.getItemListByForm(), MoveExamStep2Item[].class);
        List<MoveExamStep2Item> itemList = Arrays.asList(itemArray);
        step2Response.setItemList(itemList);*/

        // Step3Response[]

        return step3Response;
    }
}
