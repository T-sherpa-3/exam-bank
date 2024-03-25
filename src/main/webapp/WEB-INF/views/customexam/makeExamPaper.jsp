<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js" integrity="sha512-Z8CqofpIcnJN80feS2uccz+pXWgZzeKxDsDNMD/dJ6997/LSRY+W4NmEt9acwR+Gt9OHN0kkI1CTianCwoqcjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js" integrity="sha512-qZvrmS2ekKPF2mSznTQsxqPgnpkI4DNTlrdUmTzrDgektczlKNRRhy5X5AAOnx5S09ydFYWWNSfcEqDTTHgtNA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%--<script src="/resource/popup/js/jquery-1.12.4.min.js"></script>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <link rel="stylesheet" href="/resource/popup/css/font.css">--%>
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
            width: 76%;
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
        .item_figure {
            margin: 0;
            margin-bottom: 100px;
        }
        .item_figure img {
            display: block;
        }
        .item_no{
            color: #007fff;
            font-weight: bold;
            float: left;
        }
        .item_answer:after{
            float: left;
            height: 15px;
            background: palevioletred;
            width: 30px;
            font-size: 10px;
            line-height: 15px;
            font-weight: bold;
            color: #fff;
            text-align: center;
            content: "정답";
        }
        .item_explain:after{
            float: left;
            height: 15px;
            background: rgba(80, 141, 253, 0.68);
            width: 30px;
            font-size: 10px;
            line-height: 15px;
            font-weight: bold;
            color: #fff;
            text-align: center;
            content: "해설";
        }
    </style>
<%--<button type="button" onclick="renderImg();">PDF 다운</button>--%>

