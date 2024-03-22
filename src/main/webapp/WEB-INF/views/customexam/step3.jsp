<%--
  Created by IntelliJ IDEA.
  User: 권진철
  Date: 2024-03-08
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<body>
<div id="wrap" class="full-pop-que">
    <div class="full-pop-wrap">


        <div class="pop-header">
            <ul class="title" id="custom-pop-header-title">
                <li style="display:none" id="custom-step0"><img src="../../images/common/ico_step_active.png" alt="">출제 방법 선택</li>
                <li class="" id="custom-step1">STEP 1 단원선택</li>
                <li id="custom-step2">STEP 2 문항 편집</li>
                <li id="custom-step3" class="active">STEP 3 시험지 저장</li>
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
                        <span>과학2(노태희)</span>- 2015개정 교육과정
                    </div>

                    <div class="btn-wrap">
                        <button class="btn-default" id="reset-btn"><a href="javascript:">처음으로</a></button>
                    </div>

                </div>
                <div class="view-bottom type02 scroll-inner">
                    <div class="top-form">
                        <div class="left-wrap">
                            <span>시험지명</span>
                            <div class="search-wrap">
                                <div class="search-box">
                                    <input type="text" id="paperTitle" placeholder="시험지명을 입력해주세요. (최대 20자)" class="search" maxlength="20" onkeydown="characterCheck(this)" onkeyup="characterCheck(this)">
                                </div>
                            </div>
                        </div>
                        <!--s 230619 저장위치 영역 삭제-->
                        <!-- <div class="right-wrap">
                            <span>저장 위치</span>
                            <div class="select-wrap">
                                <button type="button" class="select-btn">
                                    전체
                                </button>
                                <ul class="select-list">
                                    <li>
                                        <a href="javascript:;">전체</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">저장소1</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">저장소2</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn-wrap">
                                <button type="button" class="btn-default pop-btn" data-pop="add-folder-pop"><i
                                        class="add-type01"></i>폴더 추가</button>
                            </div>
                        </div> -->
                        <!--e 230619 저장위치 영역 삭제-->
                    </div>
                    <div class="type-form">
                        <div class="left-wrap">
                            <span class="tit">난이도</span>
                            <div class="que-badge-group">
<%--                                <div class="que-badge-wrap">--%>
<%--                                    <span class="que-badge purple">하</span>--%>
<%--                                    <span class="num">10</span>--%>
<%--                                </div>--%>
<%--                                <div class="que-badge-wrap">--%>
<%--                                    <span class="que-badge green">중</span>--%>
<%--                                    <span class="num">10</span>--%>
<%--                                </div>--%>
<%--                                <div class="que-badge-wrap">--%>
<%--                                    <span class="que-badge yellow">상</span>--%>
<%--                                    <span class="num">10</span>--%>
<%--                                </div>--%>

<%--                                <c:forEach var="item" items="${itemIdList}">--%>
                                    <div class="que-badge-group" id="difficultyBadges">
<%--                                        <input type="hidden" name="" value="${itemIdList.difficultyCode}">--%>
<%--                                        <span class="que-badge oceanblue">${itemIdList.difficultyName}</span>--%>
<%--                                        <span class="num"></span>--%>
                                    </div>
<%--                                </c:forEach>--%>
<%--                                <div class="que-badge-wrap" style="display: none">--%>
<%--                                    <span class="que-badge oceanblue">최하</span>--%>
<%--                                    <span class="num"></span>--%>
<%--                                </div>--%>
<%--                                <div class="que-badge-wrap" style="display: none">--%>
<%--                                    <span class="que-badge purple">하</span>--%>
<%--                                    <span class="num"></span>--%>
<%--                                </div>--%>
<%--                                <div class="que-badge-wrap" style="">--%>
<%--                                    <span class="que-badge green">중</span>--%>
<%--                                    <span class="num">15</span>--%>
<%--                                </div>--%>
<%--                                <div class="que-badge-wrap" style="">--%>
<%--                                    <span class="que-badge yellow">상</span>--%>
<%--                                    <span class="num">15</span>--%>
<%--                                </div>--%>
<%--                                <div class="que-badge-wrap" style="display: none">--%>
<%--                                    <span class="que-badge pink">최상</span>--%>
<%--                                    <span class="num"></span>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                        <div class="right-wrap">
                            <span class="tit">문제 형태</span>
                            <div class="que-badge-group2">
