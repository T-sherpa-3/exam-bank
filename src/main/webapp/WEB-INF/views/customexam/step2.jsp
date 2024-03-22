<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>T셀파 문제은행</title>

  <link rel="stylesheet" href="/resource/popup/css/swiper-bundle.min.css">
  <link rel="stylesheet" href="/resource/popup/css/jquery-ui.css">

  <link rel="stylesheet" href="/resource/popup/css/font.css">
  <link rel="stylesheet" href="/resource/popup/css/reset.css">
  <link rel="stylesheet" href="/resource/popup/css/common.css">
  <!-- S 230808 순서 변경-->
  <script src="/resource/popup/js/jquery-1.12.4.min.js"></script>
  <script src="/resource/popup/js/jquery-3.6.0.min.js"></script>
  <script src="/resource/popup/js/jquery-ui.js"></script>
  <script src="/resource/popup/js/swiper-bundle.min.js"></script>
  <!-- E 230808 순서 변경-->
  <script type="text/javascript" src="/resource/popup/js/common_que.js"></script>
  <script type="text/javascript" src="/resource/popup/js/lodash.min.js"></script>
  <script type="text/javascript" src="/resource/common/js/legacy_common.js"></script>
  <script type="text/javascript" src="/resource/midhigh/js/common.js"></script>
  <script type="text/javascript" src="/resource/popup/js/stepTwo.js"></script>
  <%--  <script type="text/javascript" src="/resource/popup/js/stepTwo-mod.js"></script>--%>

