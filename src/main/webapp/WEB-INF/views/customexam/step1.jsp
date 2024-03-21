<%--
  Created by IntelliJ IDEA.
  User: kjw85
  Date: 2024-03-08
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>T셀파 문제은행</title>

  <link rel="stylesheet" href="/resource/popup/css/swiper-bundle.min.css">
  <link rel="stylesheet" href="/resource/popup/css/jquery-ui.css">

  <link rel="stylesheet" href="/resource/popup/css/font.css">
  <link rel="stylesheet" href="/resource/popup/css/reset.css">
  <%--    <link rel="stylesheet" href="/resource/midhigh/assets/css/common.css">--%>
  <link rel="stylesheet" href="/resource/popup/css/common.css">
  <!-- S 230808 순서 변경-->
  <script src="/resource/popup/js/jquery-1.12.4.min.js"></script>
  <script src="/resource/popup/js/jquery-3.6.0.min.js"></script>
  <script src="/resource/popup/js/jquery-ui.js"></script>
  <script src="/resource/popup/js/swiper-bundle.min.js"></script>
  <!-- E 230808 순서 변경-->
  <script type="text/javascript" src="/resource/popup/js/common_que.js"></script>
  <script type="text/javascript" src="/resource/popup/js/lodash.min.js"></script>
  <script type="text/javascript" src="/resource/popup/js/stepOne.js"></script>