<%--                                <div class="que-badge-wrap2" style="">--%>
<%--                                    <span class="que-badge gray">객관식</span>--%>
<%--                                    <span class="num">25</span>--%>
<%--                                </div>--%>
<%--                                <div class="que-badge-wrap2" style="">--%>
<%--                                    <span class="que-badge gray">주관식</span>--%>
<%--                                    <span class="num">5</span>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>

                    <div class="tab-list-type01">
                        <div class="table">
                            <div class="fix-head">
                                <span>번호</span>
                                <span>문제 유형</span>
                                <span>문제 형태</span>
                                <span>난이도</span>
                            </div>
                            <div class="tbody">
                                <div class="scroll-inner" id="responseContainer">
<%--                                    <c:forEach var="item" items="${itemIdList}">--%>
<%--                                        <div class="col">--%>
<%--                                            <span>${item.itemId}</span>--%>
<%--                                            <span class="tit">${item.largeChapterName} &gt; ${item.mediumChapterName} &gt; ${item.smallChapterName}</span>--%>
<%--                                            <span>${item.questionFormName}</span>--%>
<%--                                            <span>${item.difficultyName}</span>--%>
<%--                                        </div>--%>
<%--                                    </c:forEach>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="loading-cnt" style="display:none">
                <img src="../../images/common/loading_icon.gif" alt="로딩중">
                <div class="txt-box">
                    <span class="tit">시험지 저장 중<br>잠시만 기다려주세요.</span>
                    <span class="txt">이 과정은 인터넷 연결상태와 선택한 범위에 따라 <br>수분이 걸릴 수 있습니다.<br><br><em>진행 과정 중에 창을 닫지 마십시오.</em></span>
                </div>
            </div>
        </div>
        <div class="step-btn-wrap">
            <button type="button" class="btn-step" id="step-prev-btn">STEP 2 문항 편집</button>
            <button type="button" class="btn-step next done" id="complete-btn">시험지 저장하기</button>
        </div>
    </div>
</div>

<div class="dim"></div>
<!-- 폴더 추가 팝업 -->
<!-- s 230619 폴더 추가 팝업 삭제-->
<!-- <div class="pop-wrap input-type" data-pop="add-folder-pop">
    <div class="pop-inner">
        <div class="pop-header">
            <span>폴더 추가</span>
            <button type="button" class="pop-close"></button>
        </div>
        <div class="pop-content">
            <span class="tit">폴더명 입력</span>
            <div class="input-box">
                <input type="text" placeholder="폴더명을 입력해주세요.(최대 10글자)">
            </div>
        </div>
        <div class="pop-footer">
            <button type="button">추가하기</button>
        </div>
    </div>
