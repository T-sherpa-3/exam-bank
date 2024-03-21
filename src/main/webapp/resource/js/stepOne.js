let tempLevelArray;
let active=false;

$(function () {

    activeText(1);

    //초기 비활성화
    disActiveProblemCnt();

    // 단원 정보 문항수 가져오기
    drawItemCounts();

    tempLevelArray = [];

    // 단원정보 > 전체 선택
    $('#chk_all').on("click", function () {

        let _largeCheck = $(".que-allCheck[data-code=large]");
        let nextDiv = _largeCheck.parents('.check-group').next('div');

        if ($("#chk_all").is(":checked")) {
            _largeCheck.siblings("label").children("button").removeClass('active');

            //트리 펼치기
            nextDiv.stop().slideDown('fast');
            // 하위 노드 전부 펼치기
            nextDiv.find("button.dep-btn").removeClass('active');
            nextDiv.find("div").not(".check-group").stop().slideDown('fast');
            nextDiv.find("div.check-group").each(function (i){
                if(!$(this).hasClass("on")){
                    $(this).addClass("on")
                }
            })
            _largeCheck.parents('.check-group').addClass("on")
            //체크
            $(".que-allCheck").prop('checked', true);

            //출제옵션 비활성화시 활성화로 변경
            if(active===false) {
                activeProblemCnt();
            }

        } else {
            _largeCheck.siblings("label").children("button").addClass('active');
            //트리 닫기
            nextDiv.stop().slideUp('fast');
            // 하위 노드 전부 닫기
            nextDiv.find("button.dep-btn").addClass('active');
            nextDiv.find("div").not(".check-group").stop().slideUp('fast');
            nextDiv.find("div.check-group").each(function (i){
                if($(this).hasClass("on")){
                    $(this).removeClass("on")
                }
            })
            _largeCheck.parents('.check-group').removeClass("on")
            //체크
            $(".que-allCheck").prop('checked', false);
            //출제옵션 비활성화
            disActiveProblemCnt();
        }
    });


    // 단원정보 > 트리 펼치기 (트리:버튼)
    $('#unit-ul').on('click', 'li .dep-btn, li input[type=checkbox]', function (e) {
        let _this = $(this);
        let lastOne = false;
        let _thisSlideUp = false;
        if (e.target.type === "checkbox") {
            _thisSlideUp = !_this.is(":checked");
            lastOne = !_this.siblings("label").children().hasClass("dep-btn");
            if (_thisSlideUp && !lastOne) {
                _this.siblings("label").children("button").addClass('active');
                let nextDiv = _this.parents('.check-group').next('div');
                nextDiv.stop().slideUp('fast');
                // 하위 노드 전부 닫기
                nextDiv.find("button.dep-btn").addClass('active');
                nextDiv.find("div").not(".check-group").stop().slideUp('fast');
                nextDiv.find("div.check-group").each(function (i){
                    if($(this).hasClass("on")){
                        $(this).removeClass("on")
                    }
                })
            } else if(!lastOne) {
                _this.siblings("label").children("button").removeClass('active');
                let nextDiv = _this.parents('.check-group').next('div');
                nextDiv.stop().slideDown('fast');
                // 하위 노드 전부 펼치기
                nextDiv.find("button.dep-btn").removeClass('active');
                nextDiv.find("div").not(".check-group").stop().slideDown('fast');
                nextDiv.find("div.check-group").each(function (i){
                    if(!$(this).hasClass("on")){
                        $(this).addClass("on")
                    }
                })
            }
        } else {
            _thisSlideUp = !_this.hasClass('active');
            checkboxFl = false;
            if (_thisSlideUp) {
                _this.addClass('active');
                let nextDiv = _this.parents('.check-group').next('div');
                nextDiv.stop().slideUp('fast');

            } else {
                _this.removeClass('active');
                let nextDiv = _this.parents('.check-group').next('div');
                nextDiv.show();
                // nextDiv.children().show();
                nextDiv.stop().slideDown('fast');

            }
        }

        if(_thisSlideUp){
            _this.parents('.check-group').removeClass("on")
        }else{
            _this.parents('.check-group').addClass("on")
        }
    });


    // 단원정보 > 체크 (트리:체크박스)
    $('#unit-ul').on('click', 'li .que-allCheck', function () {

        let _this = $(this);
        // 체크한 값의 코드 타입
        let codeType = _this.attr('data-code');

        // 하위 체크박스 제어
        if (_this.prop('checked') && _this.hasClass('depth01')) {
            _this.parents('.check-group').next('div').find('input[type=checkbox]').prop('checked', true);
        } else if (!_this.prop('checked') && _this.hasClass('depth01')) {
            _this.parents('.check-group').next('div').find('input[type=checkbox]').prop('checked', false);
        }

        // 상위 체크박스 제어
        if(codeType === 'medium' || codeType != 'large') {
            updateParentCheckboxes(_this, 3)
        }
        if(codeType != 'large'){
            updateParentCheckboxes(_this, 2)
        }

        let chk_total_len = $(".que-allCheck").length;
        let checked_len = $(".que-allCheck:checked").length;
        let last_checked_len = $(".que-allCheck:checked").not(".depth01").length

        //전체선택 제어
        if(chk_total_len===checked_len) $('#chk_all').prop("checked",true);
        else $('#chk_all').prop("checked",false);

        //출제옵션 제어
        if (_this.prop('checked')) {
            if(active===false) {
                // 출제옵션 활성화
                activeProblemCnt();
            }
        }else{
            //최하위 단원 미체크시 출제옵션 비활성화
            if (last_checked_len === 0) {
                disActiveProblemCnt();
            }
        }

    });

    // 상위 체크박스 제어
    function updateParentCheckboxes(element, depth) {
        let parents = element.parents(`.depth0${depth}`).find(`.check-group.class-depth-${depth}`);

        // 선택한 그룹의 체크박스
        let thisGroup = element.parent().parent().find('input[type="checkbox"]').length;
        let thisGroupChecked = element.parent().parent().find('input[type="checkbox"]:checked').length;

        // 선택한 그룹의 체크박스 제어
        if(thisGroup === thisGroupChecked){
            element.parents(".check-group").parent().prev("div").find('input[type=checkbox]').prop('checked', true);
        }else {
            element.parents(".check-group").parent().prev("div").find('input[type=checkbox]').prop('checked', false);
        }

        // 상위 체크박스
        let parentCheckboxCnt = parents.find('input[type="checkbox"]').length;
        let parentCheckedCnt =parents.find('input[type="checkbox"]:checked').length;

        // 상위 체크박스 제어
        if(parentCheckboxCnt === parentCheckedCnt){
            element.parents(`.depth0${depth}`).prev("div").find('input[type=checkbox]').prop('checked', true);
        }else {
            element.parents(`.depth0${depth}`).prev("div").find('input[type=checkbox]').prop('checked', false);
        }
    }


    // 출제옵션 > 문제수 버튼 클릭 - 문항 체크
    $("#btn-num-group button").on("click", function () {
        $("#txt-exam-num").val($(this).text());
        $("#txt-exam-num").css("border-color", "");
        levelCheck();
        $("#total-num").show();
        $("#total-num-val").text($(this).text());
    });

    // 출제옵션 > 난이도별 문제 수 팝업
    $("#btn-pop-que-range").on("click", function () {
        if ($("#level-btn-group button.active").length === 0) {
            return false;
        }
        $("#pop-range-wrap-set div").removeClass("fail");
        $("#range_pop_save").removeClass("disabled");
        $("#level-btn-group button").each(function (i) {
            if ($(this).hasClass("active")) {
                $("#pop-range-wrap-set input[type=number]").eq(i).val(tempLevelArray[i]);
                $("#pop-range-wrap-set div").eq(i).show();
            } else {
                $("#pop-range-wrap-set div").eq(i).hide();
            }
        })
        showPop("que-range-pop");
    });

    // 출제옵션 > 난이도 문제수 설정 팝업 > 문제수 입력
    $("#pop-range-wrap-set input[type=number]").keyup(function () {

        let totalCnt = Number($("#pop_level_stap1").val()) + Number($("#pop_level_stap2").val()) + Number($("#pop_level_stap3").val()) + Number($("#pop_level_stap4").val()) + Number($("#pop_level_stap5").val());
        // 소수점이 없으면
        if(Number.isInteger(totalCnt)){
            $("#pop_question_sum").text(totalCnt);
            $("#pop_question_sum").val(totalCnt);
        }else{
            $("#pop_question_sum").text(totalCnt.toFixed(2));
            $("#pop_question_sum").val(totalCnt.toFixed(2));
        }

        // 입력 값이 음수 이거나 소수점일때
        if (Number($(this).val()) <0 || !Number.isInteger(Number($(this).val()))) {
            $(this).parents(".range").addClass("fail");
            $("#pop_question_sum").parent().addClass("fail");
            $("#range_pop_save").addClass("disabled");
            return false;
        }
        let txtExamNum = $("#txt-exam-num").val();
        if (Number(txtExamNum) !== Number($("#pop_question_sum").val())) {
            $("#pop-range-wrap-set .range").each(function (i) {
                if ($(this).find("input[type=number]").val() !== '0') {
                    $(this).addClass("fail");
                    $("#range_pop_save").addClass("disabled");
                }
            });
            $("#pop_question_sum").parent().addClass("fail");
            $("#range_pop_save").addClass("disabled");
        } else {
            $("#pop-range-wrap-set .range").removeClass("fail");
            $("#pop_question_sum").parent().removeClass("fail");
            $("#range_pop_save").removeClass("disabled");
        }
    });

})

