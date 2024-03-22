<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js" integrity="sha512-Z8CqofpIcnJN80feS2uccz+pXWgZzeKxDsDNMD/dJ6997/LSRY+W4NmEt9acwR+Gt9OHN0kkI1CTianCwoqcjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js" integrity="sha512-qZvrmS2ekKPF2mSznTQsxqPgnpkI4DNTlrdUmTzrDgektczlKNRRhy5X5AAOnx5S09ydFYWWNSfcEqDTTHgtNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resource/popup/css/font.css">
    <style>
        .test_paper{
            width: 595px; /* 전체 너비를 사용하도록 설정 */
        }
        header{
            width: 595px;
            height: 60px;
            margin-bottom: 10px;
        }
        .title_header{
            font-size: 16px;
            font-weight: bold;
            line-height: 46px;
            text-align: center;
            border-right: 2px solid #ccc;
        }
        .class_header{
            font-size: 13px;
            text-align: right;
            height: 23px;
            line-height: 23px;
        }
        .name_header{
            font-size: 13px;
            height: 23px;
            line-height: 23px;
        }
        .column {
            width: 593px; /* 전체 너비를 사용하도록 설정 */
            height: 820px;
            column-count: 2;
            column-rule-color: lightgrey;
            column-rule-style: solid;
            column-rule-width: thin;
            /*column-width: auto; !* 열의 너비를 자동으로 조절 *!*/
            /* overflow: auto;*/
            border-bottom: 0.2px solid black;
            margin-bottom: 100px;
        }
        .column-first {
            width: 595px; /* 전체 너비를 사용하도록 설정 */
            height: 772px;
            column-count: 2;
            column-rule-color: lightgrey;
            column-rule-style: solid;
            column-rule-width: thin;
            /*column-width: auto; !* 열의 너비를 자동으로 조절 *!*/
            /* overflow: auto;*/
            border-bottom: 0.2px solid black;
            margin-bottom: 100px;
        }
        .column img {
            width: 100%; /* 이미지가 열의 너비에 맞게 조절되도록 설정 */
            height: auto; /* 이미지의 가로세로 비율을 유지하면서 자동으로 조절 */
        }
        figure {
            margin: 0;
            margin-bottom: 100px;
        }
        .item_no{
            color: #007fff;
            font-weight: bold;
            float: left;
        }
        .item_answer:after{
            float: left;
            height: 12px;
            background: palevioletred;
            width: 30px;
            font-size: 10px;
            line-height: 12px;
            font-weight: bold;
            color: #fff;
            content: "정답";
        }
        .item_explain:after{
            float: left;
            height: 12px;
            background: rgba(80, 141, 253, 0.68);
            width: 30px;
            font-size: 10px;
            line-height: 12px;
            font-weight: bold;
            color: #fff;
            content: "해설";
        }
        .page-break-after {
            page-break-after: always;
            page-break-inside: avoid;
            clear:both;
        }
    </style>
</head>
<body>
<button type="button" onclick="renderImg();">PDF 다운</button>