</div> -->
<!-- e 230619 폴더 추가 팝업 삭제-->
<script type="text/javascript" src="../../js/common/common.js?version=20240308101026"></script>
<script>
    const regExp = /[\/?:|*+<>\;\"#%\\]/gi;

    $(function () {
        activeText(3);

        //이전 버튼(STEP2로 이동)
        $("#step-prev-btn").on("click", function () {
            let _form = $('<form></form>');

            _form.attr("name", "new_form");
            _form.attr("charset", "UTF-8");
            _form.attr("method", "post");
            _form.attr("action", '/customExam/step2');

            _form.append($('<input/>', {type: 'hidden', name: 'queArr', value: '1664792,1506466,1664793,1506463,1664798,1664808,1664799,1665537,1665552,1506450,1665539,1665541,1664830,1506453,1665544,1665543,1506454,1664825,1665547,1665546,1665548,1506438,1506589,1506588,1506591,1664899,1664915,1664918,1506604,1506561'}));
            _form.append($('<input/>', {type: 'hidden', name: 'backYn', value: "Y"}));
            _form.append($('<input/>', {type: 'hidden', name: 'paperId', value: ''}));
            _form.append($('<input/>', {type: 'hidden', name: 'paperTitle', value: ''}));
            _form.append($('<input/>', {type: 'hidden', name: 'paperGubun', value: 'new'}));
            _form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: '1175'}));

            _form.appendTo('body');
            _form.submit();
        });

        $("#complete-btn").on("click", function (){
            if($("#paperTitle").val() === ""){
                alert("시험지명을 입력해주세요.");
                return false;

            }else if($("#paperTitle").val().length>20){
                alert("시험지명을 20자 이하로 입력해주세요.");
                return false;
            }

            if(regExp.test($("#paperTitle").val())  == true){
                alert("\'\\ / : * ? \" < > | + # % ; \' 문자는 입력하실 수 없습니다.");
                return false;
            }

            if (confirm ('시험지를 저장하시겠습니까?')) {
                // dto로 넘어가는 필드
                let requestData = {
                    paperTitle: $("#paperTitle").val(), // 시험지명
                    itemIdList: ${itemIdList}, // 문항 ID 리스트
                    subjectName: ${subjectName}
                };

                $.ajax({
                    url: "/customExam/saveExamData",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(requestData),
                    success: function(data) {
                        if(data && data.success) {
                            alert("시험지가 성공적으로 저장되었습니다.");
                        } else {
                            alert("시험지 저장에 실패했습니다.");
                        }
                    },
                    beforeSend: function() {
                        $(".loading-cnt").css('display', 'block');
                    },
                    error: function(request, status, error) {
                        alert("시험지 저장 중 오류가 발생했습니다.");
                    },
                    complete: function() {
                        $(".loading-cnt").css('display', 'none');
                    }
                });
            }
        });

        //처음으로 버튼
        $("#reset-btn").on("click", function (){
            if (confirm ('처음 화면으로 이동하시겠습니까?\n(출제 방법 선택 화면으로 이동)\n페이지 이동 시 변경사항이 저장되지 않습니다.')) {
                let newForm = $('<form></form>');

                newForm.attr("name", "new_form");
                newForm.attr("charset", "UTF-8");
                newForm.attr("method", "post");
                newForm.attr("action", "/customExam/step0");

                newForm.append($('<input/>', {type: 'hidden', name: 'subjectId', value: '1175'}));

                newForm.appendTo('body');
                newForm.submit();
            }
        });
    })

    // 특수문자 입력 방지
    function characterCheck(obj){
        if( regExp.test(obj.value) ){
            alert("\'\\ / : * ? \" < > | + # % ; \' 문자는 입력하실 수 없습니다.");
            obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
        }
    }

</script>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        // 서버에서 전달된 qParam 데이터--%>
<%--        let qParam ={};--%>