// 문항수 그려주기
function drawItemCounts() {
    let params ={
        "subjectId": $('#subjectId').val()
    };

    ajaxCall("POST", "/customExam/step1/count", params, function (data) {
        let smallItemCount = data.listSmallItemCount;
        let topicItemCount = data.listTopicItemCount;

        //if(data.successYn === 'Y'){
        if(true){
            //if(smallItemCount.length === 0 && topicItemCount.length === 0){
            if(false){
                alert("문항 수 조회중 오류가 발생했습니다.");
                $('em').hide();
                return false;
            }

            // 소단원
            smallItemCount.forEach(function(item) {
                const $inputElement = $(`.depth03 input[data-columns="${item.smallChapterId}"]`);
                // input 엘리먼트의 부모인 div.check-group에서 em 태그 찾기
                $inputElement.closest('div.check-group').find('em').text(comma(`(${item.itemCount})`));
            });
            // 토픽
            topicItemCount.forEach(function(item) {
                const $inputElement = $(`.depth04 input[data-columns="${item.topicChapterId}"]`);
                // input 엘리먼트의 부모인 div.check-group에서 em 태그 찾기
                $inputElement.closest('div.check-group').find('em').text(comma(`(${item.itemCount})`));
            });
        }
    });
}

// 출제옵션 > 문제 수 > 입력input 문제수 체크 (5의배수 확인)
function questionCountCheck() {
    $("#btn-num-group button").removeClass("active");
    $("#questionCntMessage").text("");
    $("#txt-exam-num").css("border-color", "");
    $("#total-num").hide();

    let maxNum = Number($("#txt-exam-num").data("columns"));
    let inputNum = parseInt($("#txt-exam-num").val());

    // 음수이거나 소수점
    if (inputNum <=0 || !Number.isInteger(Number($("#txt-exam-num").val()))) {
        $("#txt-exam-num").css("border-color", "#ff3b00");
        $("#txt-exam-num").val("");
        return false;
    }

    if (inputNum > maxNum) {
        alert("문항은 최대 " + maxNum + "문제 까지만 출제 가능합니다.");
        $("#txt-exam-num").css("border-color", "#ff3b00");
        $("#txt-exam-num").val("");
        return false;
    }

    // dafault 문항수로 체크되면, 버튼 활성화
    switch (inputNum) {
        case 10:
            $("#q_10").addClass("active");
            break;
        case 15:
            $("#q_15").addClass("active");
            break;
        case 20:
            $("#q_20").addClass("active");
            break;
        case 25:
            $("#q_25").addClass("active");
            break;
        case 30:
            $("#q_30").addClass("active");
            break;
    }

    if (inputNum % 5 === 0) {
        $("#questionCntMessage").text("");
        levelCheck();
        $("#total-num").show();
        $("#total-num-val").text(inputNum);
    } else {
        $("#txt-exam-num").css("border-color", "#ff3b00");
        $("#questionCntMessage").text("* 5의 배수로 입력해주세요.");
        levelCheck();
    }
}