</head>
<body>
<div id="wrap" class="full-pop-que">
  <div class="full-pop-wrap">


    <div class="pop-header">
      <ul class="title" id="custom-pop-header-title">
        <li style="display:none" id="custom-step0"><img src="../../images/common/ico_step_active.png" alt="">출제 방법 선택</li>
        <li class="active" id="custom-step1">STEP 1 단원선택</li>
        <li id="custom-step2">STEP 2 문항 편집</li>
        <li id="custom-step3">STEP 3 시험지 저장</li>
      </ul>
      <button type="button" class="del-btn" onclick="winClose();"></button>
    </div>

    <script>
      function activeText(step){
        $("#custom-pop-header-title").children().siblings().removeClass("active");
        $("#custom-step"+step).addClass("active");
        if(step === 0){
          $('#custom-step0').show();
          $("#custom-pop-header-title").children().not('#custom-step0').remove();
        }
      }

      function winClose(){
        if (confirm ('이 페이지에서 나가시겠습니까?')) {
          window.open('', '_self', '').close();
        }
      }
    </script>
    <div class="pop-content">
      <div class="view-box">
        <div class="view-top">
          <div class="paper-info">
            <span>영어②(이재영)</span>- 2015개정 교육과정
            <input type="hidden" id="subjectId" name="subjectId" value="1161">
          </div>
        </div>
        <div class="view-bottom">
          <div class="view-box-wrap">
            <div class="unit-box-wrap">
              <div class="unit-box">
                <div class="unit-cnt scroll-inner">
                  <div class="title-top">
                    <span>단원정보</span>
                    <input type="checkbox" id="chk_all" class="allCheck">
                    <label for="chk_all">전체선택</label>
                  </div>

                  <ul id="unit-ul">

                    <li>
                      <div class="check-group title">
                        <div class="title-chk">
                          <input type="checkbox" id="chk_0" class="que-allCheck depth01" data-columns="116101" data-code="large">
                          <label for="chk_0">
                            <button type="button" class="dep-btn active">Lesson 1. Off to a Good Start</button>
                          </label>
                        </div>
                      </div>
                      <div class="depth02">

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_0_0" class="que-allCheck depth01" data-columns="11610101" data-code="medium">
                          <label for="chk_0_0">
                            <button type="button" class="dep-btn active">Listening &amp; Speaking</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_0_0_0" class="que-allCheck depth01" data-columns="1161010101" data-code="small">
                            <label for="chk_0_0_0">
                              <button type="button" class="dep-btn active">Listening &amp; Speaking <span><em>(10)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_0_0_0" class="que-allCheck" data-columns="116101010101" data-code="topic">
                              <label for="chk_0_0_0_0">
                                <button type="button" class="active"></button>
                                <span>의도나 계획 묻고 답하기  <em>(6)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_0_0_1" class="que-allCheck" data-columns="116101010102" data-code="topic">
                              <label for="chk_0_0_0_1">
                                <button type="button" class="active"></button>
                                <span>충고하기 <em>(4)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_0_1" class="que-allCheck depth01" data-columns="11610102" data-code="medium">
                          <label for="chk_0_1">
                            <button type="button" class="dep-btn active">Reading</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_0_1_0" class="que-allCheck depth01" data-columns="1161010201" data-code="small">
                            <label for="chk_0_1_0">
                              <button type="button" class="dep-btn active">Reading <span><em>(26)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_0" class="que-allCheck" data-columns="116101020101" data-code="topic">
                              <label for="chk_0_1_0_0">
                                <button type="button" class="active"></button>
                                <span>글의 제목 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_1" class="que-allCheck" data-columns="116101020102" data-code="topic">
                              <label for="chk_0_1_0_1">
                                <button type="button" class="active"></button>
                                <span>글의 주제 찾기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_2" class="que-allCheck" data-columns="116101020103" data-code="topic">
                              <label for="chk_0_1_0_2">
                                <button type="button" class="active"></button>
                                <span>글의 요지 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_3" class="que-allCheck" data-columns="116101020104" data-code="topic">
                              <label for="chk_0_1_0_3">
                                <button type="button" class="active"></button>
                                <span>필자의 주장 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_4" class="que-allCheck" data-columns="116101020105" data-code="topic">
                              <label for="chk_0_1_0_4">
                                <button type="button" class="active"></button>
                                <span>글의 세부내용 파악하기 <em>(17)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_5" class="que-allCheck" data-columns="116101020106" data-code="topic">
                              <label for="chk_0_1_0_5">
                                <button type="button" class="active"></button>
                                <span>어법의 적절성 판단 <em>(4)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_6" class="que-allCheck" data-columns="116101020107" data-code="topic">
                              <label for="chk_0_1_0_6">
                                <button type="button" class="active"></button>
                                <span>문맥상 적절한 낱말 고르기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_7" class="que-allCheck" data-columns="116101020108" data-code="topic">
                              <label for="chk_0_1_0_7">
                                <button type="button" class="active"></button>
                                <span>빈칸 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_8" class="que-allCheck" data-columns="116101020109" data-code="topic">
                              <label for="chk_0_1_0_8">
                                <button type="button" class="active"></button>
                                <span>글의 순서 찾기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_9" class="que-allCheck" data-columns="116101020110" data-code="topic">
                              <label for="chk_0_1_0_9">
                                <button type="button" class="active"></button>
                                <span>주어진 문장 위치 추론하기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_10" class="que-allCheck" data-columns="116101020111" data-code="topic">
                              <label for="chk_0_1_0_10">
                                <button type="button" class="active"></button>
                                <span>요약문 완성하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_11" class="que-allCheck" data-columns="116101020112" data-code="topic">
                              <label for="chk_0_1_0_11">
                                <button type="button" class="active"></button>
                                <span>지칭 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_1_0_12" class="que-allCheck" data-columns="116101020113" data-code="topic">
                              <label for="chk_0_1_0_12">
                                <button type="button" class="active"></button>
                                <span>심경 파악하기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_0_2" class="que-allCheck depth01" data-columns="11610103" data-code="medium">
                          <label for="chk_0_2">
                            <button type="button" class="dep-btn active">Writing</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_0_2_0" class="que-allCheck depth01" data-columns="1161010301" data-code="small">
                            <label for="chk_0_2_0">
                              <button type="button" class="dep-btn active">Writing <span><em>(6)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_2_0_0" class="que-allCheck" data-columns="116101030101" data-code="topic">
                              <label for="chk_0_2_0_0">
                                <button type="button" class="active"></button>
                                <span>중심 내용 쓰기 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_2_0_1" class="que-allCheck" data-columns="116101030102" data-code="topic">
                              <label for="chk_0_2_0_1">
                                <button type="button" class="active"></button>
                                <span>세부 내용 쓰기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_2_0_2" class="que-allCheck" data-columns="116101030103" data-code="topic">
                              <label for="chk_0_2_0_2">
                                <button type="button" class="active"></button>
                                <span>실용문 쓰기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_2_0_3" class="que-allCheck" data-columns="116101030104" data-code="topic">
                              <label for="chk_0_2_0_3">
                                <button type="button" class="active"></button>
                                <span>묘사하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_2_0_4" class="que-allCheck" data-columns="116101030105" data-code="topic">
                              <label for="chk_0_2_0_4">
                                <button type="button" class="active"></button>
                                <span>설명하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_2_0_5" class="que-allCheck" data-columns="116101030106" data-code="topic">
                              <label for="chk_0_2_0_5">
                                <button type="button" class="active"></button>
                                <span>요약하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_0_3" class="que-allCheck depth01" data-columns="11610104" data-code="medium">
                          <label for="chk_0_3">
                            <button type="button" class="dep-btn active">Vocabulary</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_0_3_0" class="que-allCheck depth01" data-columns="1161010401" data-code="small">
                            <label for="chk_0_3_0">
                              <button type="button" class="dep-btn active">Vocabulary <span><em>(25)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_3_0_0" class="que-allCheck" data-columns="116101040101" data-code="topic">
                              <label for="chk_0_3_0_0">
                                <button type="button" class="active"></button>
                                <span>어휘 의미묻기 <em>(17)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_3_0_1" class="que-allCheck" data-columns="116101040102" data-code="topic">
                              <label for="chk_0_3_0_1">
                                <button type="button" class="active"></button>
                                <span>단어의 철자묻기 <em>(8)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_0_4" class="que-allCheck depth01" data-columns="11610105" data-code="medium">
                          <label for="chk_0_4">
                            <button type="button" class="dep-btn active">Grammar</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_0_4_0" class="que-allCheck depth01" data-columns="1161010501" data-code="small">
                            <label for="chk_0_4_0">
                              <button type="button" class="dep-btn active">관계대명사 <span><em>(10)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_4_0_0" class="que-allCheck" data-columns="116101050101" data-code="topic">
                              <label for="chk_0_4_0_0">
                                <button type="button" class="active"></button>
                                <span>주격 관계대명사 <em>(10)</em></span>
                              </label>
                            </div>

                          </div>

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_0_4_1" class="que-allCheck depth01" data-columns="1161010502" data-code="small">
                            <label for="chk_0_4_1">
                              <button type="button" class="dep-btn active">접속사 <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_0_4_1_0" class="que-allCheck" data-columns="116101050201" data-code="topic">
                              <label for="chk_0_4_1_0">
                                <button type="button" class="active"></button>
                                <span>접속사 if(조건) <em>(5)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                      </div>
                    </li>

                    <li>
                      <div class="check-group title">
                        <div class="title-chk">
                          <input type="checkbox" id="chk_1" class="que-allCheck depth01" data-columns="116102" data-code="large">
                          <label for="chk_1">
                            <button type="button" class="dep-btn active">Lesson 2. Connecting with the World</button>
                          </label>
                        </div>
                      </div>
                      <div class="depth02">

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_1_0" class="que-allCheck depth01" data-columns="11610201" data-code="medium">
                          <label for="chk_1_0">
                            <button type="button" class="dep-btn active">Listening &amp; Speaking</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_1_0_0" class="que-allCheck depth01" data-columns="1161020101" data-code="small">
                            <label for="chk_1_0_0">
                              <button type="button" class="dep-btn active">Listening &amp; Speaking <span><em>(10)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_0_0_0" class="que-allCheck" data-columns="116102010101" data-code="topic">
                              <label for="chk_1_0_0_0">
                                <button type="button" class="active"></button>
                                <span>음식 권하고 답하기 <em>(6)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_0_0_1" class="que-allCheck" data-columns="116102010102" data-code="topic">
                              <label for="chk_1_0_0_1">
                                <button type="button" class="active"></button>
                                <span>표현의 의미 묻고 답하기  <em>(4)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_1_1" class="que-allCheck depth01" data-columns="11610202" data-code="medium">
                          <label for="chk_1_1">
                            <button type="button" class="dep-btn active">Reading</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_1_1_0" class="que-allCheck depth01" data-columns="1161020201" data-code="small">
                            <label for="chk_1_1_0">
                              <button type="button" class="dep-btn active">Reading <span><em>(29)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_0" class="que-allCheck" data-columns="116102020101" data-code="topic">
                              <label for="chk_1_1_0_0">
                                <button type="button" class="active"></button>
                                <span>글의 제목 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_1" class="que-allCheck" data-columns="116102020102" data-code="topic">
                              <label for="chk_1_1_0_1">
                                <button type="button" class="active"></button>
                                <span>글의 주제 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_2" class="que-allCheck" data-columns="116102020103" data-code="topic">
                              <label for="chk_1_1_0_2">
                                <button type="button" class="active"></button>
                                <span>글의 요지 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_3" class="que-allCheck" data-columns="116102020104" data-code="topic">
                              <label for="chk_1_1_0_3">
                                <button type="button" class="active"></button>
                                <span>필자의 주장 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_4" class="que-allCheck" data-columns="116102020105" data-code="topic">
                              <label for="chk_1_1_0_4">
                                <button type="button" class="active"></button>
                                <span>글의 세부내용 파악하기 <em>(19)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_5" class="que-allCheck" data-columns="116102020106" data-code="topic">
                              <label for="chk_1_1_0_5">
                                <button type="button" class="active"></button>
                                <span>어법의 적절성 판단 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_6" class="que-allCheck" data-columns="116102020107" data-code="topic">
                              <label for="chk_1_1_0_6">
                                <button type="button" class="active"></button>
                                <span>문맥상 적절한 낱말 고르기 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_7" class="que-allCheck" data-columns="116102020108" data-code="topic">
                              <label for="chk_1_1_0_7">
                                <button type="button" class="active"></button>
                                <span>빈칸 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_8" class="que-allCheck" data-columns="116102020109" data-code="topic">
                              <label for="chk_1_1_0_8">
                                <button type="button" class="active"></button>
                                <span>글의 순서 찾기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_9" class="que-allCheck" data-columns="116102020110" data-code="topic">
                              <label for="chk_1_1_0_9">
                                <button type="button" class="active"></button>
                                <span>주어진 문장 위치 추론하기 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_10" class="que-allCheck" data-columns="116102020111" data-code="topic">
                              <label for="chk_1_1_0_10">
                                <button type="button" class="active"></button>
                                <span>요약문 완성하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_11" class="que-allCheck" data-columns="116102020112" data-code="topic">
                              <label for="chk_1_1_0_11">
                                <button type="button" class="active"></button>
                                <span>지칭 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_1_0_12" class="que-allCheck" data-columns="116102020113" data-code="topic">
                              <label for="chk_1_1_0_12">
                                <button type="button" class="active"></button>
                                <span>심경 파악하기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_1_2" class="que-allCheck depth01" data-columns="11610203" data-code="medium">
                          <label for="chk_1_2">
                            <button type="button" class="dep-btn active">Writing</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_1_2_0" class="que-allCheck depth01" data-columns="1161020301" data-code="small">
                            <label for="chk_1_2_0">
                              <button type="button" class="dep-btn active">Writing <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_2_0_0" class="que-allCheck" data-columns="116102030101" data-code="topic">
                              <label for="chk_1_2_0_0">
                                <button type="button" class="active"></button>
                                <span>중심 내용 쓰기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_2_0_1" class="que-allCheck" data-columns="116102030102" data-code="topic">
                              <label for="chk_1_2_0_1">
                                <button type="button" class="active"></button>
                                <span>세부 내용 쓰기 <em>(4)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_2_0_2" class="que-allCheck" data-columns="116102030103" data-code="topic">
                              <label for="chk_1_2_0_2">
                                <button type="button" class="active"></button>
                                <span>실용문 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_2_0_3" class="que-allCheck" data-columns="116102030104" data-code="topic">
                              <label for="chk_1_2_0_3">
                                <button type="button" class="active"></button>
                                <span>묘사하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_2_0_4" class="que-allCheck" data-columns="116102030105" data-code="topic">
                              <label for="chk_1_2_0_4">
                                <button type="button" class="active"></button>
                                <span>설명하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_2_0_5" class="que-allCheck" data-columns="116102030106" data-code="topic">
                              <label for="chk_1_2_0_5">
                                <button type="button" class="active"></button>
                                <span>요약하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_1_3" class="que-allCheck depth01" data-columns="11610204" data-code="medium">
                          <label for="chk_1_3">
                            <button type="button" class="dep-btn active">Vocabulary</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_1_3_0" class="que-allCheck depth01" data-columns="1161020401" data-code="small">
                            <label for="chk_1_3_0">
                              <button type="button" class="dep-btn active">Vocabulary <span><em>(23)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_3_0_0" class="que-allCheck" data-columns="116102040101" data-code="topic">
                              <label for="chk_1_3_0_0">
                                <button type="button" class="active"></button>
                                <span>어휘 의미묻기 <em>(15)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_3_0_1" class="que-allCheck" data-columns="116102040102" data-code="topic">
                              <label for="chk_1_3_0_1">
                                <button type="button" class="active"></button>
                                <span>단어의 철자묻기 <em>(8)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_1_4" class="que-allCheck depth01" data-columns="11610205" data-code="medium">
                          <label for="chk_1_4">
                            <button type="button" class="dep-btn active">Grammar</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_1_4_0" class="que-allCheck depth01" data-columns="1161020501" data-code="small">
                            <label for="chk_1_4_0">
                              <button type="button" class="dep-btn active">관계대명사 <span><em>(12)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_4_0_0" class="que-allCheck" data-columns="116102050101" data-code="topic">
                              <label for="chk_1_4_0_0">
                                <button type="button" class="active"></button>
                                <span>목적격 관계대명사 <em>(12)</em></span>
                              </label>
                            </div>

                          </div>

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_1_4_1" class="que-allCheck depth01" data-columns="1161020502" data-code="small">
                            <label for="chk_1_4_1">
                              <button type="button" class="dep-btn active">의문문 <span><em>(6)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_1_4_1_0" class="que-allCheck" data-columns="116102050201" data-code="topic">
                              <label for="chk_1_4_1_0">
                                <button type="button" class="active"></button>
                                <span>의문사+to부정사 <em>(6)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                      </div>
                    </li>

                    <li>
                      <div class="check-group title">
                        <div class="title-chk">
                          <input type="checkbox" id="chk_2" class="que-allCheck depth01" data-columns="116103" data-code="large">
                          <label for="chk_2">
                            <button type="button" class="dep-btn active">Lesson 3. Healthy Life, Happy Life</button>
                          </label>
                        </div>
                      </div>
                      <div class="depth02">

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_2_0" class="que-allCheck depth01" data-columns="11610301" data-code="medium">
                          <label for="chk_2_0">
                            <button type="button" class="dep-btn active">Listening &amp; Speaking</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_2_0_0" class="que-allCheck depth01" data-columns="1161030101" data-code="small">
                            <label for="chk_2_0_0">
                              <button type="button" class="dep-btn active">Listening &amp; Speaking <span><em>(13)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_0_0_0" class="que-allCheck" data-columns="116103010101" data-code="topic">
                              <label for="chk_2_0_0_0">
                                <button type="button" class="active"></button>
                                <span>증상 묻고 답하기 <em>(9)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_0_0_1" class="que-allCheck" data-columns="116103010102" data-code="topic">
                              <label for="chk_2_0_0_1">
                                <button type="button" class="active"></button>
                                <span>약속 정하기  <em>(4)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_2_1" class="que-allCheck depth01" data-columns="11610302" data-code="medium">
                          <label for="chk_2_1">
                            <button type="button" class="dep-btn active">Reading</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_2_1_0" class="que-allCheck depth01" data-columns="1161030201" data-code="small">
                            <label for="chk_2_1_0">
                              <button type="button" class="dep-btn active">Reading <span><em>(30)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_0" class="que-allCheck" data-columns="116103020101" data-code="topic">
                              <label for="chk_2_1_0_0">
                                <button type="button" class="active"></button>
                                <span>글의 제목 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_1" class="que-allCheck" data-columns="116103020102" data-code="topic">
                              <label for="chk_2_1_0_1">
                                <button type="button" class="active"></button>
                                <span>글의 주제 찾기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_2" class="que-allCheck" data-columns="116103020103" data-code="topic">
                              <label for="chk_2_1_0_2">
                                <button type="button" class="active"></button>
                                <span>글의 요지 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_3" class="que-allCheck" data-columns="116103020104" data-code="topic">
                              <label for="chk_2_1_0_3">
                                <button type="button" class="active"></button>
                                <span>필자의 주장 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_4" class="que-allCheck" data-columns="116103020105" data-code="topic">
                              <label for="chk_2_1_0_4">
                                <button type="button" class="active"></button>
                                <span>글의 세부내용 파악하기 <em>(18)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_5" class="que-allCheck" data-columns="116103020106" data-code="topic">
                              <label for="chk_2_1_0_5">
                                <button type="button" class="active"></button>
                                <span>어법의 적절성 판단 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_6" class="que-allCheck" data-columns="116103020107" data-code="topic">
                              <label for="chk_2_1_0_6">
                                <button type="button" class="active"></button>
                                <span>문맥상 적절한 낱말 고르기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_7" class="que-allCheck" data-columns="116103020108" data-code="topic">
                              <label for="chk_2_1_0_7">
                                <button type="button" class="active"></button>
                                <span>빈칸 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_8" class="que-allCheck" data-columns="116103020109" data-code="topic">
                              <label for="chk_2_1_0_8">
                                <button type="button" class="active"></button>
                                <span>글의 순서 찾기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_9" class="que-allCheck" data-columns="116103020110" data-code="topic">
                              <label for="chk_2_1_0_9">
                                <button type="button" class="active"></button>
                                <span>주어진 문장 위치 추론하기 <em>(4)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_10" class="que-allCheck" data-columns="116103020111" data-code="topic">
                              <label for="chk_2_1_0_10">
                                <button type="button" class="active"></button>
                                <span>요약문 완성하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_11" class="que-allCheck" data-columns="116103020112" data-code="topic">
                              <label for="chk_2_1_0_11">
                                <button type="button" class="active"></button>
                                <span>지칭 추론하기 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_1_0_12" class="que-allCheck" data-columns="116103020113" data-code="topic">
                              <label for="chk_2_1_0_12">
                                <button type="button" class="active"></button>
                                <span>심경 파악하기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_2_2" class="que-allCheck depth01" data-columns="11610303" data-code="medium">
                          <label for="chk_2_2">
                            <button type="button" class="dep-btn active">Writing</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_2_2_0" class="que-allCheck depth01" data-columns="1161030301" data-code="small">
                            <label for="chk_2_2_0">
                              <button type="button" class="dep-btn active">Writing <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_2_0_0" class="que-allCheck" data-columns="116103030101" data-code="topic">
                              <label for="chk_2_2_0_0">
                                <button type="button" class="active"></button>
                                <span>중심 내용 쓰기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_2_0_1" class="que-allCheck" data-columns="116103030102" data-code="topic">
                              <label for="chk_2_2_0_1">
                                <button type="button" class="active"></button>
                                <span>세부 내용 쓰기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_2_0_2" class="que-allCheck" data-columns="116103030103" data-code="topic">
                              <label for="chk_2_2_0_2">
                                <button type="button" class="active"></button>
                                <span>실용문 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_2_0_3" class="que-allCheck" data-columns="116103030104" data-code="topic">
                              <label for="chk_2_2_0_3">
                                <button type="button" class="active"></button>
                                <span>묘사하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_2_0_4" class="que-allCheck" data-columns="116103030105" data-code="topic">
                              <label for="chk_2_2_0_4">
                                <button type="button" class="active"></button>
                                <span>설명하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_2_0_5" class="que-allCheck" data-columns="116103030106" data-code="topic">
                              <label for="chk_2_2_0_5">
                                <button type="button" class="active"></button>
                                <span>요약하는 글 쓰기 <em>(2)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_2_3" class="que-allCheck depth01" data-columns="11610304" data-code="medium">
                          <label for="chk_2_3">
                            <button type="button" class="dep-btn active">Vocabulary</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_2_3_0" class="que-allCheck depth01" data-columns="1161030401" data-code="small">
                            <label for="chk_2_3_0">
                              <button type="button" class="dep-btn active">Vocabulary <span><em>(20)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_3_0_0" class="que-allCheck" data-columns="116103040101" data-code="topic">
                              <label for="chk_2_3_0_0">
                                <button type="button" class="active"></button>
                                <span>어휘 의미묻기 <em>(14)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_3_0_1" class="que-allCheck" data-columns="116103040102" data-code="topic">
                              <label for="chk_2_3_0_1">
                                <button type="button" class="active"></button>
                                <span>단어의 철자묻기 <em>(6)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_2_4" class="que-allCheck depth01" data-columns="11610305" data-code="medium">
                          <label for="chk_2_4">
                            <button type="button" class="dep-btn active">Grammar</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_2_4_0" class="que-allCheck depth01" data-columns="1161030501" data-code="small">
                            <label for="chk_2_4_0">
                              <button type="button" class="dep-btn active">it  <span><em>(11)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_4_0_0" class="que-allCheck" data-columns="116103050101" data-code="topic">
                              <label for="chk_2_4_0_0">
                                <button type="button" class="active"></button>
                                <span>It ~ to부정사  <em>(11)</em></span>
                              </label>
                            </div>

                          </div>

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_2_4_1" class="que-allCheck depth01" data-columns="1161030502" data-code="small">
                            <label for="chk_2_4_1">
                              <button type="button" class="dep-btn active">to부정사 <span><em>(4)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_2_4_1_0" class="que-allCheck" data-columns="116103050201" data-code="topic">
                              <label for="chk_2_4_1_0">
                                <button type="button" class="active"></button>
                                <span>형용사 역할을 하는 to부정사 <em>(4)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                      </div>
                    </li>

                    <li>
                      <div class="check-group title">
                        <div class="title-chk">
                          <input type="checkbox" id="chk_3" class="que-allCheck depth01" data-columns="116104" data-code="large">
                          <label for="chk_3">
                            <button type="button" class="dep-btn active">Lesson 4. Earth, Our Only Home</button>
                          </label>
                        </div>
                      </div>
                      <div class="depth02">

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_3_0" class="que-allCheck depth01" data-columns="11610401" data-code="medium">
                          <label for="chk_3_0">
                            <button type="button" class="dep-btn active">Listening &amp; Speaking</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_3_0_0" class="que-allCheck depth01" data-columns="1161040101" data-code="small">
                            <label for="chk_3_0_0">
                              <button type="button" class="dep-btn active">Listening &amp; Speaking <span><em>(10)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_0_0_0" class="que-allCheck" data-columns="116104010101" data-code="topic">
                              <label for="chk_3_0_0_0">
                                <button type="button" class="active"></button>
                                <span>허락 구하기 <em>(4)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_0_0_1" class="que-allCheck" data-columns="116104010102" data-code="topic">
                              <label for="chk_3_0_0_1">
                                <button type="button" class="active"></button>
                                <span>금지하기 <em>(6)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_3_1" class="que-allCheck depth01" data-columns="11610402" data-code="medium">
                          <label for="chk_3_1">
                            <button type="button" class="dep-btn active">Reading</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_3_1_0" class="que-allCheck depth01" data-columns="1161040201" data-code="small">
                            <label for="chk_3_1_0">
                              <button type="button" class="dep-btn active">Reading <span><em>(31)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_0" class="que-allCheck" data-columns="116104020101" data-code="topic">
                              <label for="chk_3_1_0_0">
                                <button type="button" class="active"></button>
                                <span>글의 제목 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_1" class="que-allCheck" data-columns="116104020102" data-code="topic">
                              <label for="chk_3_1_0_1">
                                <button type="button" class="active"></button>
                                <span>글의 주제 찾기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_2" class="que-allCheck" data-columns="116104020103" data-code="topic">
                              <label for="chk_3_1_0_2">
                                <button type="button" class="active"></button>
                                <span>글의 요지 찾기 <em>(4)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_3" class="que-allCheck" data-columns="116104020104" data-code="topic">
                              <label for="chk_3_1_0_3">
                                <button type="button" class="active"></button>
                                <span>필자의 주장 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_4" class="que-allCheck" data-columns="116104020105" data-code="topic">
                              <label for="chk_3_1_0_4">
                                <button type="button" class="active"></button>
                                <span>글의 세부내용 파악하기 <em>(16)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_5" class="que-allCheck" data-columns="116104020106" data-code="topic">
                              <label for="chk_3_1_0_5">
                                <button type="button" class="active"></button>
                                <span>어법의 적절성 판단 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_6" class="que-allCheck" data-columns="116104020107" data-code="topic">
                              <label for="chk_3_1_0_6">
                                <button type="button" class="active"></button>
                                <span>문맥상 적절한 낱말 고르기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_7" class="que-allCheck" data-columns="116104020108" data-code="topic">
                              <label for="chk_3_1_0_7">
                                <button type="button" class="active"></button>
                                <span>빈칸 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_8" class="que-allCheck" data-columns="116104020109" data-code="topic">
                              <label for="chk_3_1_0_8">
                                <button type="button" class="active"></button>
                                <span>글의 순서 찾기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_9" class="que-allCheck" data-columns="116104020110" data-code="topic">
                              <label for="chk_3_1_0_9">
                                <button type="button" class="active"></button>
                                <span>주어진 문장 위치 추론하기 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_10" class="que-allCheck" data-columns="116104020111" data-code="topic">
                              <label for="chk_3_1_0_10">
                                <button type="button" class="active"></button>
                                <span>요약문 완성하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_11" class="que-allCheck" data-columns="116104020112" data-code="topic">
                              <label for="chk_3_1_0_11">
                                <button type="button" class="active"></button>
                                <span>지칭 추론하기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_1_0_12" class="que-allCheck" data-columns="116104020113" data-code="topic">
                              <label for="chk_3_1_0_12">
                                <button type="button" class="active"></button>
                                <span>심경 파악하기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_3_2" class="que-allCheck depth01" data-columns="11610403" data-code="medium">
                          <label for="chk_3_2">
                            <button type="button" class="dep-btn active">Writing</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_3_2_0" class="que-allCheck depth01" data-columns="1161040301" data-code="small">
                            <label for="chk_3_2_0">
                              <button type="button" class="dep-btn active">Writing <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_2_0_0" class="que-allCheck" data-columns="116104030101" data-code="topic">
                              <label for="chk_3_2_0_0">
                                <button type="button" class="active"></button>
                                <span>중심 내용 쓰기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_2_0_1" class="que-allCheck" data-columns="116104030102" data-code="topic">
                              <label for="chk_3_2_0_1">
                                <button type="button" class="active"></button>
                                <span>세부 내용 쓰기 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_2_0_2" class="que-allCheck" data-columns="116104030103" data-code="topic">
                              <label for="chk_3_2_0_2">
                                <button type="button" class="active"></button>
                                <span>실용문 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_2_0_3" class="que-allCheck" data-columns="116104030104" data-code="topic">
                              <label for="chk_3_2_0_3">
                                <button type="button" class="active"></button>
                                <span>묘사하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_2_0_4" class="que-allCheck" data-columns="116104030105" data-code="topic">
                              <label for="chk_3_2_0_4">
                                <button type="button" class="active"></button>
                                <span>설명하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_2_0_5" class="que-allCheck" data-columns="116104030106" data-code="topic">
                              <label for="chk_3_2_0_5">
                                <button type="button" class="active"></button>
                                <span>요약하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_3_3" class="que-allCheck depth01" data-columns="11610404" data-code="medium">
                          <label for="chk_3_3">
                            <button type="button" class="dep-btn active">Vocabulary</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_3_3_0" class="que-allCheck depth01" data-columns="1161040401" data-code="small">
                            <label for="chk_3_3_0">
                              <button type="button" class="dep-btn active">Vocabulary <span><em>(23)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_3_0_0" class="que-allCheck" data-columns="116104040101" data-code="topic">
                              <label for="chk_3_3_0_0">
                                <button type="button" class="active"></button>
                                <span>어휘 의미묻기 <em>(16)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_3_0_1" class="que-allCheck" data-columns="116104040102" data-code="topic">
                              <label for="chk_3_3_0_1">
                                <button type="button" class="active"></button>
                                <span>단어의 철자묻기 <em>(7)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_3_4" class="que-allCheck depth01" data-columns="11610405" data-code="medium">
                          <label for="chk_3_4">
                            <button type="button" class="dep-btn active">Grammar</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_3_4_0" class="que-allCheck depth01" data-columns="1161040501" data-code="small">
                            <label for="chk_3_4_0">
                              <button type="button" class="dep-btn active">수동태 <span><em>(11)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_4_0_0" class="que-allCheck" data-columns="116104050101" data-code="topic">
                              <label for="chk_3_4_0_0">
                                <button type="button" class="active"></button>
                                <span>수동태 <em>(11)</em></span>
                              </label>
                            </div>

                          </div>

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_3_4_1" class="que-allCheck depth01" data-columns="1161040502" data-code="small">
                            <label for="chk_3_4_1">
                              <button type="button" class="dep-btn active">원급 비교 <span><em>(4)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_3_4_1_0" class="que-allCheck" data-columns="116104050201" data-code="topic">
                              <label for="chk_3_4_1_0">
                                <button type="button" class="active"></button>
                                <span>원급 비교 <em>(4)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                      </div>
                    </li>

                    <li>
                      <div class="check-group title">
                        <div class="title-chk">
                          <input type="checkbox" id="chk_4" class="que-allCheck depth01" data-columns="116105" data-code="large">
                          <label for="chk_4">
                            <button type="button" class="dep-btn active">Lesson 5. Understanding Others</button>
                          </label>
                        </div>
                      </div>
                      <div class="depth02">

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_4_0" class="que-allCheck depth01" data-columns="11610501" data-code="medium">
                          <label for="chk_4_0">
                            <button type="button" class="dep-btn active">Listening &amp; Speaking</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_4_0_0" class="que-allCheck depth01" data-columns="1161050101" data-code="small">
                            <label for="chk_4_0_0">
                              <button type="button" class="dep-btn active">Listening &amp; Speaking <span><em>(12)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_0_0_0" class="que-allCheck" data-columns="116105010101" data-code="topic">
                              <label for="chk_4_0_0_0">
                                <button type="button" class="active"></button>
                                <span>희망이나 바람 표현하기 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_0_0_1" class="que-allCheck" data-columns="116105010102" data-code="topic">
                              <label for="chk_4_0_0_1">
                                <button type="button" class="active"></button>
                                <span>외모 묘사하기 <em>(9)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_4_1" class="que-allCheck depth01" data-columns="11610502" data-code="medium">
                          <label for="chk_4_1">
                            <button type="button" class="dep-btn active">Reading</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_4_1_0" class="que-allCheck depth01" data-columns="1161050201" data-code="small">
                            <label for="chk_4_1_0">
                              <button type="button" class="dep-btn active">Reading <span><em>(27)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_0" class="que-allCheck" data-columns="116105020101" data-code="topic">
                              <label for="chk_4_1_0_0">
                                <button type="button" class="active"></button>
                                <span>글의 제목 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_1" class="que-allCheck" data-columns="116105020102" data-code="topic">
                              <label for="chk_4_1_0_1">
                                <button type="button" class="active"></button>
                                <span>글의 주제 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_2" class="que-allCheck" data-columns="116105020103" data-code="topic">
                              <label for="chk_4_1_0_2">
                                <button type="button" class="active"></button>
                                <span>글의 요지 찾기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_3" class="que-allCheck" data-columns="116105020104" data-code="topic">
                              <label for="chk_4_1_0_3">
                                <button type="button" class="active"></button>
                                <span>필자의 주장 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_4" class="que-allCheck" data-columns="116105020105" data-code="topic">
                              <label for="chk_4_1_0_4">
                                <button type="button" class="active"></button>
                                <span>글의 세부내용 파악하기 <em>(20)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_5" class="que-allCheck" data-columns="116105020106" data-code="topic">
                              <label for="chk_4_1_0_5">
                                <button type="button" class="active"></button>
                                <span>어법의 적절성 판단 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_6" class="que-allCheck" data-columns="116105020107" data-code="topic">
                              <label for="chk_4_1_0_6">
                                <button type="button" class="active"></button>
                                <span>문맥상 적절한 낱말 고르기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_7" class="que-allCheck" data-columns="116105020108" data-code="topic">
                              <label for="chk_4_1_0_7">
                                <button type="button" class="active"></button>
                                <span>빈칸 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_8" class="que-allCheck" data-columns="116105020109" data-code="topic">
                              <label for="chk_4_1_0_8">
                                <button type="button" class="active"></button>
                                <span>글의 순서 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_9" class="que-allCheck" data-columns="116105020110" data-code="topic">
                              <label for="chk_4_1_0_9">
                                <button type="button" class="active"></button>
                                <span>주어진 문장 위치 추론하기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_10" class="que-allCheck" data-columns="116105020111" data-code="topic">
                              <label for="chk_4_1_0_10">
                                <button type="button" class="active"></button>
                                <span>요약문 완성하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_11" class="que-allCheck" data-columns="116105020112" data-code="topic">
                              <label for="chk_4_1_0_11">
                                <button type="button" class="active"></button>
                                <span>지칭 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_1_0_12" class="que-allCheck" data-columns="116105020113" data-code="topic">
                              <label for="chk_4_1_0_12">
                                <button type="button" class="active"></button>
                                <span>심경 파악하기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_4_2" class="que-allCheck depth01" data-columns="11610503" data-code="medium">
                          <label for="chk_4_2">
                            <button type="button" class="dep-btn active">Writing</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_4_2_0" class="que-allCheck depth01" data-columns="1161050301" data-code="small">
                            <label for="chk_4_2_0">
                              <button type="button" class="dep-btn active">Writing <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_2_0_0" class="que-allCheck" data-columns="116105030101" data-code="topic">
                              <label for="chk_4_2_0_0">
                                <button type="button" class="active"></button>
                                <span>중심 내용 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_2_0_1" class="que-allCheck" data-columns="116105030102" data-code="topic">
                              <label for="chk_4_2_0_1">
                                <button type="button" class="active"></button>
                                <span>세부 내용 쓰기 <em>(4)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_2_0_2" class="que-allCheck" data-columns="116105030103" data-code="topic">
                              <label for="chk_4_2_0_2">
                                <button type="button" class="active"></button>
                                <span>실용문 쓰기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_2_0_3" class="que-allCheck" data-columns="116105030104" data-code="topic">
                              <label for="chk_4_2_0_3">
                                <button type="button" class="active"></button>
                                <span>묘사하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_2_0_4" class="que-allCheck" data-columns="116105030105" data-code="topic">
                              <label for="chk_4_2_0_4">
                                <button type="button" class="active"></button>
                                <span>설명하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_2_0_5" class="que-allCheck" data-columns="116105030106" data-code="topic">
                              <label for="chk_4_2_0_5">
                                <button type="button" class="active"></button>
                                <span>요약하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_4_3" class="que-allCheck depth01" data-columns="11610504" data-code="medium">
                          <label for="chk_4_3">
                            <button type="button" class="dep-btn active">Vocabulary</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_4_3_0" class="que-allCheck depth01" data-columns="1161050401" data-code="small">
                            <label for="chk_4_3_0">
                              <button type="button" class="dep-btn active">Vocabulary <span><em>(24)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_3_0_0" class="que-allCheck" data-columns="116105040101" data-code="topic">
                              <label for="chk_4_3_0_0">
                                <button type="button" class="active"></button>
                                <span>어휘 의미묻기 <em>(16)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_3_0_1" class="que-allCheck" data-columns="116105040102" data-code="topic">
                              <label for="chk_4_3_0_1">
                                <button type="button" class="active"></button>
                                <span>단어의 철자묻기 <em>(8)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_4_4" class="que-allCheck depth01" data-columns="11610505" data-code="medium">
                          <label for="chk_4_4">
                            <button type="button" class="dep-btn active">Grammar</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_4_4_0" class="que-allCheck depth01" data-columns="1161050501" data-code="small">
                            <label for="chk_4_4_0">
                              <button type="button" class="dep-btn active">문장의 형식 <span><em>(10)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_4_0_0" class="que-allCheck" data-columns="116105050101" data-code="topic">
                              <label for="chk_4_4_0_0">
                                <button type="button" class="active"></button>
                                <span>want/ask/tell+목적어+to부정사 <em>(10)</em></span>
                              </label>
                            </div>

                          </div>

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_4_4_1" class="que-allCheck depth01" data-columns="1161050502" data-code="small">
                            <label for="chk_4_4_1">
                              <button type="button" class="dep-btn active">접속사 <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_4_4_1_0" class="que-allCheck" data-columns="116105050201" data-code="topic">
                              <label for="chk_4_4_1_0">
                                <button type="button" class="active"></button>
                                <span>접속사 before와 after <em>(5)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                      </div>
                    </li>

                    <li>
                      <div class="check-group title">
                        <div class="title-chk">
                          <input type="checkbox" id="chk_5" class="que-allCheck depth01" data-columns="116106" data-code="large">
                          <label for="chk_5">
                            <button type="button" class="dep-btn active">Lesson 6. Near and Dear</button>
                          </label>
                        </div>
                      </div>
                      <div class="depth02">

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_5_0" class="que-allCheck depth01" data-columns="11610601" data-code="medium">
                          <label for="chk_5_0">
                            <button type="button" class="dep-btn active">Listening &amp; Speaking</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_5_0_0" class="que-allCheck depth01" data-columns="1161060101" data-code="small">
                            <label for="chk_5_0_0">
                              <button type="button" class="dep-btn active">Listening &amp; Speaking <span><em>(10)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_0_0_0" class="que-allCheck" data-columns="116106010101" data-code="topic">
                              <label for="chk_5_0_0_0">
                                <button type="button" class="active"></button>
                                <span>불만 표현하기  <em>(5)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_0_0_1" class="que-allCheck" data-columns="116106010102" data-code="topic">
                              <label for="chk_5_0_0_1">
                                <button type="button" class="active"></button>
                                <span>상기시키기 <em>(5)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_5_1" class="que-allCheck depth01" data-columns="11610602" data-code="medium">
                          <label for="chk_5_1">
                            <button type="button" class="dep-btn active">Reading</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_5_1_0" class="que-allCheck depth01" data-columns="1161060201" data-code="small">
                            <label for="chk_5_1_0">
                              <button type="button" class="dep-btn active">Reading <span><em>(35)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_0" class="que-allCheck" data-columns="116106020101" data-code="topic">
                              <label for="chk_5_1_0_0">
                                <button type="button" class="active"></button>
                                <span>글의 제목 찾기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_1" class="que-allCheck" data-columns="116106020102" data-code="topic">
                              <label for="chk_5_1_0_1">
                                <button type="button" class="active"></button>
                                <span>글의 주제 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_2" class="que-allCheck" data-columns="116106020103" data-code="topic">
                              <label for="chk_5_1_0_2">
                                <button type="button" class="active"></button>
                                <span>글의 요지 찾기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_3" class="que-allCheck" data-columns="116106020104" data-code="topic">
                              <label for="chk_5_1_0_3">
                                <button type="button" class="active"></button>
                                <span>필자의 주장 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_4" class="que-allCheck" data-columns="116106020105" data-code="topic">
                              <label for="chk_5_1_0_4">
                                <button type="button" class="active"></button>
                                <span>글의 세부내용 파악하기 <em>(18)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_5" class="que-allCheck" data-columns="116106020106" data-code="topic">
                              <label for="chk_5_1_0_5">
                                <button type="button" class="active"></button>
                                <span>어법의 적절성 판단 <em>(9)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_6" class="que-allCheck" data-columns="116106020107" data-code="topic">
                              <label for="chk_5_1_0_6">
                                <button type="button" class="active"></button>
                                <span>문맥상 적절한 낱말 고르기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_7" class="que-allCheck" data-columns="116106020108" data-code="topic">
                              <label for="chk_5_1_0_7">
                                <button type="button" class="active"></button>
                                <span>빈칸 추론하기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_8" class="que-allCheck" data-columns="116106020109" data-code="topic">
                              <label for="chk_5_1_0_8">
                                <button type="button" class="active"></button>
                                <span>글의 순서 찾기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_9" class="que-allCheck" data-columns="116106020110" data-code="topic">
                              <label for="chk_5_1_0_9">
                                <button type="button" class="active"></button>
                                <span>주어진 문장 위치 추론하기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_10" class="que-allCheck" data-columns="116106020111" data-code="topic">
                              <label for="chk_5_1_0_10">
                                <button type="button" class="active"></button>
                                <span>요약문 완성하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_11" class="que-allCheck" data-columns="116106020112" data-code="topic">
                              <label for="chk_5_1_0_11">
                                <button type="button" class="active"></button>
                                <span>지칭 추론하기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_1_0_12" class="que-allCheck" data-columns="116106020113" data-code="topic">
                              <label for="chk_5_1_0_12">
                                <button type="button" class="active"></button>
                                <span>심경 파악하기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_5_2" class="que-allCheck depth01" data-columns="11610603" data-code="medium">
                          <label for="chk_5_2">
                            <button type="button" class="dep-btn active">Writing</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_5_2_0" class="que-allCheck depth01" data-columns="1161060301" data-code="small">
                            <label for="chk_5_2_0">
                              <button type="button" class="dep-btn active">Writing <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_2_0_0" class="que-allCheck" data-columns="116106030101" data-code="topic">
                              <label for="chk_5_2_0_0">
                                <button type="button" class="active"></button>
                                <span>중심 내용 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_2_0_1" class="que-allCheck" data-columns="116106030102" data-code="topic">
                              <label for="chk_5_2_0_1">
                                <button type="button" class="active"></button>
                                <span>세부 내용 쓰기 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_2_0_2" class="que-allCheck" data-columns="116106030103" data-code="topic">
                              <label for="chk_5_2_0_2">
                                <button type="button" class="active"></button>
                                <span>실용문 쓰기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_2_0_3" class="que-allCheck" data-columns="116106030104" data-code="topic">
                              <label for="chk_5_2_0_3">
                                <button type="button" class="active"></button>
                                <span>묘사하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_2_0_4" class="que-allCheck" data-columns="116106030105" data-code="topic">
                              <label for="chk_5_2_0_4">
                                <button type="button" class="active"></button>
                                <span>설명하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_2_0_5" class="que-allCheck" data-columns="116106030106" data-code="topic">
                              <label for="chk_5_2_0_5">
                                <button type="button" class="active"></button>
                                <span>요약하는 글 쓰기 <em>(1)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_5_3" class="que-allCheck depth01" data-columns="11610604" data-code="medium">
                          <label for="chk_5_3">
                            <button type="button" class="dep-btn active">Vocabulary</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_5_3_0" class="que-allCheck depth01" data-columns="1161060401" data-code="small">
                            <label for="chk_5_3_0">
                              <button type="button" class="dep-btn active">Vocabulary <span><em>(20)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_3_0_0" class="que-allCheck" data-columns="116106040101" data-code="topic">
                              <label for="chk_5_3_0_0">
                                <button type="button" class="active"></button>
                                <span>어휘 의미묻기 <em>(14)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_3_0_1" class="que-allCheck" data-columns="116106040102" data-code="topic">
                              <label for="chk_5_3_0_1">
                                <button type="button" class="active"></button>
                                <span>단어의 철자묻기 <em>(6)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_5_4" class="que-allCheck depth01" data-columns="11610605" data-code="medium">
                          <label for="chk_5_4">
                            <button type="button" class="dep-btn active">Grammar</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_5_4_0" class="que-allCheck depth01" data-columns="1161060501" data-code="small">
                            <label for="chk_5_4_0">
                              <button type="button" class="dep-btn active">사역동사 <span><em>(7)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_4_0_0" class="que-allCheck" data-columns="116106050101" data-code="topic">
                              <label for="chk_5_4_0_0">
                                <button type="button" class="active"></button>
                                <span>make/have/let+목적어+동사원형  <em>(7)</em></span>
                              </label>
                            </div>

                          </div>

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_5_4_1" class="que-allCheck depth01" data-columns="1161060502" data-code="small">
                            <label for="chk_5_4_1">
                              <button type="button" class="dep-btn active">too ~ to부정사 <span><em>(8)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_5_4_1_0" class="que-allCheck" data-columns="116106050201" data-code="topic">
                              <label for="chk_5_4_1_0">
                                <button type="button" class="active"></button>
                                <span>too ~ to부정사 <em>(8)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                      </div>
                    </li>

                    <li>
                      <div class="check-group title">
                        <div class="title-chk">
                          <input type="checkbox" id="chk_6" class="que-allCheck depth01" data-columns="116107" data-code="large">
                          <label for="chk_6">
                            <button type="button" class="dep-btn active">Lesson 7. A Life Full of Fun</button>
                          </label>
                        </div>
                      </div>
                      <div class="depth02">

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_6_0" class="que-allCheck depth01" data-columns="11610701" data-code="medium">
                          <label for="chk_6_0">
                            <button type="button" class="dep-btn active">Listening &amp; Speaking</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_6_0_0" class="que-allCheck depth01" data-columns="1161070101" data-code="small">
                            <label for="chk_6_0_0">
                              <button type="button" class="dep-btn active">Listening &amp; Speaking <span><em>(10)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_0_0_0" class="que-allCheck" data-columns="116107010101" data-code="topic">
                              <label for="chk_6_0_0_0">
                                <button type="button" class="active"></button>
                                <span>경험 묻고 답하기 <em>(5)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_0_0_1" class="que-allCheck" data-columns="116107010102" data-code="topic">
                              <label for="chk_6_0_0_1">
                                <button type="button" class="active"></button>
                                <span>절차 묻고 답하기 <em>(5)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_6_1" class="que-allCheck depth01" data-columns="11610702" data-code="medium">
                          <label for="chk_6_1">
                            <button type="button" class="dep-btn active">Reading</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_6_1_0" class="que-allCheck depth01" data-columns="1161070201" data-code="small">
                            <label for="chk_6_1_0">
                              <button type="button" class="dep-btn active">Reading <span><em>(36)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_0" class="que-allCheck" data-columns="116107020101" data-code="topic">
                              <label for="chk_6_1_0_0">
                                <button type="button" class="active"></button>
                                <span>글의 제목 찾기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_1" class="que-allCheck" data-columns="116107020102" data-code="topic">
                              <label for="chk_6_1_0_1">
                                <button type="button" class="active"></button>
                                <span>글의 주제 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_2" class="que-allCheck" data-columns="116107020103" data-code="topic">
                              <label for="chk_6_1_0_2">
                                <button type="button" class="active"></button>
                                <span>글의 요지 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_3" class="que-allCheck" data-columns="116107020104" data-code="topic">
                              <label for="chk_6_1_0_3">
                                <button type="button" class="active"></button>
                                <span>필자의 주장 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_4" class="que-allCheck" data-columns="116107020105" data-code="topic">
                              <label for="chk_6_1_0_4">
                                <button type="button" class="active"></button>
                                <span>글의 세부내용 파악하기 <em>(21)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_5" class="que-allCheck" data-columns="116107020106" data-code="topic">
                              <label for="chk_6_1_0_5">
                                <button type="button" class="active"></button>
                                <span>어법의 적절성 판단 <em>(8)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_6" class="que-allCheck" data-columns="116107020107" data-code="topic">
                              <label for="chk_6_1_0_6">
                                <button type="button" class="active"></button>
                                <span>문맥상 적절한 낱말 고르기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_7" class="que-allCheck" data-columns="116107020108" data-code="topic">
                              <label for="chk_6_1_0_7">
                                <button type="button" class="active"></button>
                                <span>빈칸 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_8" class="que-allCheck" data-columns="116107020109" data-code="topic">
                              <label for="chk_6_1_0_8">
                                <button type="button" class="active"></button>
                                <span>글의 순서 찾기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_9" class="que-allCheck" data-columns="116107020110" data-code="topic">
                              <label for="chk_6_1_0_9">
                                <button type="button" class="active"></button>
                                <span>주어진 문장 위치 추론하기 <em>(4)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_10" class="que-allCheck" data-columns="116107020111" data-code="topic">
                              <label for="chk_6_1_0_10">
                                <button type="button" class="active"></button>
                                <span>요약문 완성하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_11" class="que-allCheck" data-columns="116107020112" data-code="topic">
                              <label for="chk_6_1_0_11">
                                <button type="button" class="active"></button>
                                <span>지칭 추론하기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_1_0_12" class="que-allCheck" data-columns="116107020113" data-code="topic">
                              <label for="chk_6_1_0_12">
                                <button type="button" class="active"></button>
                                <span>심경 파악하기 <em>(1)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_6_2" class="que-allCheck depth01" data-columns="11610703" data-code="medium">
                          <label for="chk_6_2">
                            <button type="button" class="dep-btn active">Writing</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_6_2_0" class="que-allCheck depth01" data-columns="1161070301" data-code="small">
                            <label for="chk_6_2_0">
                              <button type="button" class="dep-btn active">Writing <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_2_0_0" class="que-allCheck" data-columns="116107030101" data-code="topic">
                              <label for="chk_6_2_0_0">
                                <button type="button" class="active"></button>
                                <span>중심 내용 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_2_0_1" class="que-allCheck" data-columns="116107030102" data-code="topic">
                              <label for="chk_6_2_0_1">
                                <button type="button" class="active"></button>
                                <span>세부 내용 쓰기 <em>(5)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_2_0_2" class="que-allCheck" data-columns="116107030103" data-code="topic">
                              <label for="chk_6_2_0_2">
                                <button type="button" class="active"></button>
                                <span>실용문 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_2_0_3" class="que-allCheck" data-columns="116107030104" data-code="topic">
                              <label for="chk_6_2_0_3">
                                <button type="button" class="active"></button>
                                <span>묘사하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_2_0_4" class="que-allCheck" data-columns="116107030105" data-code="topic">
                              <label for="chk_6_2_0_4">
                                <button type="button" class="active"></button>
                                <span>설명하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_2_0_5" class="que-allCheck" data-columns="116107030106" data-code="topic">
                              <label for="chk_6_2_0_5">
                                <button type="button" class="active"></button>
                                <span>요약하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_6_3" class="que-allCheck depth01" data-columns="11610704" data-code="medium">
                          <label for="chk_6_3">
                            <button type="button" class="dep-btn active">Vocabulary</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_6_3_0" class="que-allCheck depth01" data-columns="1161070401" data-code="small">
                            <label for="chk_6_3_0">
                              <button type="button" class="dep-btn active">Vocabulary <span><em>(21)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_3_0_0" class="que-allCheck" data-columns="116107040101" data-code="topic">
                              <label for="chk_6_3_0_0">
                                <button type="button" class="active"></button>
                                <span>어휘 의미묻기 <em>(15)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_3_0_1" class="que-allCheck" data-columns="116107040102" data-code="topic">
                              <label for="chk_6_3_0_1">
                                <button type="button" class="active"></button>
                                <span>단어의 철자묻기 <em>(6)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_6_4" class="que-allCheck depth01" data-columns="11610705" data-code="medium">
                          <label for="chk_6_4">
                            <button type="button" class="dep-btn active">Grammar</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_6_4_0" class="que-allCheck depth01" data-columns="1161070501" data-code="small">
                            <label for="chk_6_4_0">
                              <button type="button" class="dep-btn active">시제 <span><em>(8)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_4_0_0" class="que-allCheck" data-columns="116107050101" data-code="topic">
                              <label for="chk_6_4_0_0">
                                <button type="button" class="active"></button>
                                <span>현재완료  <em>(8)</em></span>
                              </label>
                            </div>

                          </div>

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_6_4_1" class="que-allCheck depth01" data-columns="1161070502" data-code="small">
                            <label for="chk_6_4_1">
                              <button type="button" class="dep-btn active">분사 <span><em>(7)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_6_4_1_0" class="que-allCheck" data-columns="116107050201" data-code="topic">
                              <label for="chk_6_4_1_0">
                                <button type="button" class="active"></button>
                                <span>명사를 꾸미는 분사 <em>(7)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                      </div>
                    </li>

                    <li>
                      <div class="check-group title">
                        <div class="title-chk">
                          <input type="checkbox" id="chk_7" class="que-allCheck depth01" data-columns="116108" data-code="large">
                          <label for="chk_7">
                            <button type="button" class="dep-btn active">Lesson 8. Viva, South America!</button>
                          </label>
                        </div>
                      </div>
                      <div class="depth02">

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_7_0" class="que-allCheck depth01" data-columns="11610801" data-code="medium">
                          <label for="chk_7_0">
                            <button type="button" class="dep-btn active">Listening &amp; Speaking</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_7_0_0" class="que-allCheck depth01" data-columns="1161080101" data-code="small">
                            <label for="chk_7_0_0">
                              <button type="button" class="dep-btn active">Listening &amp; Speaking <span><em>(10)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_0_0_0" class="que-allCheck" data-columns="116108010101" data-code="topic">
                              <label for="chk_7_0_0_0">
                                <button type="button" class="active"></button>
                                <span>알고 있는지 묻기 <em>(5)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_0_0_1" class="que-allCheck" data-columns="116108010102" data-code="topic">
                              <label for="chk_7_0_0_1">
                                <button type="button" class="active"></button>
                                <span>놀람 표현하기 <em>(5)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_7_1" class="que-allCheck depth01" data-columns="11610802" data-code="medium">
                          <label for="chk_7_1">
                            <button type="button" class="dep-btn active">Reading</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_7_1_0" class="que-allCheck depth01" data-columns="1161080201" data-code="small">
                            <label for="chk_7_1_0">
                              <button type="button" class="dep-btn active">Reading <span><em>(33)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_0" class="que-allCheck" data-columns="116108020101" data-code="topic">
                              <label for="chk_7_1_0_0">
                                <button type="button" class="active"></button>
                                <span>글의 제목 찾기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_1" class="que-allCheck" data-columns="116108020102" data-code="topic">
                              <label for="chk_7_1_0_1">
                                <button type="button" class="active"></button>
                                <span>글의 주제 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_2" class="que-allCheck" data-columns="116108020103" data-code="topic">
                              <label for="chk_7_1_0_2">
                                <button type="button" class="active"></button>
                                <span>글의 요지 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_3" class="que-allCheck" data-columns="116108020104" data-code="topic">
                              <label for="chk_7_1_0_3">
                                <button type="button" class="active"></button>
                                <span>필자의 주장 찾기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_4" class="que-allCheck" data-columns="116108020105" data-code="topic">
                              <label for="chk_7_1_0_4">
                                <button type="button" class="active"></button>
                                <span>글의 세부내용 파악하기 <em>(18)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_5" class="que-allCheck" data-columns="116108020106" data-code="topic">
                              <label for="chk_7_1_0_5">
                                <button type="button" class="active"></button>
                                <span>어법의 적절성 판단 <em>(4)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_6" class="que-allCheck" data-columns="116108020107" data-code="topic">
                              <label for="chk_7_1_0_6">
                                <button type="button" class="active"></button>
                                <span>문맥상 적절한 낱말 고르기 <em>(2)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_7" class="que-allCheck" data-columns="116108020108" data-code="topic">
                              <label for="chk_7_1_0_7">
                                <button type="button" class="active"></button>
                                <span>빈칸 추론하기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_8" class="que-allCheck" data-columns="116108020109" data-code="topic">
                              <label for="chk_7_1_0_8">
                                <button type="button" class="active"></button>
                                <span>글의 순서 찾기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_9" class="que-allCheck" data-columns="116108020110" data-code="topic">
                              <label for="chk_7_1_0_9">
                                <button type="button" class="active"></button>
                                <span>주어진 문장 위치 추론하기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_10" class="que-allCheck" data-columns="116108020111" data-code="topic">
                              <label for="chk_7_1_0_10">
                                <button type="button" class="active"></button>
                                <span>요약문 완성하기 <em>(1)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_11" class="que-allCheck" data-columns="116108020112" data-code="topic">
                              <label for="chk_7_1_0_11">
                                <button type="button" class="active"></button>
                                <span>지칭 추론하기 <em>(3)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_1_0_12" class="que-allCheck" data-columns="116108020113" data-code="topic">
                              <label for="chk_7_1_0_12">
                                <button type="button" class="active"></button>
                                <span>심경 파악하기 <em>(1)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_7_2" class="que-allCheck depth01" data-columns="11610803" data-code="medium">
                          <label for="chk_7_2">
                            <button type="button" class="dep-btn active">Writing</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_7_2_0" class="que-allCheck depth01" data-columns="1161080301" data-code="small">
                            <label for="chk_7_2_0">
                              <button type="button" class="dep-btn active">Writing <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_2_0_0" class="que-allCheck" data-columns="116108030101" data-code="topic">
                              <label for="chk_7_2_0_0">
                                <button type="button" class="active"></button>
                                <span>중심 내용 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_2_0_1" class="que-allCheck" data-columns="116108030102" data-code="topic">
                              <label for="chk_7_2_0_1">
                                <button type="button" class="active"></button>
                                <span>세부 내용 쓰기 <em>(5)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_2_0_2" class="que-allCheck" data-columns="116108030103" data-code="topic">
                              <label for="chk_7_2_0_2">
                                <button type="button" class="active"></button>
                                <span>실용문 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_2_0_3" class="que-allCheck" data-columns="116108030104" data-code="topic">
                              <label for="chk_7_2_0_3">
                                <button type="button" class="active"></button>
                                <span>묘사하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_2_0_4" class="que-allCheck" data-columns="116108030105" data-code="topic">
                              <label for="chk_7_2_0_4">
                                <button type="button" class="active"></button>
                                <span>설명하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_2_0_5" class="que-allCheck" data-columns="116108030106" data-code="topic">
                              <label for="chk_7_2_0_5">
                                <button type="button" class="active"></button>
                                <span>요약하는 글 쓰기 <em>(0)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_7_3" class="que-allCheck depth01" data-columns="11610804" data-code="medium">
                          <label for="chk_7_3">
                            <button type="button" class="dep-btn active">Vocabulary</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_7_3_0" class="que-allCheck depth01" data-columns="1161080401" data-code="small">
                            <label for="chk_7_3_0">
                              <button type="button" class="dep-btn active">Vocabulary <span><em>(20)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_3_0_0" class="que-allCheck" data-columns="116108040101" data-code="topic">
                              <label for="chk_7_3_0_0">
                                <button type="button" class="active"></button>
                                <span>어휘 의미묻기 <em>(15)</em></span>
                              </label>
                            </div>

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_3_0_1" class="que-allCheck" data-columns="116108040102" data-code="topic">
                              <label for="chk_7_3_0_1">
                                <button type="button" class="active"></button>
                                <span>단어의 철자묻기 <em>(5)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                        <div class="check-group class-depth-2">
                          <input type="checkbox" id="chk_7_4" class="que-allCheck depth01" data-columns="11610805" data-code="medium">
                          <label for="chk_7_4">
                            <button type="button" class="dep-btn active">Grammar</button>
                          </label>
                        </div>
                        <div class="depth03">

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_7_4_0" class="que-allCheck depth01" data-columns="1161080501" data-code="small">
                            <label for="chk_7_4_0">
                              <button type="button" class="dep-btn active">최상급 <span><em>(5)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_4_0_0" class="que-allCheck" data-columns="116108050101" data-code="topic">
                              <label for="chk_7_4_0_0">
                                <button type="button" class="active"></button>
                                <span>최상급 <em>(5)</em></span>
                              </label>
                            </div>

                          </div>

                          <div class="check-group class-depth-3">
                            <input type="checkbox" id="chk_7_4_1" class="que-allCheck depth01" data-columns="1161080502" data-code="small">
                            <label for="chk_7_4_1">
                              <button type="button" class="dep-btn active">의문문 <span><em>(11)</em></span></button>
                            </label>
                          </div>
                          <div class="depth04">

                            <div class="check-group  class-depth-4">
                              <input type="checkbox" id="chk_7_4_1_0" class="que-allCheck" data-columns="116108050201" data-code="topic">
                              <label for="chk_7_4_1_0">
                                <button type="button" class="active"></button>
                                <span>간접의문문  <em>(11)</em></span>
                              </label>
                            </div>

                          </div>

                        </div>

                      </div>
                    </li>

                  </ul>
                </div>
              </div>
            </div>

            <div class="type-box-wrap cursorDefault">
              <div class="type-box scroll-inner">
                <div class="title-top">
                  <span>출제옵션</span>
                </div>
                <div class="box">
                  <div class="title-wrap">
                    <span class="tit-text">문제 수<em>최대 30문제</em></span>
                  </div>
                  <div class="count-area">
                    <div class="btn-wrap" id="btn-num-group">
                      <button type="button" class="btn-line" id="q_10" disabled="disabled">10</button>
                      <button type="button" class="btn-line" id="q_15" disabled="disabled">15</button>
                      <button type="button" class="btn-line" id="q_20" disabled="disabled">20</button>
                      <button type="button" class="btn-line" id="q_25" disabled="disabled">25</button>
                      <button type="button" class="btn-line" id="q_30" disabled="disabled">30</button>
                    </div>
                    <div class="input-area">
                      <span class="num">총 <input type="number" value="" id="txt-exam-num" oninput="questionCountCheck()" data-columns="30" disabled="disabled"> 문제</span>
                      <div class="txt" id="questionCntMessage"></div>
                    </div>

                  </div>
                </div>
                <div class="box">
                  <div class="title-wrap">
                    <span class="tit-text">출처</span>
                    <div class="right-area">
                    </div>
                  </div>
                  <div class="btn-wrap multi" id="origin-btn-group">
                    <button type="button" class="btn-line" id="origin_teacher" disabled="disabled">교사용(교사용 DVD, 지도서, 신규 개발 등)</button>
                    <button type="button" class="btn-line disable" disabled="disabled" style="background-color: #fafafa; color: #a4a6ac; border: 1px solid #e0e0e0; cursor: default;">학생용(자습서, 평가문제집 등)</button>
                  </div>
                </div>
                <div class="box">
                  <div class="title-wrap">
                    <span class="tit-text">평가 영역</span>
                    <div class="right-area">
                    </div>
                  </div>
                  <div class="btn-wrap multi" id="category-btn-group">

                    <button type="button" class="btn-line" data-value="759" id="eval_759" disabled="disabled">어휘 및 문법성 판단</button>

                    <button type="button" class="btn-line" data-value="760" id="eval_760" disabled="disabled">사실적 이해력</button>

                    <button type="button" class="btn-line" data-value="761" id="eval_761" disabled="disabled">추론적 이해력</button>

                    <button type="button" class="btn-line" data-value="762" id="eval_762" disabled="disabled">적용력</button>

                  </div>
                </div>
                <div class="box">
                  <div class="title-wrap">
                    <span class="tit-text">문제 형태</span>
                    <div class="right-area">
                    </div>
                  </div>
                  <div class="btn-wrap multi" id="type-btn-group">
                    <button type="button" class="btn-line" data-value="multiple" id="q_multiple" disabled="disabled">객관식</button>
                    <button type="button" class="btn-line" data-value="subjective" id="q_subjective" disabled="disabled">주관식</button>
                  </div>
                </div>
                <div class="box">
                  <div class="title-wrap">
                    <span class="tit-text">난이도 구성</span>
                  </div>
                  <div class="step-wrap" id="level-btn-group">
                    <button type="button" class="btn-line type02 color01" data-step="stap1" onclick="levelCheck()" disabled="disabled">최하</button>
                    <button type="button" class="btn-line type02 color02" data-step="stap2" onclick="levelCheck()" disabled="disabled">하</button>
                    <button type="button" class="btn-line type02 color03" data-step="stap3" onclick="levelCheck()" disabled="disabled">중</button>
                    <button type="button" class="btn-line type02 color04" data-step="stap4" onclick="levelCheck()" disabled="disabled">상</button>
                    <button type="button" class="btn-line type02 color05" data-step="stap5" onclick="levelCheck()" disabled="disabled">최상</button>
                  </div>
                </div>
                <div class="box">
                  <div class="title-wrap">
                                                    <span class="tit-text">난이도별 문제 수
                                                        <button type="button" class="btn-icon2 pop-btn" id="btn-pop-que-range" data-pop="que-range-pop" disabled="disabled"><i class="setting"></i></button>
                                                    </span>
                  </div>
                  <div class="range-wrap" id="level-distribution-btn-group">
                    <span class="range color01" data-step="stap1" id="level_stap1" style="display: none;">최하(0)</span>
                    <span class="range color02" data-step="stap2" id="level_stap2" style="display: none;">하(0)</span>
                    <span class="range color03" data-step="stap3" id="level_stap3" style="display: none;">중(0)</span>
                    <span class="range color04" data-step="stap4" id="level_stap4" style="display: none;">상(0)</span>
                    <span class="range color05" data-step="stap5" id="level_stap5" style="display: none;">최상(0)</span>
                  </div>
                </div>

              </div>
              <div class="bottom-box">
                <p class="total-num" id="total-num" style="display:none">총 <span id="total-num-val"></span>문제</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="step-btn-wrap">
      <button type="button" class="btn-step" onclick="moveToStep0()">출제 방법 선택</button>
      <button type="button" class="btn-step next" onclick="moveExamStep2()">STEP2 문항 편집</button>

    </div>
  </div>