<%--        // 재검색--%>
<%--        function rescan(){--%>
<%--            qParam = {};--%>
<%--            const chapterList = '${itemDTOList}';--%>
<%--            console.log("chapterList : "+chapterList);--%>
<%--            const activityCategoryList = '415,416,417,418'.split(',');--%>
<%--            const levelCnt = '0,10,10,10,0'.split(',');--%>
<%--            const questionForm =  'multiple,subjective,descriptive';--%>

<%--            let plusTempLevelArray = [];--%>
<%--            for (let i = 0; i < levelCnt.length; i++) {--%>
<%--                let cnt = Number(levelCnt[i]);--%>
<%--                let pVal = cnt === 0? 0: cnt+20;--%>
<%--                plusTempLevelArray.push(pVal);--%>
<%--            }--%>

<%--            qParam.chapterList = chapterList;--%>
<%--            qParam.activityCategoryList = activityCategoryList;--%>
<%--            qParam.levelCnt = levelCnt;--%>
<%--            qParam.tmpLevelCnt = plusTempLevelArray;--%>
<%--            qParam.questionForm = questionForm;--%>

<%--            ajaxCall("POST", "/customexam/step3", qParam, function (data) {--%>

<%--                if (data != null) {--%>
<%--                    for(let j=1; j<=5; j++){--%>
<%--                        if (data.levelGroup['0'+j] !== undefined) {--%>
<%--                            $(".pop-wrap[data-pop='que-pop'] #pop-level"+j).show();--%>
<%--                            $(".pop-wrap[data-pop='que-pop'] #pop-level"+j).find(".num").text(data.levelGroup['0'+j]);--%>
<%--                        }--%>
<%--                    }--%>

<%--                    $(".pop-wrap[data-pop='que-pop'] #pop-total-sum .num").text(data.itemsTotalCnt);--%>
<%--                    $(".pop-wrap[data-pop='que-pop'] #nxt-data").val(data.queIdList);--%>

<%--                    showPop("que-pop");--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>

<%--        //재구성된 문항으로 가져오기--%>
<%--        function moveToStep3() {--%>
<%--            let queArrParam = $(".pop-wrap #nxt-data").val();--%>
<%--            let new_form = $('<form></form>');--%>

<%--            new_form.attr("name", "new_form");--%>
<%--            new_form.attr("charset", "UTF-8");--%>
<%--            new_form.attr("method", "post");--%>
<%--            new_form.attr("action", "/customExam/step2");--%>

<%--            new_form.append($('<input/>', {type: 'hidden', name: 'chapterList', value:  qParam.chapterList}));--%>
<%--            new_form.append($('<input/>', {type: 'hidden', name: 'activityCategoryList', value: qParam.activityCategoryList}));--%>
<%--            new_form.append($('<input/>', {type: 'hidden', name: 'levelCnt', value: qParam.levelCnt}));--%>
<%--            new_form.append($('<input/>', {type: 'hidden', name: 'questionForm', value: qParam.questionForm}));--%>
<%--            new_form.append($('<input/>', {type: 'hidden', name: 'queArr', value: queArrParam}));--%>
<%--            new_form.append($('<input/>', {type: 'hidden', name: 'paperGubun', value: 'new'}));--%>
<%--            new_form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: $("#subjectId").val()}));--%>

<%--            new_form.appendTo('body');--%>
<%--            new_form.submit();--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<script>

            let requestData = {
                "itemIdList": ${itemIdList}
                //"itemIdList": [1664792,1506466,1664793,1506463,1664798,1664808,1664799,1665537,1665552,1506450,1665539,1665541,1664830,1506453,1665544,1665543,1506454,1664825,1665547,1665546,1665548,1506438,1506589,1506588,1506591,1664899,1664915,1664918,1506604,1506561]
        };

            $(document).ready(function () {
            $.ajax({
                url: '/customExam/rangeList', // 요청할 URL
                type: 'POST', // 요청 방식
            contentType: 'application/json', // 요청 데이터의 타입
            data: JSON.stringify(requestData), // 요청 데이터
            success: function(response) { // 요청이 성공했을 때 실행될 콜백 함수
                let responseHtml = ''; // HTML 문자열 변수 초기화

                // 응답 데이터가 배열 형태인지 확인 후 처리
                if (Array.isArray(response.itemList)) {
                    let difficultyCounts = {
                        '하': 0,
                        '중': 0,
                        '상': 0
                    };

                    response.itemList.forEach(function(item) { // 응답 데이터를 순회하며 HTML 문자열 생성
                        let difficultyName = item.difficultyName;
                        difficultyCounts[difficultyName]++;
                    });

                    // 각 난이도 별로 HTML 요소 생성
                    Object.keys(difficultyCounts).forEach(function(difficultyName) {
                        var count = difficultyCounts[difficultyName];
                        responseHtml += '<div class="que-badge-wrap">';
                        responseHtml += '<span class="que-badge ' + getBadgeColor(difficultyName) + '">' + difficultyName + '</span>';
                        responseHtml += '<span class="num">' + count + '</span>';
                        responseHtml += '</div>';
                    });
                } else {
                    // 응답 데이터가 배열 형태가 아닌 경우, 적절한 처리를 수행하도록 수정
                    console.error('서버 응답 형식이 올바르지 않습니다.');
                }

                // 생성된 HTML을 원하는 위치에 추가
                $('#difficultyBadges').html(responseHtml);
            },
            error: function(xhr, status, error) { // 요청이 실패했을 때 실행될 콜백 함수
                console.error('API 요청이 실패했습니다.');
            }
        });
    });

    // 난이도 별로 적절한 색상 클래스를 반환하는 함수
    function getBadgeColor(difficultyName) {
        switch (difficultyName) {
            case '하':
                return 'purple';
            case '중':
                return 'green';
            case '상':
                return 'yellow';
            default:
                return 'oceanblue';
        }
    }

            $(document).ready(function () {
                $.ajax({
                    url: '/customExam/rangeList', // 요청할 URL
                    type: 'POST', // 요청 방식
                    contentType: 'application/json', // 요청 데이터의 타입
                    data: JSON.stringify(requestData), // 요청 데이터
                    success: function(response) { // 요청이 성공했을 때 실행될 콜백 함수
                        let responseHtml = ''; // HTML 문자열 변수 초기화
                        let index = 1; // 아이템 ID의 시작 값
                        let objectiveCount = 0; // 객관식 개수 초기화
                        let subjectiveCount = 0; // 주관식 개수 초기화

                        // 응답 데이터가 배열 형태인지 확인 후 처리
                        if (Array.isArray(response.itemList)) {
                            response.itemList.forEach(function(item) { // 응답 데이터를 순회하며 HTML 문자열 생성
                                let questionType = ''; // 질문 유형 초기화
                                // 질문 유형에 따라 처리
                                switch(item.questionFormName) {
                                    case '5지 선택':
                                    case '자유 선지형':
                                        questionType = '객관식';
                                        objectiveCount++; // 객관식 개수 증가
                                        break;
                                    case '단답 유순형':
                                    case '서술형':
                                        questionType = '주관식';
                                        subjectiveCount++; // 주관식 개수 증가
                                        break;
                                    default:
                                        questionType = ''; // 기타 유형에 대해서는 처리하지 않음
                                        break;
                                }
                                responseHtml += '<div class="col">';
                                responseHtml += '<span>' + index + '</span>'; // 아이템 ID 출력
                                responseHtml += '<span class="tit">' + item.largeChapterName + ' &gt; ' + item.mediumChapterName + ' &gt; ' + item.smallChapterName + '</span>';
                                responseHtml += '<span>' + questionType + '</span>'; // 질문 유형 추가
                                responseHtml += '<span>' + item.difficultyName + '</span>';
                                responseHtml += '</div>';
                                index++; // 아이템 ID 증가
                            });
                        } else {
                            // 응답 데이터가 배열 형태가 아닌 경우, 적절한 처리를 수행하도록 수정
                            console.error('서버 응답 형식이 올바르지 않습니다.');
                        }

                        // 객관식과 주관식 개수를 포함하는 HTML을 생성
                        let objectiveHtml = '<div class="que-badge-wrap"><span class="que-badge gray">객관식</span><span class="num">' + objectiveCount + '</span></div>';
                        let subjectiveHtml = '<div class="que-badge-wrap"><span class="que-badge gray">주관식</span><span class="num">' + subjectiveCount + '</span></div>';

                        // 생성된 HTML을 원하는 위치에 추가
                        $('.que-badge-group2').html(objectiveHtml + subjectiveHtml);
                        $('#responseContainer').html(responseHtml); // 생성된 HTML을 #responseContainer 요소에 추가
                    },
                    error: function(xhr, status, error) { // 요청이 실패했을 때 실행될 콜백 함수
                        console.error('API 요청이 실패했습니다.');
                    }
                });
            });
</script>
<script>
    let qParam ={};

    $(document).ready(function () {
        let new_form = $('#new_form');

        // 폼 데이터 추가
        new_form.append($('<input/>', {type: 'hidden', name: 'chapterList', value: qParam.chapterList}));
        new_form.append($('<input/>', {type: 'hidden', name: 'activityCategoryList', value: qParam.activityCategoryList}));
        new_form.append($('<input/>', {type: 'hidden', name: 'levelCnt', value: qParam.levelCnt}));
        new_form.append($('<input/>', {type: 'hidden', name: 'questionForm', value: qParam.questionForm}));
        new_form.append($('<input/>', {type: 'hidden', name: 'queArr', value: qParam.queArr}));
        new_form.append($('<input/>', {type: 'hidden', name: 'paperGubun', value: 'new'}));
        new_form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: $("#subjectId").val()}));
    });
</script>
</body>
</html>