// 난이도 구성에 따른 난이도별 문제수 input 제어
function levelCheck(queCnt) {
    let txtExamNum = queCnt === undefined ? $("#txt-exam-num").val() : queCnt;

    // 난이도처리
    let levelActiveCnt = $("#level-btn-group button.active").length;
    let eachExamNum = Math.floor(Number(txtExamNum) / levelActiveCnt);
    let remainder = Number(txtExamNum) % levelActiveCnt;

    console.log("StepOne ::::levelCheck ==levelActiveCnt===>" + levelActiveCnt);
    console.log("StepOne ::::levelCheck ==eachExamNum===>" + eachExamNum);
    console.log("StepOne ::::levelCheck ==remainder===>" + remainder);

    let levelArray = [];
    let smallest = true;

    $("#level-btn-group button").each(function (i) {
        if ($(this).hasClass("active") && smallest) {
            levelArray.push(eachExamNum + remainder);
            smallest = false;
        } else if ($(this).hasClass("active")) {
            levelArray.push(eachExamNum);
        } else {
            levelArray.push(0);
        }
    });
    console.log("StepOne ::::levelCheck ==levelArray===> " + levelArray);

    // 난이도 분포별 텍스트 변경처리
    _.forEach(levelArray, function (questionCnt, key) {
        let name;
        let index = key + 1;
        switch (key) {
            case 0:
                name = "최하"
                break;
            case 1:
                name = "하"
                break;
            case 2:
                name = "중"
                break;
            case 3:
                name = "상"
                break;
            case 4:
                name = "최상"
                break;
        }
        $("#level_stap" + index).text(name + "(" + questionCnt + ")");
        $("#pop_level_stap" + index).text(questionCnt);
        $("#pop_level_stap" + index).val(questionCnt);
    });

    $("#pop_question_sum").val(_.sum(levelArray));
    $("#pop_question_sum").text(_.sum(levelArray));
    tempLevelArray = levelArray;
}