<script type="text/javascript">
    const target = document.querySelector('.test_paper'); // pdf로 출력할 요소
    const IMG_WIDTH = 198; // 좌우 여백을 제외한 캡쳐할 이미지 넓이 / A4 기준 210mm
    const PAGE_HEIGHT = 307; // 캡쳐할 페이지 높이
    const PAGE_LIMIT_HEIGHT = PAGE_HEIGHT * 100; // 페이지를 끊을 기준이 되는 최대 높이


    // PDF로 저장하는 함수
    function savePDF(objArr, examName){
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
        doc.save(examName+'.pdf');
    }

    function sleep(ms) {
        return new Promise((r) => setTimeout(r, ms));
    }

    function renderImg(examName, itemList,type){
        // -------------------------------------------------- 시험지 배치 코드 시작
        console.log("examName",examName);
        $(".title_header").text(examName);
        // console.log("itemList.length",itemList.length);

        const contents = $("#contents");
        let itemHtml = '';

        let passageList = {};
        let duplicatePassageList = {};

        itemList.forEach(item => {
            itemHtml += '<div class="item_figure" item-no="'+item.itemNo+'">';

            if(type=='A'||type=='Q') {
                // 지문이 있는 문항의 경우
                if (item.passageId != null) {
                    if (!passageList[item.passageId]) { // 해당 지문의 첫번째 문제인 경우, 문제번호 만들고 img 보이기
                        passageList[item.passageId] = [];
                        passageList[item.passageId].push(item.itemNo);
                        itemHtml += '<span class="item_no" passage-id="' + item.passageId + '_' + item.itemNo + '">[' + item.itemNo + '-</span><br>';
                        itemHtml += '<img src="' + item.passageUrl + '" style="margin-bottom: 10px">';
                    } else { // 해당 지문의 첫번째 문제가 아닌 경우, 마지막 문제번호 추가하기
                        let currentPassageId = passageList[item.passageId];
                        // if (currentPassageId[currentPassageId.length - 1] + 1 != item.itemNo) { // 연속된 문제가 아니라면 지문 출력
                        //     let lastItemNo = currentPassageId[currentPassageId.length - 1]; // 같은 지문의 이전 마지막 문제 번호
                        //     duplicatePassageList[item.passageId + '_' + currentPassageId[0]] = currentPassageId;
                        //
                        //     // 새로 덮어쓰기
                        //     passageList[item.passageId] = [];
                        //     passageList[item.passageId].push(item.itemNo);
                        //     itemHtml += '<span class="item_no" passage-id="' + item.passageId + '_' + item.itemNo + '">[' + item.itemNo + '-</span><br>';
                        //     itemHtml += '<img src="' + item.passageUrl + '" style="margin-bottom: 10px">';
                        // } else {
                        passageList[item.passageId].push(item.itemNo);
                        //}
                    }
                }
            }

            itemHtml += '<span class="item_no">'+item.itemNo+'</span><br>';
            if(type=='A'||type=='Q') {
                itemHtml += '<img src="' + item.questionUrl + '">';
            }
            if(type=='A'||type=='E') {
                itemHtml += '<div class="item_answer"></div>';
                itemHtml += '<img src="' + item.answerUrl + '">';
                itemHtml += '<div class="item_explain"></div>';
                itemHtml += '<img src="' + item.explainUrl + '">';
            }
            itemHtml += '</div>';

        });

        itemHtml += '</div>';
        contents.html(itemHtml);


        for (const key of Object.keys(passageList)){
            // console.log("ff",key);
            // console.log($("span[passage-id="+key+"_"+passageList[key][0]+"]").text());
            // console.log(passageList[key].length);
            let originRange = $("span[passage-id="+key+"_"+passageList[key][0]+"]").text();
            $("span[passage-id="+key+"_"+passageList[key][0]+"]").text(originRange+passageList[key][passageList[key].length-1]+"]");
        }
        for (const key of Object.keys(duplicatePassageList)){
            // console.log("ff",key);
            // console.log("중복지문 앞쪽꺼",$("span[passage-id="+key+"]").text());
            // console.log(duplicatePassageList[key]);
            let originRange = $("span[passage-id="+key+"]").text();
            $("span[passage-id="+key+"]").text(originRange+duplicatePassageList[key][duplicatePassageList[key].length-1]+"]");
        }

        let renderStartItem = 0;
        sleep(3000).then(() => {
            let item_figures = document.getElementsByClassName('item_figure');
            Array.from(item_figures).forEach((item) => {
                console.log("dom item_figure",item);
                console.log("dom item_figure_clientHeight",item.clientHeight);
            });
            let group=[];
            const heightLimit = 800*2;
            let heightSum = 0;
            $('.item_figure').each(function(i,item){
                var figure = $(this);
                let thisHeight = $(this).prop('clientHeight');
                heightSum += thisHeight;
                console.log("-----------------------",renderStartItem+1);
                console.log("jquery item_figure no",$(this).attr('item-no'),"heightSum ",heightSum," thisHeight ",thisHeight," heightSum-thisHeight ",heightSum-thisHeight);
                if(heightSum > heightLimit) { // 다음 순서 문제가 높이 제한을 넘는 경우
                    if(heightSum-thisHeight < heightLimit) {
                        console.log($(this).attr('item-no'),"heightSum ",heightSum,"제한 안쪽");
                        $('.item_figure').slice(renderStartItem, i).wrapAll("<div class='column'></div>");
                        renderStartItem = i;
                        heightSum = thisHeight;
                    } else {
                        console.log($(this).attr('item-no'),"heightSum ",heightSum,"제한 바깥");
                        $('.item_figure').slice(renderStartItem, i-1).wrapAll("<div class='column'></div>");
                        renderStartItem = i-1;
                        heightSum = thisHeight;
                    }
                } else { // 다음 순서 문제가 높이 제한을 넘지 않는 경우

                }

            });
            $('.item_figure').slice(renderStartItem, $('.item_figure').length).wrapAll("<div class='column'></div>");


            // -------------------------------------------------- 시험지 배치 코드 끝

            let startPosition = 0; // 캡쳐를 시작할 위치
            let leftHeight = 0; // 캡쳐해야할 남은 높이
            let setHeight = 0; // 캡쳐할 canvas 높이
            sleep(1000).then(() => {
                html2canvas(document.querySelector('.test_paper'), {
                    allowTaint: true, // cross-origin allow
                    useCORS: true,    // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
                    scale: 2         // 기본 96dpi에서 해상도를 두 배로 증가
                }).then(function (total_canvas) {
                    console.log('total_canvas', total_canvas);

                    // 출력하려는 요소의 총 높이
                    const TOTAL_HEIGHT = total_canvas.height;

                    let result = []; // canvas의 이미지 데이터를 담아서 넘겨주기 위한 배열

                    // 요소의 높이가 29700이 넘으면 분할해서 캡쳐
                    leftHeight = TOTAL_HEIGHT;
                    setHeight = TOTAL_HEIGHT <= PAGE_LIMIT_HEIGHT ? TOTAL_HEIGHT : PAGE_LIMIT_HEIGHT;
                    console.log("TOTAL_HEIGHT", TOTAL_HEIGHT);

                    // 내부함수를 재귀함수로 사용하여 분할 캡쳐를 한다면, 반복하여 동작
                    function addDataUrl() {
                        html2canvas(document.querySelector('.test_paper'), {
                            allowTaint: true, // cross-origin allow
                            useCORS: true,    // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
                            scale: 3,         // 기본 96dpi에서 해상도를 두 배로 증가
                            y: startPosition, // 캡쳐를 시작할 위치
                            height: setHeight // 캡쳐할 canvas의 높이
                        }).then(function (canvas) {
                            let obj = {};
                            obj.url = canvas.toDataURL("image/svg");
                            obj.cWidth = canvas.width;
                            obj.cHeight = canvas.height;
                            result.push(obj); // 가져온 객체를 배열에 담기
                            leftHeight -= PAGE_LIMIT_HEIGHT; // 캡쳐해야할 남은 높이에서 방금 남은 높이빼기
                            if (leftHeight > 0) { // 아직 캡쳐해야할 높이가 남았다면
                                startPosition += PAGE_LIMIT_HEIGHT; // 시작점 조정
                                // 마지막 페이지라면 캡쳐할 canvas 높이를 남은 높이에 맞춰서 설정
                                //setHeight = leftHeight <= PAGE_LIMIT_HEIGHT ? leftHeight : PAGE_LIMIT_HEIGHT;
                                addDataUrl();
                            } else {
                                savePDF(result, examName);

                            }

                        });
                    }

                    addDataUrl();
                });
            });
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
    <div id="contents">

    </div>

</div>