</div>
<div class="dim"></div>

<!-- 난이도 문제 수 설정 팝업 -->
<div class="pop-wrap range-type" data-pop="que-range-pop">
  <div class="pop-inner">
    <div class="pop-header">
      <span>난이도별 문제 수 설정</span>
      <button type="button" class="pop-close"></button>
    </div>
    <div class="pop-content">
      <span class="txt">문제 수를 입력하여<br> 난이도별 문제 수를 조정하세요.</span>
      <div class="range-wrap" id="pop-range-wrap-set">
        <!-- S: 문제 수 맞지 않을 시 .fail 클래스 추가 -->
        <div class="range color01">
          <span class="color01">최하</span>
          <input type="number" id="pop_level_stap1" min="0">
        </div>
        <div class="range color02">
          <span class="color02">하</span>
          <input type="number" id="pop_level_stap2" min="0">
        </div>
        <div class="range color03">
          <span class="color03">중</span>
          <input type="number" id="pop_level_stap3" min="0">
        </div>
        <div class="range color04">
          <span class="color04">상</span>
          <input type="number" id="pop_level_stap4" min="0">
        </div>
        <div class="range color05">
          <span class="color05">최상</span>
          <input type="number" id="pop_level_stap5" min="0">
        </div>
        <div class="range total fail">
          <span>합계</span>
          <span class="num" id="pop_question_sum">0</span>
        </div>
        <!-- E: 문제 수 맞지 않을 시 .fail 클래스 추가 -->
      </div>
    </div>
    <div class="pop-footer">
      <button onclick="levelCntClear();">초기화</button>
      <button id="range_pop_save" onclick="levelCntSave();">저장</button>
    </div>
  </div>
