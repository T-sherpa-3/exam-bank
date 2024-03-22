<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0047)https://-----/customTest/step0 -->
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

    <script src="/resource/popup/js/jquery-1.12.4.min.js"></script>
    <script src="/resource/popup/js/jquery-3.6.0.min.js"></script>
    <script src="/resource/popup/js/jquery-ui.js"></script>
    <script src="/resource/popup/js/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="/resource/popup/js/common_que.js"></script>
    <script type="text/javascript" src="/resource/popup/js/lodash.min.js"></script>
    <script>

        function moveToStep1() {
            let new_form = $('<form></form>');
            new_form.attr("name", "Subject");
            new_form.attr("charset", "UTF-8");
            new_form.attr("method", "post");
            new_form.attr("action", "/customExam/step1");

            new_form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: $("#subjectId").val()}));
            new_form.append($('<input/>', {type: 'hidden', name: 'subjectName', value: $("#subjectName").text()}));
            new_form.append($('<input/>', {type: 'hidden', name: 'curriculumName', value: $("#curriculumName").text()}));

            new_form.appendTo('body');
            new_form.submit();
        }
    </script>
    <script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            jax: ["input/TeX","output/SVG"],
            showProcessingMessages: false,
            tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]},
            ignoreClass: "[a-zA-Z1-9]*",
            processClass:'question',
            messageStyle: "none",
            "SVG": {linebreaks: { automatic: true }},
            TeX: {
                Macros: {
                longdiv: ["{\\overline{\\smash{)}#1}}", 1]
                }
            },
            "HTML-CSS": {
                linebreaks: { automatic: true }
           },
            "CommonHTML": { linebreaks: { automatic: true } }
        });
    </script>