</head>
<body>
<div id="wrap" class="full-pop-que">
  <div class="full-pop-wrap">

    <%-- step 정보 --%>
    <div class="pop-header">
      <ul class="title" id="custom-pop-header-title">
        <li style="display:none" id="custom-step0"><img src="/resource/popup/img/ico_step_active.png" alt="">출제 방법 선택
        </li>
        <li class="" id="custom-step1">STEP 1 단원선택</li>
        <li id="custom-step2" class="active">STEP 2 문항 편집</li>
        <li id="custom-step3">STEP 3 시험지 저장</li>
      </ul>
      <button type="button" class="del-btn" onclick="winClose();"></button>
    </div>

    <script>

      function activeText(step) {
        $("#custom-pop-header-title").children().siblings().removeClass("active");
        $("#custom-step" + step).addClass("active");
        if (step === 0) {
          $('#custom-step0').show();
          $("#custom-pop-header-title").children().not('#custom-step0').remove();
        }
      }

      function winClose() {
        if (confirm('이 페이지에서 나가시겠습니까?')) {
          window.open('', '_self', '').close();
        }
      }

    </script>

    <%-- 내용 영역 --%>
    <div class="pop-content">
      <div class="view-box">
        <input type="hidden" id="paperGubun" value="new">
        <input type="hidden" id="subjectId" value="1159">
        <input type="hidden" id="subjectName" value="국어3-2(노미숙)">
        <input type="hidden" id="areaCode" value="KO">
        <input type="hidden" id="backYn" value="">

        <%-- 내용 영역 헤더 --%>
        <div class="view-top">
          <div class="paper-info">
            <span>국어3-2(노미숙)</span>-2015개정 교육과정
          </div>
          <button class="btn-default btn-research" onclick="rescan()"><i class="research"></i>재검색</button>
          <button class="btn-default" id="btn-range">출제범위</button>
        </div>

        <%-- 내용 영역 메인 --%>
        <div class="view-bottom type01">
          <%-- 좌측 영역 --%>
          <div class="cnt-box">
            <%-- 좌측 헤더 (정렬 버튼 등) --%>
            <div class="cnt-top">
              <span class="title">문제 목록</span>
              <div class="right-area">
                <%-- 정답 및 해설 보기 옵션 설정 --%>
                <div class="select-wrap">
                  <button type="button" class="select-btn" id="select-view-btn" data-select="type1">문제만 보기</button>
                  <ul class="select-list" id="select-view-list">
                    <li>
                      <a href="javascript:void(0);" data-columns="type1">문제만 보기</a>
                    </li>
                    <li>
                      <a href="javascript:void(0);" data-columns="type2">문제+정답 보기</a>
                    </li>
                    <li>
                      <a href="javascript:void(0);" data-columns="type3">문제+정답+해설 보기</a>
                    </li>
                    <li class="disabled">
                      <a href="javascript:;">편집단계에서만 적용되는 보기 옵션</a>
                    </li>
                  </ul>
                </div>
                <%-- 정렬 옵션 --%>
                <div class="select-wrap">
                  <button type="button" class="select-btn" id="select-sort-btn">단원순</button>
                  <ul class="select-list" id="select-sort-list">
                    <li>
                      <a href="javascript:void(0);" data-columns="default">사용자 정렬</a>
                    </li>
                    <li class="active">
                      <a href="javascript:void(0);" data-columns="unit">단원순</a>
                    </li>
                    <li>
                      <a href="javascript:void(0);" data-columns="level">난이도순</a>
                    </li>
                    <li>
                      <a href="javascript:void(0);" data-columns="type">문제 형태순</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>

            <%-- 좌측 메인 (문항 리스트) --%>
            <div class="view-que-list scroll-inner" style="display: -webkit-box;-webkit-box-orient:vertical"
                 id="view-que-detail-list">

              <c:choose>
                <c:when test="${empty step2Response.itemList}">
                  <div class="view-que-list no-data" id="no-data-detail-area"
                       style="display:none">   <%--나중에 style 적용 해제 해야됨--%>
                    <p>문항이 없습니다.</p>
                  </div>
                </c:when>

                <c:otherwise>
                  <c:forEach items="${step2Response.itemList}" var="dto" varStatus="status">
                    <%--지문+문항--%>
                    <%-- 지문 영역 --%>
                    <div class="passage-view-que-box sort-group" data-sortnum=""
                         data-sortvalue="${(dto.largeChapterId)+(dto.mediumChapterId)+(dto.smallChapterId)+(dto.topicChapterId)}">

                      <c:if test="${dto.passageId != null}">
                        <div class="view-que-box passage-box" data-passageid="${dto.passageId}">
                          <div class="que-top">
                            <div class="title"><span class="num"></span></div>
                            <div class="btn-wrap delete-btn-wrap">
                              <button type="button" class="btn-delete" data-type="all"></button>
                            </div>
                          </div>
                          <div class="view-que">
                            <div class="que-bottom">
                              <div class="passage-area"><img src="${dto.passageUrl}" alt="${dto.passageId}"
                                                             width="453px">
                              </div>
                              <div class="btn-wrap etc-btn-wrap" style="margin-top: 10px; display: none">
                                <button type="button" class="btn-default btn-add" data-type="all"><i
                                        class="add-type02"></i>전체 추가
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </c:if>
                        <%-- 문항 영역 --%>
                      <c:if test="${dto.itemId != null}">
                        <div class="view-que-box item-box" data-paperTitle="">
                          <div class="que-top">
                            <div class="title">
                              <span class="num"></span>
                              <div class="que-badge-group">
                                  <span class="que-badge"
                                        id="difficultyColor">${dto.difficultyName}</span>
                                <span class="que-badge gray">${(dto.questionFormCode)}</span>
                                <input type="hidden" id="questionId" value="${dto.itemId}">
                                <input type="hidden" id="questionNo" value="${dto.itemNo}">
                                <input type="hidden" id="chapterGp"
                                       value="${dto.largeChapterId}${dto.mediumChapterId}${dto.smallChapterId}${dto.topicChapterId}">
                                <input type="hidden" id="chapterName"
                                       value="${dto.largeChapterName}&nbsp;&gt;&nbsp;${dto.mediumChapterName}&nbsp;&gt;&nbsp;${dto.smallChapterName}&nbsp;&gt;&nbsp;${dto.topicChapterName}">
                                <input type="hidden" id="difficultyCode" value="${dto.difficultyCode}">
                                <input type="hidden" id="questionFormCode" value="${dto.questionFormCode}">
                              </div>
                            </div>
                            <div class="btn-wrap delete-btn-wrap">
                                <%-- 문항 오류 신고 항목 => 구현 x (2024.03.20) --%>
                                <%--<span class="tooltip-wrap">
                                  <button type="button" class="btn-error pop-btn" data-pop="error-report-pop"></button>
                                  <span class="tooltip type02">
                                      <div class="tool-type01">문항오류신고</div>
                                  </span>
                                </span>--%>
                              <button type="button" class="btn-delete"></button>
                            </div>
                          </div>
                          <div class="view-que">
                              <%-- 문항 이미지 --%>
                            <div class="que-content">
                              <img src="${dto.questionUrl}" alt="${dto.itemId}" width="453px">
                            </div>
                            <div class="que-bottom">
                              <div class="data-area">
                                  <%-- 정답 이미지 --%>
                                <div class="que-info answer-area" style="display: none">
                                  <p class="answer"><span class="label type01">정답</span></p>
                                  <div class="data-answer-area"><img src="${dto.answerUrl}" alt="${dto.itemId}"
                                                                     width="453px"></div>
                                </div>
                              </div>
                                <%-- 해설 이미지 및 유사 문항 버튼 --%>
                              <div class="data-area type01">
                                  <%-- 해설 이미지 --%>
                                <div class="que-info explain-area" style="display: none">
                                  <p class="answer"><span class="label">해설</span></p>
                                  <div class="data-answer-area"><img
                                          src="${dto.explainUrl}"
                                          alt="${dto.itemId}" width="453px"></div>
                                </div>
                                <div class="btn-wrap etc-btn-wrap">
                                  <button type="button" class="btn-similar-que btn-default"><i class="similar"></i>유사
                                    문제
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                            <%-- 문항 정보 --%>
                          <div class="que-info-last"
                               title="${dto.largeChapterName} > ${dto.mediumChapterName} > ${dto.smallChapterName} > ${dto.topicChapterName}">
                            <p class="chapter">
                                ${dto.largeChapterName} > ${dto.mediumChapterName} > ${dto.smallChapterName} >
                                    ${dto.topicChapterName}
                            </p>
                          </div>
                        </div>
                      </c:if>
                    </div>

                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </div>

            <%-- 난이도별 문항 수 카운트 --%>
            <div class="bottom-box">
              <div class="que-badge-group type01">
                <div class="que-badge-wrap" id="badge-level-1" style="display: none">
                  <span class="que-badge oceanblue">최하</span>
                  <span class="num" id="level-1"></span>
                </div>
                <div class="que-badge-wrap" id="badge-level-2" style="">
                  <span class="que-badge purple">하</span>
                  <span class="num" id="level-2">${step2Response.levelGroup.get("02")}</span>
                </div>
                <div class="que-badge-wrap" id="badge-level-3" style="">
                  <span class="que-badge green">중</span>
                  <span class="num" id="level-3">${step2Response.levelGroup.get("03")}</span>
                </div>
                <div class="que-badge-wrap" id="badge-level-4" style="">
                  <span class="que-badge yellow">상</span>
                  <span class="num" id="level-4">${step2Response.levelGroup.get("04")}</span>
                </div>
                <div class="que-badge-wrap" id="badge-level-5" style="display: none">
                  <span class="que-badge pink">최상</span>
                  <span class="num" id="level-5"></span>
                </div>
              </div>
              <div style="content: ''; display: block; clear: both; background: #a7a7a7; width: 1px; height: 14px;
              margin-left: 15px; margin-right: 15px;"></div>
              <p class="total-num">총 <span>${step2Response.itemsTotalCnt.toString()}</span>문제</p>
            </div>
          </div>

          <%-- 우측 영역 --%>
          <div class="cnt-box type03" id="tab-box">
            <div class="tab-wrap">
              <%-- 메뉴 버튼 --%>
              <ul class="tab-menu-type01" id="tab-right-group">
                <li class="ui-tab-btn active" id="tab-summary">
                  <a href="javascript:">문제지 요약</a>
                </li>
                <li class="ui-tab-btn" id="tab-similar">
                  <a href="javascript:">유사 문제</a>
                </li>
                <li class="ui-tab-btn" id="tab-delete">
                  <a href="javascript:">삭제 문항</a>
                </li>
              </ul>

              <!--s:문제지 요약-->
              <div class="contents on" id="content-summary-area">
                <div class="table half-type ">
                  <div class="fix-head">
                    <span>이동</span>
                    <span>번호</span>
                    <span>문제 유형</span>
                    <span>문제 형태</span>
                    <span>난이도</span>
                  </div>
                  <div class="tbody">
                    <div class="scroll-inner">
                      <div class="test ui-sortable" id="table-1">

                        <!-- s: 지문 묶음 영역 -->
                        <!-- e : 지문 묶음 영역-->

                      </div>
                    </div>
                  </div>
                </div>
                <div class="bottom-box">
                  <div class="que-badge-group">
                    <div class="que-badge-wrap" id="badge-form-multiple" style="">
                      <span class="que-badge gray">객관식</span>
                      <span class="num" id="num-multiple">22</span>
                    </div>
                    <div class="que-badge-wrap" id="badge-form-subjective" style="">
                      <span class="que-badge gray">주관식</span>
                      <span class="num" id="num-subjective">8</span>
                    </div>
                  </div>
                </div>
              </div>
              <!--e:문제지 요약-->

              <%-- 유사 문항 --%>
              <div class="contents" id="contents-similar-area">
                <div class="view-que-list no-data" id="init-similar-area" style="display: none">
                  <p>
                    문제 목록에서 <i class="ic-no-data"></i> 유사문제 버튼을 선택해주세요.
                  </p>
                </div>
                <div id="list-similar-area" style="display: none">
                  <div class="cnt-top">
                    <span class="title" id="similar-title">2번 유사 문제</span>
                    <input type="hidden" id="target-sort-num" value="">
                    <input type="hidden" id="target-lastItem-num" value="">
                    <div class="right-area">
                      <div class="select-wrap">
                        <button type="button" class="select-btn" id="similar-level-btn" value="">난이도 전체</button>
                        <ul class="select-list" id="similar-level-list">
                          <li>
                            <a href="javascript:void(0);" data-columns="">난이도 전체</a>
                          </li>
                          <li>
                            <a href="javascript:void(0);" data-columns="05">최상</a>
                          </li>
                          <li>
                            <a href="javascript:void(0);" data-columns="04">상</a>
                          </li>
                          <li>
                            <a href="javascript:void(0);" data-columns="03">중</a>
                          </li>
                          <li>
                            <a href="javascript:void(0);" data-columns="02">하</a>
                          </li>
                          <li>
                            <a href="javascript:void(0);" data-columns="01">최하</a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="view-que-list scroll-inner" id="item-similar-area"></div>
                </div>
              </div>

              <%-- 삭제 문항 --%>
              <div class="contents" id="contents-delete-area">
                <div class="view-que-list no-data" id="init-delete-area" style="">
                  <p>삭제한 문항이 없습니다.</p>
                </div>
                <div class="view-que-list scroll-inner" id="item-delete-area" style="display:none "></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <%-- step 이동 버튼 --%>
    <div class="step-btn-wrap">
      <button type="button" class="btn-step" id="step-prev-btn">STEP 1 단원 선택</button>
      <button type="button" class="btn-step next" id="step-3-btn">STEP 3 시험지 저장</button>
    </div>
  </div>
