package com.sherpa.exambank.step3.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sherpa.exambank.method.domain.Step0ExamResponse;
import com.sherpa.exambank.step3.domain.ItemListRequest;
import com.sherpa.exambank.step3.domain.ItemListResponse;
import com.sherpa.exambank.step3.domain.Step3ChapterResponse;
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

import java.net.URI;
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
}