<script type="text/javascript">
    const target = document.querySelector('.test_paper'); // pdf로 출력할 요소
    const IMG_WIDTH = 198; // 좌우 여백을 제외한 캡쳐할 이미지 넓이 / A4 기준 210mm
    const PAGE_HEIGHT = 307; // 캡쳐할 페이지 높이
    const PAGE_LIMIT_HEIGHT = PAGE_HEIGHT * 100; // 페이지를 끊을 기준이 되는 최대 높이


    // PDF로 저장하는 함수
    function savePDF(objArr){
        // jspdf 설정
        let doc = new jspdf.jsPDF({
            'orientation': 'p',
            'unit': 'mm',
            'format': 'a4'
        });

        // 가져올 이미지 데이터 배열을 돌면서 위에서 생성한 jsPDF객체에 추가
        objArr.forEach(obj =>{
            let imgData = obj.url;
            let imgHeight = obj.cHeight * IMG_WIDTH / obj.cWidth;
            let heightLeft = imgHeight;
            let position = 5;

            doc.addImage(imgData,'svg',5,position,IMG_WIDTH,imgHeight);
            heightLeft -= PAGE_HEIGHT;

            while (heightLeft >= 0){
                position = heightLeft - imgHeight;
                doc.addPage();
                doc.addImage(imgData,'svg',5,position,IMG_WIDTH,imgHeight);
                heightLeft -= PAGE_HEIGHT;
            }
        });
        doc.save('savePDF.pdf');
    }

    function renderImg(examName,itemList){
        $(".title_header").text(examName);

        let startPosition = 0; // 캡쳐를 시작할 위치
        let leftHeight = 0; // 캡쳐해야할 남은 높이
        let setHeight = 0; // 캡쳐할 canvas 높이

        html2canvas(document.querySelector('.test_paper'), {
            // allowTaint: true, // cross-origin allow
            // useCORS: true,    // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
            // scale: 2         // 기본 96dpi에서 해상도를 두 배로 증가
        }).then(function(total_canvas) {
            console.log('total_canvas',total_canvas);

            // 출력하려는 요소의 총 높이
            const TOTAL_HEIGHT = total_canvas.height;

            let result = []; // canvas의 이미지 데이터를 담아서 넘겨주기 위한 배열

            // 요소의 높이가 29700이 넘으면 분할해서 캡쳐
            leftHeight = TOTAL_HEIGHT;
            setHeight = TOTAL_HEIGHT <= PAGE_LIMIT_HEIGHT ? TOTAL_HEIGHT : PAGE_LIMIT_HEIGHT;
            console.log("TOTAL_HEIGHT",TOTAL_HEIGHT);

            // 내부함수를 재귀함수로 사용하여 분할 캡쳐를 한다면, 반복하여 동작
            function addDataUrl(){
                html2canvas(document.querySelector('.test_paper'), {
                    allowTaint: true, // cross-origin allow
                    useCORS: true,    // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
                    scale: 3,         // 기본 96dpi에서 해상도를 두 배로 증가
                    y: startPosition, // 캡쳐를 시작할 위치
                    height: setHeight // 캡쳐할 canvas의 높이
                }).then(function(canvas) {
                    let obj = {};
                    obj.url = canvas.toDataURL("image/jpeg");
                    obj.cWidth = canvas.width;
                    obj.cHeight = canvas.height;
                    result.push(obj); // 가져온 객체를 배열에 담기
                    leftHeight -= PAGE_LIMIT_HEIGHT; // 캡쳐해야할 남은 높이에서 방금 남은 높이빼기
                    if(leftHeight > 0){ // 아직 캡쳐해야할 높이가 남았다면
                        startPosition += PAGE_LIMIT_HEIGHT; // 시작점 조정
                        // 마지막 페이지라면 캡쳐할 canvas 높이를 남은 높이에 맞춰서 설정
                        setHeight = leftHeight <= PAGE_LIMIT_HEIGHT ? leftHeight : PAGE_LIMIT_HEIGHT;
                        addDataUrl();
                    } else {
                        savePDF(result);
                    }

                });
            }
            addDataUrl();
        });
    }
</script>

<div class="test_paper">
    <header>
        <table style="width:100%; border: 3px solid #ccc; border-radius: 10px;">
            <tr>
                <td rowspan="2" class="title_header">중_국어 1-1(노)_1-1_단원평가_1회_T셀파</td>
                <td class="class_header">&nbsp;&nbsp;학년&nbsp;&nbsp;반&nbsp;&nbsp;번&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="name_header">&nbsp;이름 : </td>
            </tr>
        </table>
    </header>

    <div class="column column-first">
        <figure>
            <span class="item_no">01</span>
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
            <div class="item_answer"></div>
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <div class="item_explain"></div>
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </figure>

        <figure>
            <span class="item_no">01</span>
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </figure>

        <figure>
            <span class="item_no">01</span>
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
        <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </figure>
    </div>

<%--    <h1 class="page-break-after"></h1>--%>

    <div class="column">

        <figure>
            <span class="item_no">01</span>
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </figure>



        <figure>
            <span class="item_no">01</span>
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </figure>
    </div>

<%--    <h1 class="page-break-after"></h1>--%>

    <div class="column">
        <figure>
            <span class="item_no">01</span>
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </figure>
        <figure>
            <span class="item_no">01</span>
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/passage/25279/25279_2023-12-19.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/question/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/answer/521684/521684_2023-10-13.svg">
            <img src="https://img.chunjae-platform.com/upload/capture/tsherpa/explain/521684/521684_2023-10-13.svg">
        </figure>
    </div>

</div>
</body>
</html>