//출제옵션 > 난이도별 문제수 팝업 > 저장
function levelCntSave() {
    /**
     * 난이도 분포설정에서 저장하면,
     * 1) 해당 분포 수정 된 부분이 levekArray에 바뀌어야함
     * 2) 분포도 조정되어야함
     * 3) step2버튼 눌릴때도 levelArray값 확인해야함
     * **/
    let popLevelArr = [];
    let txtExamNum = $("#txt-exam-num").val();
    if($("#pop-range-wrap-set .range").hasClass("fail")){
        return false;
    }
    // 총문항수 체크
    $("#pop-range-wrap-set input[type=number]").each(function (i) {
        popLevelArr.push(Number($(this).val()));
    });
    if (Number(txtExamNum) !== Number($("#pop_question_sum").val())) {
        $("#pop-range-wrap-set .range").each(function (i) {
            if ($(this).find("input[type=number]").val() !== '0') {
                $(this).addClass("fail");
            }
        });
        $("#pop_question_sum").parent().addClass("fail");
        return false;
    }

    //levelCheck();
    //console.log($("customExamStepOne :::: " + $("#pop_level_stap3").val()));
    // 난이도처리
    _.forEach(popLevelArr, function (questionCnt, key) {
        let name = "";
        switch (key) {
            case 0:
                name = "최하"
                break;
            case 1:
                name = "하"
                break;
            case 2:
                name = "중"
                break;
            case 3:
                name = "상"
                break;
            case 4:
                name = "최상"
                break;
        }
        if (questionCnt > 0) {
            $("#level-btn-group button").eq(key).addClass("active");
            $("#level-distribution-btn-group span").eq(key).show();
            $("#level-distribution-btn-group span").eq(key).text(name + "(" + questionCnt + ")")
        } else {
            $("#level-btn-group button").eq(key).removeClass("active");
            $("#level-distribution-btn-group span").eq(key).hide();
        }
    })

    tempLevelArray = popLevelArr;
    closePop("que-range-pop");
}

//출제옵션 > 난이도별 문제수 팝업 > 초기화
function levelCntClear() {
    _.forEach(tempLevelArray, function (questionCnt, key) {
        $("#pop-range-wrap-set div").eq(key).find("input[type=number]").val(questionCnt);
    });
    $("#pop_question_sum").text($("#txt-exam-num").val());
    $("#pop_question_sum").val($("#txt-exam-num").val());

    $("#pop-range-wrap-set div").removeClass("fail");
    $("#range_pop_save").removeClass("disabled");
}