</div>

<div class="dim"></div>

<!-- 문항 오류 신고 팝업 -->
<div class="pop-wrap table-type" data-pop="error-report-pop" id="pop-error-report">
  <div class="pop-inner">
    <div class="pop-header">
      <span>문항 오류 신고</span>
      <button type="button" class="pop-close"></button>
    </div>
    <div class="pop-content">
      <form id="error-report-form" method="post" enctype="multipart/form-data">
        <table>
          <colgroup>
            <col width="30%">
            <col width="*">
          </colgroup>
          <tbody>
          <tr>
            <th>오류유형</th>
            <td>
              <div class="select-wrap">
                <input type="hidden" id="hidden-type" name="type" value="q_error">
                <button type="button" class="select-btn" id="btn-select-error">문제오류</button>
                <ul class="select-list" id="select-error-list">

                  <li id="q_error">
                    <a>문제오류</a>
                  </li>

                  <li id="a_error">
                    <a>정답오류</a>
                  </li>

                  <li id="e_error">
                    <a>풀이오류</a>
                  </li>

                  <li id="i_error">
                    <a>이미지오류</a>
                  </li>

                  <li id="p_type_error">
                    <a>유형오류</a>
                  </li>

                  <li id="etc_error">
                    <a>기타</a>
                  </li>

                </ul>
              </div>
            </td>
          </tr>
          <tr>
            <th>첨부파일</th>
            <td class="file">
              <input type="file" id="file-error" name="file" onchange="changeFile(this)"
                     accept=".jpg,.jpeg, .png, .hwp" style="display: none">
              <input type="text" id="error-file-name" placeholder="최대 100MB까지 등록가능" disabled="">
              <button type="button" class="btn-icon" id="btn-upload-error">파일 첨부</button>
            </td>
          </tr>
          <tr>
            <th>오류 내용</th>
            <td>
              <textarea name="content" id="txt-error-area" cols="30" rows="8"
                        placeholder="오류내용을 간단히 적어주세요. (최대 200자)"></textarea>
              <input type="hidden" id="question-id-error" name="questionId">
            </td>
          </tr>
          </tbody>
        </table>
      </form>
    </div>
    <div class="pop-footer">
      <button type="button" id="btn-report-error">신고하기</button>
    </div>
  </div>