</div>

<!-- 문항 충족하지 않을 시 노출 팝업 -->
<div class="pop-wrap range-type02" data-pop="que-pop">
  <div class="pop-inner">
    <input type="hidden" id="nxt-data" value="">
    <div class="pop-header">
      <span>문항 구성 자동 변경</span>
      <button type="button" class="pop-close"></button>
    </div>
    <div class="pop-content">
      <span class="txt">사용자가 원하는 문항 구성을 할 수 없어<br>문항 구성이 자동으로 변경되었습니다.</span>
      <div class="range-wrap">
        <div class="range" id="pop-level1" style="display: none">
          <span class="color01">최하</span>
          <span class="num">-</span>
        </div>
        <div class="range" id="pop-level2" style="display: none">
          <span class="color02">하</span>
          <span class="num">-</span>
        </div>
        <div class="range" id="pop-level3" style="display: none">
          <span class="color03">중</span>
          <span class="num">-</span>
        </div>
        <div class="range" id="pop-level4" style="display: none">
          <span class="color04">상</span>
          <span class="num">-</span>
        </div>
        <div class="range" id="pop-level5" style="display: none">
          <span class="color05">최상</span>
          <span class="num">-</span>
        </div>
        <div class="range total" id="pop-total-sum">
          <span>합계</span>
          <span class="num">-</span>
        </div>
      </div>
      <span class="txt">해당 문제 구성으로 출제하시겠습니까?</span>
    </div>
    <div class="pop-footer">
      <button onclick="closePop('que-pop')">취소</button>
      <button class="pop-close" onclick="moveToStep2()">확인</button>
    </div>
  </div>
</div>
<!-- 문항 충족하지 않을 시 노출 팝업 -->

<!-- 문항 0인 경우 노출 팝업 -->
<div class="pop-wrap range-type02" data-pop="no-data-pop">
  <div class="pop-inner">
    <div class="pop-header">
      <span>&nbsp;</span>
      <button type="button" class="pop-close"></button>
    </div>
    <div class="pop-content">
      <span class="txt">사용자가 선택한 단원 정보, 출제 옵션의 총 문항 수가 '0'입니다. </span>
      <span class="txt">단원 선택 추가 및 출제 옵션을 변경해 주세요.</span>
    </div>
    <div class="pop-footer">
      <button class="pop-close" onclick="closePop('que-pop')">확인</button>
    </div>
  </div>
</div>
<!-- 문항 0인 경우 노출 팝업 -->

<!-- <script type="text/javascript" src="/resource/js/common/common.js?"></script> -->
<script type="text/javascript" src="/resource/js/stepOne.js"></script>

</body>
</html>