//출제옵션 활성화(디폴트값 셋팅)
function activeProblemCnt() {
    // 커서 활성화 처리
    $(".type-box-wrap").removeClass("cursorDefault");
    $(".btn-wrap .btn-line").removeClass('active');

    //문제수 활성(디폴트 : 30)
    $("#btn-num-group button").attr("disabled", false);
    $("#txt-exam-num").attr("disabled", false);
    $("#q_30").addClass("active");
    $("#txt-exam-num").val(30);
    $("#txt-exam-num").text("30");
    $("#txt-exam-num").data("columns", 30);
    $("#total-num").show();
    $("#total-num-val").text("30");

    //출처 활성(디폴트 : 교사용)
    $("#origin_teacher").attr("disabled", false);
    $("#origin_teacher").addClass("active");

    //평가영역 활성(디폴트 : all)
    $("#category-btn-group button").attr("disabled", false);
    $("#category-btn-group button").addClass("active");

    //문제형태 활성(디폴트 : all)
    $("#type-btn-group button").attr("disabled", false);
    $("#type-btn-group button").addClass("active");

    // 난이도 구성(디폴트 : 하,중,상)
    $("#btn-pop-que-range").attr("disabled", false);
    $("#level-btn-group :button").attr("disabled", false);
    $("#level-btn-group .btn-line").removeClass('active');
    $("#level-btn-group button").eq(1).addClass("active");
    $("#level-btn-group button").eq(2).addClass("active");
    $("#level-btn-group button").eq(3).addClass("active");

    //TODO 230914 임시 최상, 최하 난이도 비활성 처리 230914
    $("#level-btn-group button").eq(0).attr("disabled", true);
    $("#level-btn-group button").eq(0).css("cursor", "default");
    $("#level-btn-group button").eq(4).attr("disabled", true);
    $("#level-btn-group button").eq(4).css("cursor", "default");
    //TODO 230914 임시 최상, 최하 난이도 비활성 처리 230914

    //난이도별 문제수
    levelCheck(30);
    $("#level-distribution-btn-group span").eq(1).show();
    $("#level-distribution-btn-group span").eq(2).show();
    $("#level-distribution-btn-group span").eq(3).show();

    active=true;
}

//출제옵션 비활성화
function disActiveProblemCnt() {
    // 커서 비활성화 처리
    $(".type-box-wrap").addClass("cursorDefault");

    $(".btn-wrap .btn-line").attr("disabled", true);
    $(".btn-wrap .btn-line").removeClass('active');

    //문제수 비활성
    $("#txt-exam-num").attr("disabled", true);
    $("#txt-exam-num").val(null);
    $("#txt-exam-num").text(null);
    $("#txt-exam-num").data("columns", 100);
    $("#questionCntMessage").text(null);
    $("#total-num").hide();

    // 난이도 구성 비활성
    $("#btn-pop-que-range").attr("disabled", true);
    $("#level-btn-group :button").attr("disabled", true);
    $("#level-btn-group .btn-line").removeClass('active');
    levelCheck();
    $("#level-distribution-btn-group span").hide();

    active=false;
}

function showPop(pop, className) {
    let dimClass = className === undefined ? "dim" : className;
    $('html , body').css('overflow', 'hidden');
    $('.' + dimClass).fadeIn();
    $(".pop-wrap[data-pop=" + pop + "]").show();
}

function closePop(pop, className) {
    let dimClass = className === undefined ? "dim" : className;
    $(".pop-wrap[data-pop=" + pop + "]").hide();

    $('.' + dimClass).fadeOut();
    // if (pop != "wrong-pop" ) {
    $('html , body').css('overflow', 'auto');
    // }
}
function moveToStep0() {
    let new_form = $('<form></form>');
    new_form.attr("name", "new_form");
    new_form.attr("charset", "UTF-8");
    new_form.attr("method", "post");
    new_form.attr("action", "/customExam/step0");

    //step0 세팅지 리스트를 위한 subjectId
    new_form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: $('#subjectId').val()}));

    new_form.appendTo('body');
    new_form.submit();
}

let qParam = {};

