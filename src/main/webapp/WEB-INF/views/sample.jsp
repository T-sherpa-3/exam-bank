<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Test Code -->
<h1>Sample Test : board_table</h1>


<!-- 권진철 - 주석 아래로 작성 -->



<!-- 김지원 - 주석 아래로 작성 -->
<script src="/resource/popup/js/jquery-1.12.4.min.js"></script>
<script src="/resource/popup/js/jquery-3.6.0.min.js"></script>
<script>
   function customExamPopup(subjectId) {
       //새창으로 열기
       let pop_title = "win_pop";
       let url = 'customExam/step0';

       window.open("",pop_title,'width=1400,height=1024,status=no,toolbar=no,scrollbars=no, left=500, top=0');

       //form
        let new_form = $('<form></form>');
        new_form.attr("name", "new_form");
        new_form.attr("charset", "UTF-8");
        new_form.attr("method", "post");
        new_form.attr("action", url);
        new_form.attr("target", pop_title);

        //step0 세팅지 리스트를 위한 교재정보 - 문항통합에서 교재정보 컬럼명 = subjectId
        new_form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: subjectId}));

        console.log(new_form);

        new_form.appendTo('body');
        new_form.submit();
    }
    function customExamPopup1(subjectId) {
        let url = 'http://localhost:8080/customTest/step1';
        window.open(url, '_blank', 'width=1400, height=1024, status=no, toolbar=no, scrollbars=no, left=500, top=0');
    }
    function customExamPopup2(subjectId) {
        let url = 'http://localhost:8080/customTest/step2';
        window.open(url, '_blank', 'width=1400, height=1024, status=no, toolbar=no, scrollbars=no, left=500, top=0');
    }
    function customExamPopup3(subjectId) {
        let url = 'http://localhost:8080/customTest/step3';
        window.open(url, '_blank', 'width=1400, height=1024, status=no, toolbar=no, scrollbars=no, left=500, top=0');
    }

</script>
<div class="data_buttons">
    <a href="javascript:;" onclick="customExamPopup('1159');" title="새창 열림" class="button">
        <i class="icon icon-memo-center"></i>시험지 만들기 step0
    </a><br/>
    <a href="javascript:;" onclick="customExamPopup1('1159');" title="새창 열림" class="button">
        <i class="icon icon-memo-center"></i>시험지 만들기 step1
    </a><br/>
    <a href="javascript:;" onclick="customExamPopup2('1159');" title="새창 열림" class="button">
        <i class="icon icon-memo-center"></i>시험지 만들기 step2
    </a><br/>
    <a href="javascript:;" onclick="customExamPopup3('1159');" title="새창 열림" class="button">
        <i class="icon icon-memo-center"></i>시험지 만들기 step3
    </a><br/>
    <a href="javascript:getExam('611505');" title="다운로드" class="button">
        <i class="icon icon-download"></i> 평가자료 다운
    </a>

    <h3>Hello itext pdf</h3>
    <p>Click <a href="/attachment/pdf">here</a> to download the pdf</p>

    <br><a href="/customExam/pdftest">pdf다운로드 테스트</a><br>
</div>


<!-- 이양진 - 주석 아래로 작성 -->
<div class="data_buttons">
    <a href="http://localhost:8080/exambank/exambank" title="교과서 목록" class="button">
        교과서 목록
    </a>
    <a href="http://localhost:8080/exambank/ExamBank-Storage" title="교과서 목록" class="button">
        시험지 보관함
    </a>

</div>


<!-- 이지연 - 주석 아래로 작성 -->



<!-- 이창규 - 주석 아래로 작성 -->



</body>
</html>