<%--    <script id="MathJax-script" src="./T셀파 문제은행_출제방법_files/tex-mml-chtml.js.다운로드"></script>--%>
    <style type="text/css">.CtxtMenu_InfoClose {  top:.2em; right:.2em;}
    .CtxtMenu_InfoContent {  overflow:auto; text-align:left; font-size:80%;  padding:.4em .6em; border:1px inset; margin:1em 0px;  max-height:20em; max-width:30em; background-color:#EEEEEE;  white-space:normal;}
    .CtxtMenu_Info.CtxtMenu_MousePost {outline:none;}
    .CtxtMenu_Info {  position:fixed; left:50%; width:auto; text-align:center;  border:3px outset; padding:1em 2em; background-color:#DDDDDD;  color:black;  cursor:default; font-family:message-box; font-size:120%;  font-style:normal; text-indent:0; text-transform:none;  line-height:normal; letter-spacing:normal; word-spacing:normal;  word-wrap:normal; white-space:nowrap; float:none; z-index:201;  border-radius: 15px;                     /* Opera 10.5 and IE9 */  -webkit-border-radius:15px;               /* Safari and Chrome */  -moz-border-radius:15px;                  /* Firefox */  -khtml-border-radius:15px;                /* Konqueror */  box-shadow:0px 10px 20px #808080;         /* Opera 10.5 and IE9 */  -webkit-box-shadow:0px 10px 20px #808080; /* Safari 3 & Chrome */  -moz-box-shadow:0px 10px 20px #808080;    /* Forefox 3.5 */  -khtml-box-shadow:0px 10px 20px #808080;  /* Konqueror */  filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2, Color="gray", Positive="true"); /* IE */}
    </style><style type="text/css">.CtxtMenu_MenuClose {  position:absolute;  cursor:pointer;  display:inline-block;  border:2px solid #AAA;  border-radius:18px;  -webkit-border-radius: 18px;             /* Safari and Chrome */  -moz-border-radius: 18px;                /* Firefox */  -khtml-border-radius: 18px;              /* Konqueror */  font-family: "Courier New", Courier;  font-size:24px;  color:#F0F0F0}
    .CtxtMenu_MenuClose span {  display:block; background-color:#AAA; border:1.5px solid;  border-radius:18px;  -webkit-border-radius: 18px;             /* Safari and Chrome */  -moz-border-radius: 18px;                /* Firefox */  -khtml-border-radius: 18px;              /* Konqueror */  line-height:0;  padding:8px 0 6px     /* may need to be browser-specific */}
    .CtxtMenu_MenuClose:hover {  color:white!important;  border:2px solid #CCC!important}
    .CtxtMenu_MenuClose:hover span {  background-color:#CCC!important}
    .CtxtMenu_MenuClose:hover:focus {  outline:none}
    </style><style type="text/css">.CtxtMenu_Menu {  position:absolute;  background-color:white;  color:black;  width:auto; padding:5px 0px;  border:1px solid #CCCCCC; margin:0; cursor:default;  font: menu; text-align:left; text-indent:0; text-transform:none;  line-height:normal; letter-spacing:normal; word-spacing:normal;  word-wrap:normal; white-space:nowrap; float:none; z-index:201;  border-radius: 5px;                     /* Opera 10.5 and IE9 */  -webkit-border-radius: 5px;             /* Safari and Chrome */  -moz-border-radius: 5px;                /* Firefox */  -khtml-border-radius: 5px;              /* Konqueror */  box-shadow:0px 10px 20px #808080;         /* Opera 10.5 and IE9 */  -webkit-box-shadow:0px 10px 20px #808080; /* Safari 3 & Chrome */  -moz-box-shadow:0px 10px 20px #808080;    /* Forefox 3.5 */  -khtml-box-shadow:0px 10px 20px #808080;  /* Konqueror */}
    .CtxtMenu_MenuItem {  padding: 1px 2em;  background:transparent;}
    .CtxtMenu_MenuArrow {  position:absolute; right:.5em; padding-top:.25em; color:#666666;  font-family: null; font-size: .75em}
    .CtxtMenu_MenuActive .CtxtMenu_MenuArrow {color:white}
    .CtxtMenu_MenuArrow.CtxtMenu_RTL {left:.5em; right:auto}
    .CtxtMenu_MenuCheck {  position:absolute; left:.7em;  font-family: null}
    .CtxtMenu_MenuCheck.CtxtMenu_RTL { right:.7em; left:auto }
    .CtxtMenu_MenuRadioCheck {  position:absolute; left: .7em;}
    .CtxtMenu_MenuRadioCheck.CtxtMenu_RTL {  right: .7em; left:auto}
    .CtxtMenu_MenuInputBox {  padding-left: 1em; right:.5em; color:#666666;  font-family: null;}
    .CtxtMenu_MenuInputBox.CtxtMenu_RTL {  left: .1em;}
    .CtxtMenu_MenuComboBox {  left:.1em; padding-bottom:.5em;}
    .CtxtMenu_MenuSlider {  left: .1em;}
    .CtxtMenu_SliderValue {  position:absolute; right:.1em; padding-top:.25em; color:#333333;  font-size: .75em}
    .CtxtMenu_SliderBar {  outline: none; background: #d3d3d3}
    .CtxtMenu_MenuLabel {  padding: 1px 2em 3px 1.33em;  font-style:italic}
    .CtxtMenu_MenuRule {  border-top: 1px solid #DDDDDD;  margin: 4px 3px;}
    .CtxtMenu_MenuDisabled {  color:GrayText}
    .CtxtMenu_MenuActive {  background-color: #606872;  color: white;}
    .CtxtMenu_MenuDisabled:focus {  background-color: #E8E8E8}
    .CtxtMenu_MenuLabel:focus {  background-color: #E8E8E8}
    .CtxtMenu_ContextMenu:focus {  outline:none}
    .CtxtMenu_ContextMenu .CtxtMenu_MenuItem:focus {  outline:none}
    .CtxtMenu_SelectionMenu {  position:relative; float:left;  border-bottom: none; -webkit-box-shadow:none; -webkit-border-radius:0px; }
    .CtxtMenu_SelectionItem {  padding-right: 1em;}
    .CtxtMenu_Selection {  right: 40%; width:50%; }
    .CtxtMenu_SelectionBox {  padding: 0em; max-height:20em; max-width: none;  background-color:#FFFFFF;}
    .CtxtMenu_SelectionDivider {  clear: both; border-top: 2px solid #000000;}
    .CtxtMenu_Menu .CtxtMenu_MenuClose {  top:-10px; left:-10px}
    </style><style>
        .example-area + .example-area{
            margin-top: 40px;
        }
    </style><style id="MJX-CHTML-styles">
        mjx-container[jax="CHTML"] {
            line-height: 0;
        }

        mjx-container [space="1"] {
            margin-left: .111em;
        }

        mjx-container [space="2"] {
            margin-left: .167em;
        }

        mjx-container [space="3"] {
            margin-left: .222em;
        }

        mjx-container [space="4"] {
            margin-left: .278em;
        }

        mjx-container [space="5"] {
            margin-left: .333em;
        }

        mjx-container [rspace="1"] {
            margin-right: .111em;
        }

        mjx-container [rspace="2"] {
            margin-right: .167em;
        }

        mjx-container [rspace="3"] {
            margin-right: .222em;
        }

        mjx-container [rspace="4"] {
            margin-right: .278em;
        }

        mjx-container [rspace="5"] {
            margin-right: .333em;
        }

        mjx-container [size="s"] {
            font-size: 70.7%;
        }

        mjx-container [size="ss"] {
            font-size: 50%;
        }

        mjx-container [size="Tn"] {
            font-size: 60%;
        }

        mjx-container [size="sm"] {
            font-size: 85%;
        }

        mjx-container [size="lg"] {
            font-size: 120%;
        }

        mjx-container [size="Lg"] {
            font-size: 144%;
        }

        mjx-container [size="LG"] {
            font-size: 173%;
        }

        mjx-container [size="hg"] {
            font-size: 207%;
        }

        mjx-container [size="HG"] {
            font-size: 249%;
        }

        mjx-container [width="full"] {
            width: 100%;
        }

        mjx-box {
            display: inline-block;
        }

        mjx-block {
            display: block;
        }

        mjx-itable {
            display: inline-table;
        }

        mjx-row {
            display: table-row;
        }

        mjx-row > * {
            display: table-cell;
        }

        mjx-mtext {
            display: inline-block;
        }

        mjx-mstyle {
            display: inline-block;
        }

        mjx-merror {
            display: inline-block;
            color: red;
            background-color: yellow;
        }

        mjx-mphantom {
            visibility: hidden;
        }

        _::-webkit-full-page-media, _:future, :root mjx-container {
            will-change: opacity;
        }

        mjx-assistive-mml {
            position: absolute !important;
            top: 0px;
            left: 0px;
            clip: rect(1px, 1px, 1px, 1px);
            padding: 1px 0px 0px 0px !important;
            border: 0px !important;
            display: block !important;
            width: auto !important;
            overflow: hidden !important;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        mjx-assistive-mml[display="block"] {
            width: 100% !important;
        }

        mjx-c::before {
            display: block;
            width: 0;
        }

        .MJX-TEX {
            font-family: MJXZERO, MJXTEX;
        }

        .TEX-B {
            font-family: MJXZERO, MJXTEX-B;
        }

        .TEX-I {
            font-family: MJXZERO, MJXTEX-I;
        }

        .TEX-MI {
            font-family: MJXZERO, MJXTEX-MI;
        }

        .TEX-BI {
            font-family: MJXZERO, MJXTEX-BI;
        }

        .TEX-S1 {
            font-family: MJXZERO, MJXTEX-S1;
        }

        .TEX-S2 {
            font-family: MJXZERO, MJXTEX-S2;
        }

        .TEX-S3 {
            font-family: MJXZERO, MJXTEX-S3;
        }

        .TEX-S4 {
            font-family: MJXZERO, MJXTEX-S4;
        }

        .TEX-A {
            font-family: MJXZERO, MJXTEX-A;
        }

        .TEX-C {
            font-family: MJXZERO, MJXTEX-C;
        }

        .TEX-CB {
            font-family: MJXZERO, MJXTEX-CB;
        }

        .TEX-FR {
            font-family: MJXZERO, MJXTEX-FR;
        }

        .TEX-FRB {
            font-family: MJXZERO, MJXTEX-FRB;
        }

        .TEX-SS {
            font-family: MJXZERO, MJXTEX-SS;
        }

        .TEX-SSB {
            font-family: MJXZERO, MJXTEX-SSB;
        }

        .TEX-SSI {
            font-family: MJXZERO, MJXTEX-SSI;
        }

        .TEX-SC {
            font-family: MJXZERO, MJXTEX-SC;
        }

        .TEX-T {
            font-family: MJXZERO, MJXTEX-T;
        }

        .TEX-V {
            font-family: MJXZERO, MJXTEX-V;
        }

        .TEX-VB {
            font-family: MJXZERO, MJXTEX-VB;
        }

        mjx-stretchy-v mjx-c, mjx-stretchy-h mjx-c {
            font-family: MJXZERO, MJXTEX-S1, MJXTEX-S4, MJXTEX, MJXTEX-A ! important;
        }

        @font-face /* 0 */ {
            font-family: MJXZERO;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Zero.woff") format("woff");
        }

        @font-face /* 1 */ {
            font-family: MJXTEX;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Main-Regular.woff") format("woff");
        }

        @font-face /* 2 */ {
            font-family: MJXTEX-B;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Main-Bold.woff") format("woff");
        }

        @font-face /* 3 */ {
            font-family: MJXTEX-I;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Math-Italic.woff") format("woff");
        }

        @font-face /* 4 */ {
            font-family: MJXTEX-MI;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Main-Italic.woff") format("woff");
        }

        @font-face /* 5 */ {
            font-family: MJXTEX-BI;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Math-BoldItalic.woff") format("woff");
        }

        @font-face /* 6 */ {
            font-family: MJXTEX-S1;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Size1-Regular.woff") format("woff");
        }

        @font-face /* 7 */ {
            font-family: MJXTEX-S2;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Size2-Regular.woff") format("woff");
        }

        @font-face /* 8 */ {
            font-family: MJXTEX-S3;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Size3-Regular.woff") format("woff");
        }

        @font-face /* 9 */ {
            font-family: MJXTEX-S4;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Size4-Regular.woff") format("woff");
        }

        @font-face /* 10 */ {
            font-family: MJXTEX-A;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_AMS-Regular.woff") format("woff");
        }

        @font-face /* 11 */ {
            font-family: MJXTEX-C;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Calligraphic-Regular.woff") format("woff");
        }

        @font-face /* 12 */ {
            font-family: MJXTEX-CB;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Calligraphic-Bold.woff") format("woff");
        }

        @font-face /* 13 */ {
            font-family: MJXTEX-FR;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Fraktur-Regular.woff") format("woff");
        }

        @font-face /* 14 */ {
            font-family: MJXTEX-FRB;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Fraktur-Bold.woff") format("woff");
        }

        @font-face /* 15 */ {
            font-family: MJXTEX-SS;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_SansSerif-Regular.woff") format("woff");
        }

        @font-face /* 16 */ {
            font-family: MJXTEX-SSB;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_SansSerif-Bold.woff") format("woff");
        }

        @font-face /* 17 */ {
            font-family: MJXTEX-SSI;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_SansSerif-Italic.woff") format("woff");
        }

        @font-face /* 18 */ {
            font-family: MJXTEX-SC;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Script-Regular.woff") format("woff");
        }

        @font-face /* 19 */ {
            font-family: MJXTEX-T;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Typewriter-Regular.woff") format("woff");
        }

        @font-face /* 20 */ {
            font-family: MJXTEX-V;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Vector-Regular.woff") format("woff");
        }

        @font-face /* 21 */ {
            font-family: MJXTEX-VB;
            src: url("https://testbank.tsherpa.co.kr/js/mathjax3/es5/output/chtml/fonts/woff-v2/MathJax_Vector-Bold.woff") format("woff");
        }
    </style></head>










<!-- SSO 적용 로그인 스크립트 -->











<body>
<div id="wrap" class="full-pop-que">
    <div class="full-pop-wrap">


        <div class="pop-header">
            <ul class="title" id="custom-pop-header-title">
                <li style="" id="custom-step0" class="active"><img src="/resource/popup/img/ico_step_active.png" alt="">출제 방법 선택</li>



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
            <div class="view-box view-box-step0">
                <div class="view-top">
                    <div class="paper-info">

                        <span></span>
                        <input type="hidden" id="subjectId" name="subjectId" value="${subjectId}">
                        <span id="subjectName" class="subject">${subjectName}</span>
                        <span id="curriculumName">${curriculumName}</span>
                        <span class="number">
								    <span class="tooltip-wrap">
									<button class="tip-btn blue" id="chk_item_cnt">0</button>
									<span class="tooltip type02">
										<div class="tool-type01">선택한 문항수</div>
									</span>
								</span>
								<span>/</span>
								<span class="tooltip-wrap">
									<button class="tip-btn">90</button>
									<span class="tooltip type02">
										<div class="tool-type01">최대 문항수</div>
									</span>
								</span>
							</span>
                    </div>
                    <div class="btn-wrap">
                        <button class="btn-icon" id="modify-setting-btn"><i class="edit"></i>선택한 시험지 편집하기</button>
                        <button class="btn-icon type-white" id="create-paper-btn" onclick="moveToStep1();"><i class="newpaper"></i>신규 시험지 만들기</button>
                    </div>
                </div>
                <div class="view-bottom">
                    <div class="tab-list-type01 unit-acc-wrap">
                        <div class="scroll-inner">

                            <%-- 지원 테스트 start --%>
                            <c:forEach var="item" items="${examListResponse}">

                            <button type="button" class="acc-btn">${item.largeChapterName}</button>
                            <div class="cnt">
                                <div class="table">
                                    <div class="fix-head">
                                        <span>선택</span>
                                        <span>시험지명</span>
                                        <span>문항수</span>
                                        <span>미리보기</span>
                                        <span>다운로드</span>
                                    </div>
                                    <div class="tbody" id="setting_list">

                                        <c:forEach var="examInfo" items="${item.examInfoList}">
                                            <div class="col">
                                                <span><input type="checkbox" id="chk_0" class="chk_paperId"><label for="chk_0"></label></span>
                                                <span class="tit">${examInfo.examName}</span>
                                                <span>${examInfo.itemCnt}</span>
                                                <span><button type="button" class="btn-icon2 preview-btn"><i class="preview"></i></button></span>
                                                <span>
                                                    <div class="btn-wrap">
                                                        <div class="tooltip-wrap type01">
                                                            <button type="button" class="btn-default download-btn" exam-id="${examInfo.examId}" data-type="A">전체</button>
                                                            <div class="tooltip type03">
                                                                <div class="tool-type01">문제+정답+해설</div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn-default download-btn" exam-id="${examInfo.examId}" data-type="Q">문제</button>
                                                        <button type="button" class="btn-default download-btn" exam-id="${examInfo.examId}" data-type="E">정답+해설</button>
                                                        <button type="button" class="btn-default download-btn" exam-id="${examInfo.examId}" data-type="C">문항정보표</button>
                                                    </div>
                                                </span>
                                                <input type="hidden" class="paperId" value="${examInfo.examId}">
                                                <input type="hidden" class="paperTitle" value="${examInfo.examName}">
                                                <input type="hidden" class="itemCnt" value="${examInfo.itemCnt}">
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
            <div class="loading-cnt" style="display:none">
                <img src="/resource/popup/img/loading_icon.gif" alt="로딩중">
                <div class="txt-box">
                    <span class="tit">LOADING<br>잠시만 기다려주세요.</span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="dim"></div>

<!-- 미리보기 팝업 -->
<div id="q-preview" class="pop-wrap prev-type " data-pop="prev-pop">
    <div class="pop-inner">
        <div class="pop-header">
            <div class="tit-top">
                <span id="preview_tit">[시험지명]</span>
                <em id="preview_cnt"></em>
                <input type="hidden" id="preview_paperId">
            </div>
            <button type="button" class="pop-close"></button>
        </div>
        <div class="pop-content">
            <div class="tab-wrap">
                <ul class="tab-menu-type02" id="preview-tab">
                    <li class="active">
                        <a href="javascript:" data-type="A">문제 + 정답 + 해설</a>
                    </li>
                    <li class="">
                        <a href="javascript:;" data-type="Q">문제</a>
                    </li>
                    <li class="">
                        <a href="javascript:;" data-type="E">정답+해설</a>
                    </li>
                    <li class="">
                        <a href="javascript:;" data-type="C">문항 정보표</a>
                    </li>
                </ul>

                <div id="preview-data">
                    <div class="btn-wrap" id="preview-btn-div">
                        <button type="button" class="btn-icon preview-download" data-type=""><i class="download"></i>다운로드</button>
                    </div>
                    <div class="view-box type-line">
                        <div class="scroll-inner">
                            <div class="layout-wrap" id="preview-question-data">
                            </div>
                            <div class="table-wrap" id="preview-itemInfo-table" style="display: none">
                                <div class="tbl-view">
                                    <table>
                                        <colgroup>
                                            <col width="5%">
                                            <col width="12%">
                                            <col width="15%">
                                            <col width="*">
                                            <col width="9.5%">
                                            <col width="9.5%">
                                            <col width="9.5%">
                                            <col width="9.5%">
                                            <col width="5%">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th rowspan="2">번호</th>
                                            <th rowspan="2">정답</th>
                                            <th colspan="2">단원</th>
                                            <th rowspan="2">성취기준</th>
                                            <th rowspan="2">내용 영역</th>
                                            <th rowspan="2">평가 영역</th>
                                            <th rowspan="2">교과 역량</th>
                                            <th rowspan="2">난이도</th>
                                        </tr>
                                        <tr>
                                            <th>대단원</th>
                                            <th>평가 내용</th>
                                        </tr>
                                        </thead>
                                        <tbody id="preview-itemInfo-data">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!--<div class="pop-footer">
            <div class="page-num">
                <span>1 / 2</span>
            </div>
        </div> -->
    </div>
</div>
<script>
    $(".download-btn").on('click',function (){
        let examName = $(".paperTitle").attr("value");
        let examId = $(this).attr("exam-id");
        let dataType = $(this).attr("data-type");

        const data = {
            "examId": examId,
            "dataType": dataType
        }

        // 시험지 id에 따른 itemlist 요청
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : '/exambank/customExamAPI/getSettingItemList', // 요청할 서버 url
            async : true,            // 비동기화 여부 (default : true)
            dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
            contentType: 'application/json',
            data :  JSON.stringify(data),
            success : function(result) { // 결과 성공 콜백함수
                console.log(result.itemList);
                renderImg(examName,result.itemList);

            },
            error : function(request, status, error) { // 결과 에러 콜백함수
                console.log(error)
            }
        });
        alert("test");

    });


    /* 미리보기 버튼 클릭시 */
    $(".preview-btn").on('click',function (){
        $(".dim").show();
        $("#q-preview").show();

    });
</script>

</body>
</html>
<%@ include file="makeExamPaper.jsp"%>