//step2 이동전 문항수 확인
function moveExamStep2() {
    let txtExamNum = $("#txt-exam-num").val();
    console.log("문제 수 =============>" + txtExamNum);

    if ($('#unit-ul li input[type="checkbox"]:checked').length < 1) {
        alert("단원을 선택해주세요");
        return false;
    }
    if (txtExamNum === '') {
        alert("문제수를 입력해주세요");
        return false;
    }

    if (Number(txtExamNum) % 5 !== 0) {
        alert("문제 수는 5의 배수로 입력해주세요");
        return false;
    }

    if (!$("#origin-btn-group button").hasClass("active")) {
        alert("출처를 선택해주세요");
        return false;
    }

    if (!$("#category-btn-group button").hasClass("active")) {
        alert("평가영역을 선택해주세요");
        return false;
    }

    if (!$("#type-btn-group button").hasClass("active")) {
        alert("문제형태를 선택해주세요");
        return false;
    }

    if (!$("#level-btn-group button").hasClass("active")) {
        alert("난이도를 선택해주세요");
        return false;
    }

    //체크된 단원(최소 단원 - 토픽 or 소주제)
    let chapterArr = [];
    
    console.log("checkedList ::", $('#unit-ul li input[type="checkbox"]:checked'));
    console.log("checkedList ::", $('#unit-ul li input[type="checkbox"]:checked').not('input[type="checkbox"]:checked.depth01'));

    $('#unit-ul li input[type="checkbox"]:checked').not('input[type="checkbox"]:checked.depth01').each(function (x) {
        let _this = $(this);
        let param = {};

        setChapterParam(param, "subject", $('input[name=subjectId]').val());

        let _thisIdArr = _this.prop('id').split('_');
        for (let i = _thisIdArr.length - 1; i > 0; i--) {
            let prevId = _thisIdArr.join('_');
            // console.log("prevId", prevId);
            $('#' + prevId).data('code');
            $('#' + prevId).data('columns');
            setChapterParam(param, $('#' + prevId).data('code'), $('#' + prevId).data('columns'));
            _thisIdArr.pop();
        }
        chapterArr.push(param);
    })
    // console.log("chapterArr :: ", chapterArr);

    let categoryArr = [];
    $("#category-btn-group button").each(function (i) {
        if ($(this).hasClass("active")) {
            categoryArr.push($(this).data("value"));
        }
    })

    //문제형태
    let questionFormArr = [];
    $("#type-btn-group button").each(function (i) {
        if ($(this).hasClass("active")) {
            questionFormArr.push($(this).data("value"));

            if('subjective' === $(this).data("value")){
                questionFormArr.push('descriptive');
            }
        }
    })


    qParam = {};
    qParam.chapterList = JSON.stringify(chapterArr);
    qParam.activityCategoryList = categoryArr;
    qParam.levelCnt = tempLevelArray;
    qParam.questionForm = questionFormArr.join(",");

    ajaxCall("POST", "/customExam/loadStep2", qParam, function (data) {
        if (data != null) {
            if(data.itemsTotalCnt === 0){
                showPop("no-data-pop");

            }else if(data.cntEqualYn === 'N') {
                $(".pop-wrap[data-pop='que-pop'] .range").not(".total").hide();

                for(let i=1; i<=5; i++){
                    if (data.levelGroup['0'+i] !== undefined) {
                        $(".pop-wrap[data-pop='que-pop'] #pop-level"+i).show();
                        $(".pop-wrap[data-pop='que-pop'] #pop-level"+i).find(".num").text(data.levelGroup['0'+i]);
                    }
                }

                $(".pop-wrap[data-pop='que-pop'] #pop-total-sum .num").text(data.itemsTotalCnt);
                $(".pop-wrap[data-pop='que-pop'] #nxt-data").val(data.queIdList);

                showPop("que-pop");

            } else {
                moveToStep2(data.queIdList);
            }
        }
    });
}

//단원 셋팅(파라미터용)
function setChapterParam(param, classType, classCode) {
    switch (classType) {
        case "subject":
            param.subject = classCode;
            break;
        case "large" :
            param.large = classCode;
            break;
        case "medium" :
            param.medium = classCode;
            break;
        case "small" :
            param.small = classCode;
            break;
        case "topic" :
            param.topic = classCode;
            break;
    }
}

//STEP2로 이동
function moveToStep2(queArr) {
    let queArrParam = queArr === undefined ? $(".pop-wrap #nxt-data").val() : queArr;

    let new_form = $('<form></form>');
    new_form.attr("name", "new_form");
    new_form.attr("charset", "UTF-8");
    new_form.attr("method", "post");
    new_form.attr("action", "/customExam/step2");

    new_form.append($('<input/>', {type: 'hidden', name: 'chapterList', value:  qParam.chapterList}));
    new_form.append($('<input/>', {type: 'hidden', name: 'activityCategoryList', value: qParam.activityCategoryList}));
    new_form.append($('<input/>', {type: 'hidden', name: 'levelCnt', value: qParam.levelCnt}));
    new_form.append($('<input/>', {type: 'hidden', name: 'questionForm', value: qParam.questionForm}));
    new_form.append($('<input/>', {type: 'hidden', name: 'queArr', value: queArrParam}));
    new_form.append($('<input/>', {type: 'hidden', name: 'paperGubun', value: 'new'}));
    new_form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: $("#subjectId").val()}));

    new_form.appendTo('body');
    new_form.submit();
}