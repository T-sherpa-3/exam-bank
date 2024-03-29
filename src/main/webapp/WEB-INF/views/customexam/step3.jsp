<%-- Created by IntelliJ IDEA. User: 권진철 Date: 2024-03-08 Time: 오전 9:57 To change this template use File | Settings |
  File Templates. --%>
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
    <%-- <link rel="stylesheet" href="/resource/midhigh/assets/css/common.css">--%>
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
                <li style="display:none" id="custom-step0"><img src="../../images/common/ico_step_active.png" alt="">출제 방법
                    선택</li>
                <li class="" id="custom-step1">STEP 1 단원선택</li>
                <li id="custom-step2">STEP 2 문항 편집</li>
                <li id="custom-step3" class="active">STEP 3 시험지 저장</li>
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
        <div class="pop-content">
            <div class="view-box">
                <div class="view-top">
                    <div class="paper-info">
                        <span>${subjectName}</span>- ${curriculumName}
                    </div>

                    <input type="hidden" id="subjectId" name="subjectId" value="${subjectId}">

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
                                    <input type="text" id="name" placeholder="시험지명을 입력해주세요. (최대 20자)" class="search" maxlength="20"
                                           onkeydown="characterCheck(this)" onkeyup="characterCheck(this)">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="type-form">
                        <div class="left-wrap">
                            <span class="tit">난이도</span>
                            <div class="que-badge-group">

                                <div class="que-badge-group" id="difficultyBadges">

                                </div>

                            </div>
                        </div>
                        <div class="right-wrap">
                            <span class="tit">문제 형태</span>
                            <div class="que-badge-group2">

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

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="loading-cnt" style="display:none">
                <img src="/resource/popup/img/loading_icon.gif" alt="로딩중">
                <div class="txt-box">
                    <span class="tit">시험지 저장 중<br>잠시만 기다려주세요.</span>
                    <span class="txt">이 과정은 인터넷 연결상태와 선택한 범위에 따라 <br>수분이 걸릴 수 있습니다.<br><br><em>진행 과정 중에 창을 닫지
                    마십시오.</em></span>
                </div>
            </div>
        </div>
        <div class="step-btn-wrap">
            <button type="button" class="" id="step-prev-btn"></button>
            <button type="button" class="btn-step next done" id="complete-btn">시험지 저장하기</button>
        </div>
    </div>
</div>

<div class="dim"></div>
<!-- 폴더 추가 팝업 -->

<!-- e 230619 폴더 추가 팝업 삭제-->
<script type="text/javascript" src="../../js/common/common.js?version=20240308101026"></script>
<script>
    const regExp = /[\/?:|*+<>\;\"#%\\]/gi;

    $(function () {
        activeText(3);

        $("#complete-btn").on("click", function () {
            if ($("#name").val() === "") {
                alert("시험지명을 입력해주세요.");
                return false;
            } else if ($("#name").val().length > 20) {
                alert("시험지명을 20자 이하로 입력해주세요.");
                return false;
            }

            if (regExp.test($("#name").val()) == true) {
                alert("\'\\ / : * ? \" < > | + # % ; \' 문자는 입력하실 수 없습니다.");
                return false;
            }

            if (confirm('시험지를 저장하시겠습니까?')) {
                // dto로 넘어가는 필드
                let requestData = {
                    name: $("#name").val(), // 시험지명
                    itemIdList: ${ itemIdList }, // 문항 ID 리스트
                    subjectName: "${subjectName}"
                };
                console.log("저장 : ", requestData)
                $.ajax({
                    url: "/customExam/saveExamData",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(requestData),
                    success: function (data) {
                        if (data) {
                            alert("시험지가 성공적으로 저장되었습니다.");
                            window.location.href = '/customExam/complete';
                        } else {
                            alert("시험지 저장에 실패했습니다.");
                        }
                    },
                    beforeSend: function () {
                        $(".loading-cnt").css('display', 'block');
                    },
                    error: function (request, status, error) {
                        alert("시험지 저장 중 오류가 발생했습니다.");
                    },
                    complete: function () {
                        $(".loading-cnt").css('display', 'none');
                    }
                });
            }
        });

        //처음으로 버튼
        $("#reset-btn").on("click", function () {
            if (confirm('처음 화면으로 이동하시겠습니까?\n(출제 방법 선택 화면으로 이동)\n페이지 이동 시 변경사항이 저장되지 않습니다.')) {
                let newForm = $('<form></form>');

                newForm.attr("name", "new_form");
                newForm.attr("charset", "UTF-8");
                newForm.attr("method", "post");
                newForm.attr("action", "/exambank/customExam/step0");

                newForm.append($('<input/>', { type: 'hidden', name: 'subjectId', value: $('#subjectId').val() }));
                newForm.appendTo('body');
                newForm.submit();
            }
        });
    })

    // 특수문자 입력 방지
    function characterCheck(obj) {
        if (regExp.test(obj.value)) {
            alert("\'\\ / : * ? \" < > | + # % ; \' 문자는 입력하실 수 없습니다.");
            obj.value = obj.value.substring(0, obj.value.length - 1); // 입력한 특수문자 한자리 지움
        }
    }

</script>

<script>

    let requestData = {
        "itemIdList": ${ itemIdList },
        "subjectName": "${subjectName}"
    };
    console.log("controller response : ", requestData.itemIdList);
    $(document).ready(function () {
        $.ajax({
            url: '/customExam/rangeList', // 요청할 URL
            type: 'POST', // 요청 방식
            contentType: 'application/json', // 요청 데이터의 타입
            data: JSON.stringify(requestData), // 요청 데이터
            success: function (response) { // 요청이 성공했을 때 실행될 콜백 함수
                let responseHtml = ''; // HTML 문자열 변수 초기화

                // 응답 데이터가 배열 형태인지 확인 후 처리
                if (Array.isArray(response.itemList)) {
                    let difficultyCounts = {
                        '하': 0,
                        '중': 0,
                        '상': 0
                    };

                    response.itemList.forEach(function (item) { // 응답 데이터를 순회하며 HTML 문자열 생성
                        let difficultyName = item.difficultyName;
                        difficultyCounts[difficultyName]++;
                    });

                    // 각 난이도 별로 HTML 요소 생성
                    Object.keys(difficultyCounts).forEach(function (difficultyName) {
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
            error: function (xhr, status, error) { // 요청이 실패했을 때 실행될 콜백 함수
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
            success: function (response) { // 요청이 성공했을 때 실행될 콜백 함수
                let responseHtml = ''; // HTML 문자열 변수 초기화
                let index = 1; // 아이템 ID의 시작 값
                let objectiveCount = 0; // 객관식 개수 초기화
                let subjectiveCount = 0; // 주관식 개수 초기화

                // 응답 데이터가 배열 형태인지 확인 후 처리
                if (Array.isArray(response.itemList)) {
                    response.itemList.forEach(function (item) { // 응답 데이터를 순회하며 HTML 문자열 생성
                        let questionType = ''; // 질문 유형 초기화
                        // 질문 유형에 따라 처리
                        switch (item.questionFormName) {
                            case '5지 선택':
                            case '자유 선지형':
                                questionType = '객관식';
                                objectiveCount++; // 객관식 개수 증가
                                break;
                            case '단답 유순형':
                            case '단답 무순형':
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
                        responseHtml += '<span>' + questionType + '</span>';
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
            error: function (xhr, status, error) { // 요청이 실패했을 때 실행될 콜백 함수
                console.error('API 요청이 실패했습니다.');
            }
        });
    });
</script>
</body>

</html>