<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js" integrity="sha512-Z8CqofpIcnJN80feS2uccz+pXWgZzeKxDsDNMD/dJ6997/LSRY+W4NmEt9acwR+Gt9OHN0kkI1CTianCwoqcjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js" integrity="sha512-qZvrmS2ekKPF2mSznTQsxqPgnpkI4DNTlrdUmTzrDgektczlKNRRhy5X5AAOnx5S09ydFYWWNSfcEqDTTHgtNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<html>
<head>
    <title>Title</title>
    <style>
        .test_paper{
            width: 595px; /* 전체 너비를 사용하도록 설정 */
            height: 842px;
        }
        .header{
            width: 595px;
            height: 70px;
            background: #cccccc;
        }

        .column {
            width: 595px; /* 전체 너비를 사용하도록 설정 */
            height: 772px;
            column-count: 2;
            column-rule-color: lightgrey;
            column-rule-style: solid;
            column-rule-width: thin;
            /*column-width: auto; !* 열의 너비를 자동으로 조절 *!*/
            /* overflow: auto;*/
            border: 0.2px solid black;
        }
        .column {
            text-align: center; /* 각 단의 내용을 가운데 정렬 */
            height: 100%;
        }
        .column img {
            width: 100%; /* 이미지가 열의 너비에 맞게 조절되도록 설정 */
            height: auto; /* 이미지의 가로세로 비율을 유지하면서 자동으로 조절 */
        }
        figure {
            margin: 0;
            margin-bottom: 100px;
        }
    </style>
</head>
<body>
<button type="button" onclick="pdfPrint();">PDF 다운</button>

<script type="text/javascript">

    function pdfPrint(){

        // 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
        html2canvas(document.querySelector('.test_paper'), {
            allowTaint: true, // cross-origin allow
            useCORS: true,    // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
            scale: 2,         // 기본 96dpi에서 해상도를 두 배로 증가
            // y: startPosition, // 캡쳐를 시작할 위치
            // height: setHeight // 캡쳐할 canvas의 높이
        }).then(function(canvas) {

            // 캔버스를 이미지로 변환
            var imgData = canvas.toDataURL('image/png');

            var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
            var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
            var imgHeight = canvas.height * imgWidth / canvas.width;
            var heightLeft = imgHeight;

            var doc = new jspdf.jsPDF('p', 'mm');
            var position = 0;

            // 첫 페이지 출력
            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
            heightLeft -= pageHeight;

            // 한 페이지 이상일 경우 루프 돌면서 출력
            while (heightLeft >= 20) {
                position = heightLeft - imgHeight;
                doc.addPage();
                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;
            }

            // 파일 저장
            doc.save('sample.pdf');


            //이미지로 표현
            document.write('<img src="'+imgData+'" />');


        });

    }
</script>
<div class="test_paper">
    <div class="header">header</div>
    <div class="column">
        <figure>
            <span class="item_no">01</span> <span class="item_no">01</span>
            <%--            <img src="966536_2024-02-08.svg">--%>
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </figure>

        <figure>

            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </figure>

        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">

        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        <div class="column">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">

            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </div>
        <%--    <p> <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">--%>
        <%--        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">--%>
        <%--        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">--%>
        <%--        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg"> </p>--%>
        <%--    <p> <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">--%>
        <%--        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">--%>
        <%--        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">--%>
        <%--        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg"> </p>--%>
    </div>
</div>
</body>
</html>