</div>

<!-- 재검색 팝업 -->
<div class="pop-wrap range-type02" data-pop="que-pop">
  <div class="pop-inner">
    <input type="hidden" id="nxt-data" value="">
    <div class="pop-header">
      <span>문항 재검색</span>
      <button type="button" class="pop-close"></button>
    </div>
    <div class="pop-content">
      <span class="txt">문항 구성이 자동으로 변경됩니다.</span>

      <div class="range-wrap">
        <div class="range" id="pop-level1" style="display: none">
          <span class="color01">최하</span>
          <span class="num">2</span>
        </div>
        <div class="range" id="pop-level2" style="display: none">
          <span class="color02">하</span>
          <span class="num">5</span>
        </div>
        <div class="range" id="pop-level3" style="display: none">
          <span class="color03">중</span>
          <span class="num">6</span>
        </div>
        <div class="range" id="pop-level4" style="display: none">
          <span class="color04">상</span>
          <span class="num">5</span>
        </div>
        <div class="range" id="pop-level5" style="display: none">
          <span class="color05">최상</span>
          <span class="num">2</span>
        </div>
        <div class="range total" id="pop-total-sum">
          <span>합계</span>
          <span class="num">20</span>
        </div>
      </div>
      <span class="txt">해당 문제 구성으로 재검색하시겠습니까?</span>
    </div>
    <div class="pop-footer">
      <button onclick="closePop('que-pop')">취소</button>
      <button class="pop-close" onclick="moveToStep2()">확인</button>
    </div>
  </div>
</div>

<!-- 출제범위 팝업 -->
<div class="pop-wrap scope-type" data-pop="que-scope-pop">
  <div class="pop-inner">
    <div class="pop-header">
      <span>국어3-2(노미숙)</span>
      <button type="button" class="pop-close"></button>
    </div>
    <div class="pop-content scroll-inner">
      <div class="scope-wrap" id="scope-list">
      </div>
    </div>
  </div>
</div>

<%--<script type="text/javascript" src="../../js/common/common.js?version=20240308101412"></script>
<script type="text/javascript" src="../../js/customExam/stepTwo.js?version=20240308101412"></script>--%>
<script>
  let qParam = {};

  // 재검색
  function rescan() {
    qParam = {};
    const chapterList = '${itemDTOList}';
    console.log("chapterList : " + chapterList);
    const activityCategoryList = '415,416,417,418'.split(',');
    const levelCnt = '0,10,10,10,0'.split(',');
    const questionForm = 'multiple,subjective,descriptive';

    let plusTempLevelArray = [];
    for (let i = 0; i < levelCnt.length; i++) {
      let cnt = Number(levelCnt[i]);
      let pVal = cnt === 0 ? 0 : cnt + 20;
      plusTempLevelArray.push(pVal);
    }

    qParam.chapterList = chapterList;
    qParam.activityCategoryList = activityCategoryList;
    qParam.levelCnt = levelCnt;
    qParam.tmpLevelCnt = plusTempLevelArray;
    qParam.questionForm = questionForm;

    ajaxCall("POST", "/customExam/step2", qParam, function (data) {

      if (data != null) {
        for (let j = 1; j <= 5; j++) {
          if (data.levelGroup['0' + j] !== undefined) {
            $(".pop-wrap[data-pop='que-pop'] #pop-level" + j).show();
            $(".pop-wrap[data-pop='que-pop'] #pop-level" + j).find(".num").text(data.levelGroup['0' + j]);
          }
        }

        $(".pop-wrap[data-pop='que-pop'] #pop-total-sum .num").text(data.itemsTotalCnt);
        $(".pop-wrap[data-pop='que-pop'] #nxt-data").val(data.queIdList);

        showPop("que-pop");
      }
    });
  }

  //재구성된 문항으로 가져오기
  function moveToStep2() {
    let queArrParam = $(".pop-wrap #nxt-data").val();
    let new_form = $('<form></form>');

    new_form.attr("name", "new_form");
    new_form.attr("charset", "UTF-8");
    new_form.attr("method", "post");
    new_form.attr("action", "/customExam/step2");

    new_form.append($('<input/>', {type: 'hidden', name: 'chapterList', value: qParam.chapterList}));
    new_form.append($('<input/>', {
      type: 'hidden',
      name: 'activityCategoryList',
      value: qParam.activityCategoryList
    }));
    new_form.append($('<input/>', {type: 'hidden', name: 'levelCnt', value: qParam.levelCnt}));
    new_form.append($('<input/>', {type: 'hidden', name: 'questionForm', value: qParam.questionForm}));
    new_form.append($('<input/>', {type: 'hidden', name: 'queArr', value: queArrParam}));
    new_form.append($('<input/>', {type: 'hidden', name: 'paperGubun', value: 'new'}));
    new_form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: $("#subjectId").val()}));

    new_form.appendTo('body');
    new_form.submit();
  }

  function showPop(pop, className) {
    const dimClass = className === undefined ? "dim" : className;
    $('html , body').css('overflow', 'hidden');
    $('.' + dimClass).fadeIn();
    $(".pop-wrap[data-pop=" + pop + "]").show();
  }

  function closePop(pop, className) {
    const dimClass = className === undefined ? "dim" : className;
    $(".pop-wrap[data-pop=" + pop + "]").hide();

    $('.' + dimClass).fadeOut();
    // if (pop != "wrong-pop" ) {
    $('html , body').css('overflow', 'auto');
    // }
  }

</script>

</body>
</html>
