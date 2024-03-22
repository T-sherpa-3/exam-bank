$(function () {
  
  activeText(2);
  setItemNum();
  setSortNum("detail");
  makeSortGroup();
  
  /* 2024-03-21 추가 : 이양진 */
  // s: 페이지 로드 시 지문+다중 문항 그룹 생성
  function makeSortGroup() {
    let passageList = [];  // 지문 ID 리스트
    
    $(".passage-view-que-box.sort-group").each(function () {
      let passageId = $(this).children('.passage-box').attr('data-passageid');
      passageList.push(passageId);
      console.log("지문 ID : ", passageId);  // 지문 ID 확인
      console.log("sortNum : ", $(this).data('sortnum'));
      console.log("문항 ID : ", $(this).children('.item-box').find('#questionId').val());
      console.log("=========================")
    });
    console.log(passageList.toString());
    // console.log(passageList.length);  // 기본 30개
    
    // 지문 ID가 동일하면 동일한 sort-group으로 묶기
    for (let i = 0; i < passageList.length; i++) {
      // 지문 ID 중 최상단에 위치하는 그룹에 붙이기
      let rootPassage = $('.sort-group').filter(function () {
        return $(this).data('sortnum') == i;
      });
      console.log("root : ", passageList[i]);
      console.log("rootPassage sortnum : ", rootPassage.data('sortnum'));
      
      // 지문 ID가 중복되는 경우 찾기
      for (let j = i + 1; j < passageList.length; j++) {
        if (passageList[j] === passageList[i]) {
          
          let currentPassage = $('.sort-group').filter(function () {
            return $(this).data('sortnum') == j;
          });
          
          console.log("current : ", passageList[j]);
          console.log("currentPassage sortnum : ", currentPassage.data('sortnum'));
          // let itemId = currentPassage.children('.item-box').find('#questionId').val();
          // console.log("문항 Id : ", itemId);
          
          // 문항 영역을 최상단 sort-group 안으로 옮기고, 기존의 sort-group div는 삭제
          let itemToGroup = currentPassage.children('.item-box');
          itemToGroup.appendTo(rootPassage.children('.item-box').last());
          currentPassage.remove();
        }
      }
    }
    
    setSortNum("detail");
    
    // 초기 문제지 요약 항목 정렬
    $("#content-summary-area #table-1").empty();
    $("#view-que-detail-list .sort-group").each(function (i, e) {
      makeSummary($(e), $(e).attr("data-sortnum"), 'add');
    });
  }
  // e: 페이지 로드 시 지문+다중 문항 그룹 생성
  
  
  
  // 문항 타이틀 영역 - 난이도 뱃지에 색상 부여
  $(".view-que-box.item-box").each(function () {
    $(this).find("#difficultyColor").addClass(getColorClass(
      $(this).find("#difficultyCode").val()
    ));
    // 문제 형식에 따른 텍스트 출력
    $(this).find(".que-badge.gray").text(
      getQuestionType($(this).find("#questionFormCode").val())
    );
  });
  
  
  // 초기 정렬 순서
  // 셋팅지,시험지 편집/ 뒤로가기 진입시 : 사용자정렬
  // 신규 : 단원순
  if ("new" === $("#paperGubun").val()) {
    sortQue("detail", "unit");
  } else {
    $("#select-sort-btn").text("사용자 정렬");
    setPassageNum($("#view-que-detail-list .passage-box"));
  }
  
  // 탭 이동시
  $("#tab-right-group li").on("click", function () {
    let tabType = $(this).index() + 1;
    
    if (tabType === 2) {
      $("#tab-box").removeClass("type03");
      $("#tab-box").addClass("type02");
    } else {
      $("#tab-box").removeClass("type02");
      $("#tab-box").addClass("type03");
    }
    
    $("#content-summary-area .col").removeClass("active");
    $("#view-que-detail-list .view-que-box").removeClass("active");
    $("#item-similar-area").empty();
    $("#list-similar-area").css("display", "none");
    $("#init-similar-area").css("display", "");
  });
  
  // 문제+정답 함께 보기
  $("#select-view-list li").on("click", function () {
    if (!$(this).hasClass("disabled")) {
      $("#select-view-btn").text($(this).find("a").text());
      $("#select-view-btn").val($(this).children().data("columns"));
      $("#select-view-btn").attr("data-select", $(this).children().data("columns"));
      $("#select-view-btn").removeClass("active");
      $("#select-view-list").css("display", "none");
      changeView($(this).children().data("columns"));
    }
  });
  
  
  //이전 버튼
  $("#step-prev-btn").on("click", function () {
    
    
    let gubun = $("#paperGubun").val();
    //form
    let url = '';
    let new_form = $('<form></form>');
    new_form.attr("name", "new_form");
    new_form.attr("charset", "UTF-8");
    new_form.attr("method", "post");
    
    new_form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: $("#subjectId").val()}));
    
    if (gubun === "setting") {
      url = "/customExam/step0";
    } else if (gubun === "new") {
      url = "/customExam/step1";
    }
    
    new_form.attr("action", url);
    new_form.appendTo('body');
    new_form.submit();
    
    
  });
  
  // 정렬
  $("#select-sort-list li").on("click", function () {
    $("#select-sort-btn").text($(this).find("a").text());
    $("#select-sort-btn").removeClass("active");
    $("#select-sort-list").css("display", "none");
    if ($(this).find("a").data("columns") !== "default") {
      sortQue("detail", $(this).find("a").data("columns"));
    }
  });
  
  // 문제지요약 클릭시 문제목록 활성화
  $('#table-1').on('click', ".col", function () {
    
    let _idx = $('.col.que').index(this);
    document.getElementsByClassName('item-box')[_idx].scrollIntoView({behavior: "smooth"},);
    
    let _this = $(this);
    if (!_this.hasClass('active')) {
      _this.closest('.test.ui-sortable').find('.col').removeClass('active');
      _this.addClass('active');
      $('.view-que-box').removeClass('active');
      $('.view-que-box.item-box').eq(_idx).addClass('active');
      $('.view-que-box.item-box').eq(_idx).siblings(".passage-box").addClass('active');
    }
  });
  
  // (지문그룹 or 지문없는 문항) 문제지 요약 > 번호 재설정
  $("#table-1").sortable({
    handle: '.dragHandle',
    stop: function (e, ui) {
      setSortNum("summary");
    }
  });
  
  // (지문 내 문항 이동) 문제지 요약 > 번호 재설정
  let moveSortNum;
  $(document).on('mousemove', '#table-1 .passage-table', function () {
    $(this).sortable({
      handle: '.dragHandle',
      start: function (e, ui) {
        moveSortNum = $(this).parent(".summary-box").attr("data-sortSummary"); //이동한 지문그룹 번호
      },
      stop: function (e, ui) {
        setSortNum("summary", moveSortNum);
      }
    });
  });
  
  // 문제지요약 > 시험지명 툴팁
  $(document).on('mouseover', '.btn-tip', function () {
    let _this = $(this);
    let _tooltip = _this.next(".tooltip"); // 툴팁 요소를 바로 뒤에 있는 요소로 찾아옴
    let _tooltipPosition = _this.offset().top; // 버튼(_this)의 전체 문서에서의 위치값을 가져옴
    
    if (_tooltipPosition > 500) {
      _tooltip.css("top", "-112px"); // 툴팁 위치 변경
      _tooltip.addClass("active"); // 클래스 추가
    }
  });
  
  
  // 유사문제 버튼
  $("#view-que-detail-list").on("click", ".btn-similar-que", function () {
    console.log("유사문제 버튼")
    // 토글 및 셀렉트박스 초기화
    clearSimilarCondition();
    $("#tab-box").removeClass("type03");
    $("#tab-box").addClass("type02");
    
    let _sortGroup = $(this).closest(".sort-group");
    
    // 클릭한 문항 id
    let questionId = $(this).closest(".view-que-box").find("#questionId").val();
    console.log("유사문제 버튼2");
    // 기존에 active 된 부분 지우기
    $("#view-que-detail-list .view-que-box").removeClass("active");
    
    // 지문 단위 > 문항단위로 변경
    $(this).closest(".view-que-box").addClass("active");
    
    let _param = {};
    let _excludeCd = [];
    let _problemCode = [];
    
    // 제외할 문제 id 목록 : 문제목록, 삭제 문항 에서 id 추출
    // 문제 목록에서 문항 id 추출
    $("#view-que-detail-list .item-box").each(function (i) {
      // 시험지에 있는 문항아이디 가져오기
      _excludeCd.push(Number($(this).find(".que-top input[id=questionId]").val()));
    })
    
    $("#item-delete-area .item-box").each(function (i) {
      // 이미 추가한 ID는 제외
      let questionId = Number($(this).find("input[id=questionId]").val());
      if (!_excludeCd.includes(questionId)) {
        _excludeCd.push(questionId);
      }
    })
    
    
    // 선택한 지문 id 목록
    _problemCode.push(questionId);
    
    _param.itemIdList = _problemCode;
    
    _param.excludeCode = _excludeCd;
    
    // 문제 목록 순서
    let queNo = $(this).parents(".view-que-box").find(".num").text();
    console.log("queNo = " + queNo);
    $("#target-sort-num").val(_sortGroup.attr("data-sortNum"));
    $("#target-lastItem-num").val(_sortGroup.find(".item-box").last().find(".num").text());
    
    
    $.ajaxSetup({async: false});
    //http://localhost:8080/customExam/similar-List
    ajaxCall("post", "/customExam/similar-List", JSON.stringify(_param), function (data) {
      
      let simData = data.body.itemList;
      console.log("simData === ", simData)
      
      if (simData.length === 0) {
        alert("검색된 유사 문제가 없습니다.");
        // 다시 문제지 요약 탭으로
        $("#tab-summary").click();
        
      } else {
        $("#init-similar-area").css("display", "none");
        let html = '';
        let similarItemNum = 0;
        
        // 이미 추가한 문항들의 ID를 저장할 배열
        let addedPassageIds = [];
        let addedItemIds = [];
        let group = {};
        let pArrLength = 0;
        
        simData.forEach((item) => {
          const {passageId} = item;
          // group 객체 내에 해당 passageId 키가 존재하지 않으면, 해당 키에 빈 배열 할당
          if (!group[passageId]) {
            group[passageId] = [];
          }
          // 현재 아이템을 해당 passageId 배열에 추가
          group[passageId].push(item);
          
          console.log("group[passageId] = ", group[passageId]);
        });
        let groupNum = 0;
        Object.keys(group).forEach(passageId => {
          const items = group[passageId];
          
          
          let passageBox = items.length > 0 ? "passage-view-que-box" : "";
          html += '<div class="' + passageBox + ' sort-group" data-sortNum="' + groupNum + '" data-sortValue="">';
          console.log("items - ", items)
          groupNum++;
          // 지문영역
          if (items[0].passageUrl) {
            html +=
              `<div class="view-que-box passage-box" data-passageId="${passageId}">
                                 <div class="que-top">
                                     <div class="title"><span class="num"></span></div>
                                     <div class="btn-wrap delete-btn-wrap"></div>
                                 </div>
                                 <div class="view-que">
                                    <div class="que-bottom">
                                         <div class="passage-area"><img src="${items[0].passageUrl}" alt="${passageId}" width="453px"></div>
                                         <div class="btn-wrap etc-btn-wrap" style="margin-top: 10px;">
                                                  ${items.length === 1 ? "" :
                `<button type="button" class="btn-default btn-add" data-type="all"><i class="add-type02"></i>전체 추가</button>`}
                                             </div>
                                         </div>
                                     </div>
                                 </div>`;
          }
          // 각 문항에 대한 HTML
          items.forEach(item => {
            similarItemNum++;
            console.log("item.explainUrl -- ", item.explainUrl)
            html += `
                            <div class="view-que-box item-box" data-paperTitle="${passageId}">
                                <div class="que-top">
                                    <div class="title">
                                        <span class="num">${similarItemNum}</span>
                                        <div class="que-badge-group">
                                            <span class="que-badge ${getColorClass(item.difficultyCode)}">${item.difficultyName}</span>
                                            <span class="que-badge gray">${getQuestionType(item.questionFormCode)}</span>
                                            <input type="hidden" id="questionId" value="${item.itemId}">
                                            <input type="hidden" id="chapterGp" value="${item.largeChapterId}${item.mediumChapterId}${item.smallChapterId}${item.topicChapterId}">
                                            <input type="hidden" id="difficultyCode" value="${item.difficultyCode}">
                                            <input type="hidden" id="questionFormCode" value="${item.questionFormCode}">
                                        </div>
                                    </div>
                                    <div class="btn-wrap">
                                        <span class="tooltip-wrap type02">
                                            <button type="button" class="btn-error pop-btn" data-pop="error-report-pop"></button>
                                            <span class="tooltip type02">
                                                <div class="tool-type01">문항오류신고</div>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div class="view-que">
                                    <div class="que-content">
                                        <img src="${item.questionUrl}" alt="${item.itemId}" width="453px">
                                    </div>
                                    <div class="que-bottom">
                                        <div class="data-area">
                                            <div class="que-info answer-area" style="display: ${$("#select-view-btn").attr("data-select") === "type1" ? "none" : ""}">
                                                <p class="answer"><span class="label type01">정답</span></p>
                                                <div class="data-answer-area"><img src="${item.answerUrl}" alt="${item.itemId}" width="453px"></div>
                                            </div>
                                        </div>
                                        <div class="data-area type01" style="display: ${$("#select-view-btn").attr("data-select") === "type3" ? "" : "none"}">
                                            <div class="que-info explain-area">
                                                <p class="answer"><span class="label">해설</span></p>
                                                <div class="data-answer-area"><img src="${item.explainUrl}" alt="${item.itemId}" width="453px"></div>
                                            </div>
                                        </div>
                                        <div class="btn-wrap etc-btn-wrap">
                                            <button type="button" class="btn-default btn-add" data-type=""><i class="add-type02"></i>추가</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="que-info-last" title="${item.largeChapterName} > ${item.mediumChapterName} > ${item.smallChapterName} > ${item.topicChapterName}">
                                    <p class="chapter">${item.largeChapterName} > ${item.mediumChapterName} > ${item.smallChapterName} > ${item.topicChapterName}</p>
                                </div>
                            </div>`;
          });
          
          html += '</div>';
        });
        
        
        $("#item-similar-area").empty();
        $("#list-similar-area").css("display", "block");
        $(html).prependTo($("#item-similar-area"));
        $("#similar-title").text(queNo + "번 유사 문제");
        setPassageNum($("#item-similar-area .passage-box"));
        
        // 유사 문제 영역 스크롤 최상단 지정
        document.getElementById('item-similar-area').getElementsByClassName('sort-group')[0].scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
        
        if (!$("#contents-similar-area").hasClass('on')) {
          $(".contents").removeClass('on');
          $("#contents-similar-area").addClass('on');
          $("#tab-right-group .ui-tab-btn").removeClass('active');
          $("#tab-similar").addClass('active');
        }
        
      }
    });
  });
  
  
  // 유사문제 탭 > 검색 조건
  $("#similar-level-list li").on("click", function (e) {
    $("#similar-level-btn").text($(this).find("a").text());
    $("#similar-level-btn").val($(this).find("a").data("columns"));
    $("#similar-level-btn").removeClass("active");
    $("#similar-level-list").css("display", "none");
    filterSimilar($(this).find("a").data("columns"));
  });
  
  // 유사 문제 탭 or 삭제 문항 탭 > 추가
  $("#item-similar-area , #item-delete-area").on("click", ".btn-add", function (e) {
    // 해당 문항 그룹
    let questionGroup = $(this).closest(".sort-group");
    
    // 선택한 문항 정보
    let selectedQuestion = $(this).parents(".item-box");
    let questionId = selectedQuestion.find("#questionId").val();
    
    // 선택한 지문
    let selectedPassageBox = questionGroup.children(".passage-box");
    let selectedPassageId = selectedPassageBox.attr("data-passageId");
    
    // 지문, 문항 active 제거
    questionGroup.find('.active').removeClass('active');
    
    // 버튼 타입
    let btnType = $(this).attr("data-type");
    
    // 스크롤 위치
    let scrollTarget;
    
    if (btnType === "all") {
      // 전체 삭제는 문항 그룹 전체를 넘김
      convertItem(btnType, questionGroup, selectedPassageBox, "view-que-detail-list");
      questionGroup.remove();
      // 스크롤 위치는 지문 위치
      scrollTarget = document.querySelector(`#view-que-detail-list .passage-box[data-passageid="${selectedPassageId}"]`);
      
    } else {
      // 개별 추가
      // 단일 문항은 문항 그룹 전체를 넘김
      if (selectedPassageId === undefined) {
        convertItem(btnType, questionGroup, selectedPassageBox, "view-que-detail-list");
      } else {
        // 지문 문항은 문항만 넘김
        convertItem(btnType, selectedQuestion, selectedPassageBox, "view-que-detail-list");
      }
      // 스크롤 이동 위치는 이동한 문항 위치
      scrollTarget = document.querySelector(`#view-que-detail-list .item-box:has(input[value="${questionId}"])`);
    }
    
    $("#select-sort-btn").text("사용자 정렬");
    
    // 문제 목록 번호 재정렬
    setSortNum("detail");
    // 유사 목록 번호 재정렬
    setSortNum("similar");
    // 삭제 목록 번호 재정렬
    setSortNum("delete");
    
    // 문제지 요약 생성 재설정
    $("#content-summary-area #table-1").empty();
    $("#view-que-detail-list .sort-group").each(function (i, e) {
      makeSummary($(e), $(e).attr("data-sortnum"), 'add');
    });
    
    // scrollTarget에 따라 스크롤 이동처리
    scrollTarget.scrollIntoView({behavior: "smooth"},);
    
    // 현 조건에서 유사문제 없을시
    if ($("#item-similar-area .view-que-box").not(':hidden').length === 0) {
      $("#item-similar-area").addClass("no-data");
      $("#item-similar-area").append("<p>유사문제를 모두 추가하였습니다.</p>");
    }
    
    // 현 조건에서 삭제문항 없을시
    if ($("#item-delete-area").children().length === 0) {
      $("#item-delete-area").hide();
      $("#init-delete-area").show();
    }
    
    // 문제 목록 데이터 추가시
    if ($("#view-que-detail-list").children().not("#no-data-detail-area").length > 0) {
      $("#no-data-detail-area").hide();
    }
  });
  
  // 문제 목록 > 삭제
  $("#view-que-detail-list").on("click", ".btn-delete", function () {
    // 해당 문항 그룹
    let questionGroup = $(this).closest(".sort-group");
    
    // 선택한 문항 정보
    let selectedQuestion = $(this).parents(".item-box");
    
    // 선택한 지문
    let selectedPassageBox = questionGroup.children(".passage-box");
    let selectedPassageId = selectedPassageBox.attr("data-passageId");
    
    // 지문, 문항 active 제거
    questionGroup.find('.active').removeClass('active');
    
    // 버튼 타입
    let btnType = $(this).attr("data-type");
    
    if (btnType === "all") {
      // 전체 삭제는 문항 그룹 전체를 넘김
      convertItem(btnType, questionGroup, selectedPassageBox, "item-delete-area");
      questionGroup.remove();
      
    } else {
      // 개별 삭제
      // 단일 문항은 문항 그룹 전체를 넘김
      if (selectedPassageId === undefined) {
        convertItem(btnType, questionGroup, selectedPassageBox, "item-delete-area");
      } else {
        // 지문 문항은 문항만 넘김
        convertItem(btnType, selectedQuestion, selectedPassageBox, "item-delete-area");
      }
    }
    
    // 문제 목록 번호 재정렬
    setSortNum("detail");
    // 삭제 목록 번호 재정렬
    setSortNum("delete");
    
    // 문제지 요약 생성 재설정
    $("#content-summary-area #table-1").empty();
    $("#view-que-detail-list .sort-group").each(function (i, e) {
      makeSummary($(e), $(e).attr("data-sortnum"), 'delete');
    });
    
    // 삭제 문항 active
    if (!$("#contents-delete-area").hasClass('on')) {
      $(".contents").removeClass('on');
      $("#contents-delete-area").addClass('on');
      $("#tab-right-group .ui-tab-btn").removeClass('active');
      $("#tab-delete").addClass('active');
    }
    
    // 삭제 문항 nodata 숨김 처리
    if ($("#item-delete-area").children().length > 0) {
      setPassageNum($("#item-delete-area .passage-box"));
      $("#item-delete-area").show();
      $("#init-delete-area").hide();
    }
    
    // 문제 목록 데이터 없음 처리
    if ($("#view-que-detail-list").children().not("#no-data-detail-area").length === 0) {
      $("#no-data-detail-area").show();
    }
  });
  
  // 이동할 위치 ,문항 유형에 따라 문항 만들어주기
  // view-que-detail-list 이면 문제 목록
  function convertItem(btnType, currentGroup, currentPassageBox, target) {
    let currentPassageId = currentPassageBox.attr("data-passageid");
    // target에 따라 추가 삭제
    let num = target === "view-que-detail-list" ? 1 : -1;
    // 이동할 html
    let convertHtml;
    console.log("btnType : " + btnType);
    console.log("target : " + target);
    
    // 하단 개수 설정
    let rLevelNum = currentGroup.find("#difficultyCode").val().slice(-1);
    let rFormType = filterFormType(currentGroup.find("#questionFormCode").val());
    
    // 좌측에서 선택한 문항이 단일 문항인 경우
    if (typeof currentPassageId === "undefined") {
      convertHtml = target === "view-que-detail-list" ? convertToLeft(currentGroup) : convertToRigth(currentGroup);
      // active 여부에 따라 이동할 위치 설정
      let activeTarget = $(`#${target}`).find(".sort-group").find(".item-box.active").closest(".sort-group");
      activeTarget.length > 0 ? convertHtml.insertAfter(activeTarget) : convertHtml.appendTo(`#${target}`);
      
      // 하단 개수 설정
      countBadgeLevel(rLevelNum, num);
      countBadgeFormType(rFormType, num);
      
    } else {
      if (btnType === "all") { // 전체 선택
        currentGroup.find(".item-box").each(function () {
          rLevelNum = $(this).find("#difficultyCode").val().slice(-1);
          rFormType = filterFormType($(this).find("#questionFormCode").val());
          makeNewGroup($(this), currentPassageBox, target);
          // 하단 개수 설정
          countBadgeLevel(rLevelNum, num);
          countBadgeFormType(rFormType, num);
        });
      } else {
        makeNewGroup(currentGroup, currentPassageBox, target);
        // 하단 개수 설정
        countBadgeLevel(rLevelNum, num);
        countBadgeFormType(rFormType, num);
      }
    }
  }
  
  //  지문 + 문항 만들기
  function makeNewGroup(itemGroup, passageGroup, target) {
    // target > view-que-detail-list 이면 문제 목록에 추가
    // 기존 그룹의 id
    let beforeId = passageGroup.parents(".view-que-list").attr("id");
    let passageId = passageGroup.attr("data-passageid");
    
    // 반환할 html
    let newGroup;
    
    // 이동할 위치에 지문 존재 여부 확인
    let targetPassageBox = $(`#${target} .passage-box[data-passageId='${passageId}']`);
    if (targetPassageBox.length > 0) {
      // 이동할 위치 변경: 동일 지문 그룹 하단
      let targetGroup = targetPassageBox.parents(".sort-group");
      // 해당 지문 내에서 이동한 문항만 사라지고 나머지는 그대로 유지
      newGroup = target === "view-que-detail-list" ? convertToLeft(itemGroup) : convertToRigth(itemGroup)
      newGroup.appendTo(targetGroup);
      
    } else {
      // 새로운 지문 + 문항 그룹을 만들어 추가
      newGroup = $("<div class='passage-view-que-box sort-group'></div>");
      let passageBox = $(`#${beforeId} .passage-box[data-passageId='${passageId}']`);
      passageBox.clone().appendTo(newGroup);
      itemGroup.appendTo(newGroup);
      newGroup = target === "view-que-detail-list" ? convertToLeft(newGroup) : convertToRigth(newGroup);
      
      // 문제 목록으로 이동
      if (target === "view-que-detail-list") {
        newGroup = newGroup.attr('data-sortnum', passageGroup.siblings(".item-box").length + 1);
        // active 여부에 따라 이동할 위치 설정
        let activeTarget = $(`#${target}`).find(".sort-group").find(".item-box.active").closest(".sort-group");
        activeTarget.length > 0 ? newGroup.insertAfter(activeTarget) : newGroup.appendTo(`#${target}`);
      } else {
        // 삭제 목록으로 이동
        newGroup.appendTo(`#${target}`);
      }
    }
    
    // 기존 목록 지문그룹 내 문항이 없으면 지문 삭제
    console.log("before passageGroup cnt: " + passageGroup.siblings(".item-box").length);
    if (passageGroup.siblings(".item-box").length < 1) {
      passageGroup.parents(".sort-group").remove();
    }
  }
  
  //step3 이동
  $("#step-3-btn").on("click", function (e) {
    let queArr = [];
    $("#view-que-detail-list .que-top #questionId").each(function (i) {
      let param = {};
      queArr.push($(this).val());
    });
    
    if (queArr.length == 0) {
      alert("문제목록이 없습니다.");
      return false;
    }
    
    if (queArr.length > 100) {
      alert("100문제 이하로 구성 바랍니다.");
      return false;
    }
    
    let _form = $('<form></form>');
    
    _form.attr("name", "new_form");
    _form.attr("charset", "UTF-8");
    _form.attr("method", "post");
    _form.attr("action", "/customExam/step3");
    
    _form.append($('<input/>', {type: 'hidden', name: 'queArr', value: queArr}));
    _form.append($('<input/>', {type: 'hidden', name: 'subjectId', value: $("#subjectId").val()}));
    _form.append($('<input/>', {type: 'hidden', name: 'paperGubun', value: $("#paperGubun").val()}));
    if ('update' === $("#paperGubun").val()) {
      _form.append($('<input/>', {type: 'hidden', name: 'paperId', value: $("#updatePaperId").val()}));
      _form.append($('<input/>', {type: 'hidden', name: 'paperTitle', value: $("#updatePaperTitle").val()}));
    }
    
    _form.appendTo('body');
    alert(typeof queArr);
    _form.submit();
    
  });
  
  // 출제범위 버튼
  $("#btn-range").on("click", function (e) {
    
    let rangeParam = {};
    let chapterArr = [];
    let rangeQueArr = [];
    
    $("#view-que-detail-list .item-box").each(function (i) {
      chapterArr.push($(this).find(".que-top input[id=chapterGp]").val());
    });
    console.log("chapterArr : ", chapterArr);
    
    chapterArr.sort();
    
    for (let c = 0; c < chapterArr.length; c++) {
      let qVal = $("#view-que-detail-list .que-top input[value='" + chapterArr[c] + "']").siblings("#questionId").val();
      rangeQueArr.push(qVal);
    }
    
    if (rangeQueArr.length == 0) {
      alert("문제목록이 없습니다.");
      return false;
    }
    
    rangeParam.itemIdList = rangeQueArr;
    console.log("rangeParam : ", rangeParam)
    
    $.ajaxSetup({async: false});
    ajaxCall("POST", "/customExam/range-list", JSON.stringify(rangeParam), function (data) {
      
      if (data == null || data.length === 0) { // 응답 데이터가 없거나 길이가 0인 경우
        alert("오류가 발생하였습니다."); // 오류 메시지를 경고창으로 표시
      } else { // 응답 데이터가 있는 경우
        
        let html = ''; // HTML을 저장할 변수 초기화
        // let lChapterG = data.body.itemList.largeChapterName; // 응답 데이터에서 대분류 정보 추출
        
        // 대분류 정보를 담을 배열 초기화
        let uniqueLargeChapters = [];
        
        // 대분류별로 순회
        data.body.itemList.forEach(item => {
          // 현재 아이템의 대분류가 이전에 처리된 적이 있는지 확인
          if (!uniqueLargeChapters.includes(item.largeChapterName)) {
            // 아직 처리되지 않은 대분류인 경우
            uniqueLargeChapters.push(item.largeChapterName); // 대분류 배열에 추가
            html += `<ul>${item.largeChapterName}`; // 대분류 정보를 HTML에 추가
            
            // 중분류 정보를 담을 배열 초기화
            let uniqueMediumChapters = [];
            
            // 현재 대분류에 해당하는 중분류별로 순회
            data.body.itemList.forEach(subItem => {
              if (subItem.largeChapterName === item.largeChapterName && !uniqueMediumChapters.includes(subItem.mediumChapterName)) {
                // 현재 중분류가 이전에 처리된 적이 없는 경우
                uniqueMediumChapters.push(subItem.mediumChapterName); // 중분류 배열에 추가
                html += `<li>${subItem.mediumChapterName}`; // 중분류 정보를 HTML에 추가
                
                // 소분류 정보를 담을 배열 초기화
                let uniqueSmallChapters = [];
                
                // 현재 대분류와 중분류에 해당하는 소분류별로 순회
                data.body.itemList.forEach(innerItem => {
                  if (innerItem.largeChapterName === item.largeChapterName && innerItem.mediumChapterName === subItem.mediumChapterName &&
                    !uniqueSmallChapters.includes(innerItem.smallChapterName)) {
                    // 현재 소분류가 이전에 처리된 적이 없는 경우
                    uniqueSmallChapters.push(innerItem.smallChapterName); // 소분류 배열에 추가
                    html += `<span>${innerItem.smallChapterName}</span>`; // 소분류 정보를 HTML에 추가
                  }
                });
                
                html += `</li>`; // 중분류 닫는 태그 추가
              }
            });
            
            html += `</ul>`; // 대분류 닫는 태그 추가
          }
        });
        
        /* 기존 코드
         
         for (let l = 0; l < lChapterG.length; l++) { // 대분류 반복
             let lChapter = lChapterG[l]; // 현재 대분류 정보
             let mChapterG = lChapter.children; // 현재 대분류의 하위 중분류 정보 추출
             html += '<ul>' + lChapter.text; // 대분류 정보를 ul 태그로 추가
             for (let m = 0; m < mChapterG.length; m++) { // 중분류 반복
                 let mChapter = mChapterG[m]; // 현재 중분류 정보
                 let sChapterG = mChapter.children; // 현재 중분류의 하위 소분류 정보 추출
                 html += '<li>' + mChapter.text; // 중분류 정보를 li 태그로 추가
                 for (let s = 0; s < sChapterG.length; s++) { // 소분류 반복
                     let sChapter = sChapterG[s]; // 현재 소분류 정보
                     html += '<span>' + sChapter.text + '</span>'; // 소분류 정보를 span 태그로 추가
                 }
                 html += '</li>'; // 중분류 닫는 태그 추가
             }
             html += '</ul>'; // 대분류 닫는 태그 추가
         }
         
         */
        $('html , body').css('overflow', 'hidden'); // HTML과 body 요소의 overflow 속성을 hidden으로 설정하여 스크롤을 막음
        $('.dim').fadeIn(); // 어둡게 만드는 효과를 가진 요소 표시
        $("#scope-list").empty(); // #scope-list 요소 비우기
        $(html).prependTo($("#scope-list")); // 생성된 HTML을 #scope-list 요소의 맨 앞에 추가
        $(".pop-wrap[data-pop=que-scope-pop]").show(); // "que-scope-pop" 클래스를 가진 팝업 표시
      }
    });
  });
  
  
  //오류신고 팝업 세팅
  $("#view-que-detail-list, #item-delete-area, #item-similar-area").on("click", ".btn-error", function () {
    let _this = $(this);
    $("#question-id-error").val(_this.parents(".que-top").find("#questionId").val());
    popFunc_openErrorReport();
  });
  
  //오류신고 팝업 > 파일첨부 버튼
  $("#btn-upload-error").on("click", function () {
    $("#file-error").click();
  });
  
  //오류신고 팝업 > 오류유형 선택
  $("#select-error-list li").on("click", function () {
    $("#btn-select-error").text($(this).find("a").text());
    $("#hidden-type").val($(this).prop("id"));
    $("#btn-select-error").removeClass("active");
    $("#select-error-list").css("display", "none");
  });
  
  //오류신고 팝업 > 글자수 제한
  $("#txt-error-area").on("keyup", function () {
    let content = $(this).val();
    if (content.length > 200) {
      alert("최대 200자까지 입력 가능합니다.");
      $(this).val(content.substring(0, 200));
    }
  });
  
  //오류신고 팝업 > 신고하기
  $("#btn-report-error").on("click", function () {
    
    if ($("#txt-error-area").val().trim() === "") {
      alert("오류 내용을 입력해주세요.");
      return false;
    }
    
    let hasFile = $("#file-error").val() !== "";
    if (hasFile) {
      //파일 확장자 체크
      let ext = $("#error-file-name").val().split('.').pop().toLowerCase();
      if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'hwp']) == -1) {
        alert('jpg,jpeg,png,hwp 파일만 업로드 할수 있습니다.');
        return;
      }
      
      //파일 용량 체크
      let maxSize = 100 * 1024 * 1024; // 100MB
      let fileSize = $("#file-error")[0].files[0].size;
      if (fileSize > maxSize) {
        alert("업로드할 수 있는 파일의 용량을 초과하였습니다.(최대100MB)");
        $("#file-error").val("");
        return;
      }
    }
    
    let params = new FormData();
    params.append('questionId', $("#pop-error-report #question-id-error").val());
    if (hasFile) params.append('file', $("#file-error")[0].files[0]);
    params.append('type', $("#hidden-type").val());
    params.append('content', $("#txt-error-area").val());
    params.append('subjectName', $("#subjectName").val());
    
    $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url: '/customExam/reportError',
      data: params,
      async: true,
      cache: false,
      contentType: false,
      processData: false,
      success: function (data) {
        if (data.resultValue === 'error') {
          alert(data.msg);
          return false;
          
        } else if (data.resultValue === 'success') {
          alert("신고처리가 완료되었습니다.");
          closePop("error-report-pop");
          
        }/*else if(data.resultValue === 'errorSession') {
                    location.href = "/errorSession";
                }*/
      },
      error: function (jqXHR, status, error) {
        alert('업로드에 실패했습니다.');
      }
    });
    
  });
  
});

//오류신고 팝업 > 파일명 가져오기
function changeFile(obj) {
  let fileSplit = obj.value.split("\\");
  $("#error-file-name").val(fileSplit[fileSplit.length - 1]);
}

//팝업닫기
function closePop(pop, className) {
  let dimClass = className === undefined ? "dim" : className;
  $(".pop-wrap[data-pop=" + pop + "]").hide();
  
  $('.' + dimClass).fadeOut();
  // if (pop != "wrong-pop" ) {
  $('html , body').css('overflow', 'auto');
  // }
}

//오류신고 팝업 초기화
function popFunc_openErrorReport() {
  $(".pop-wrap[data-pop=error-report-pop] #hidden-type").val("q_error");
  $(".pop-wrap[data-pop=error-report-pop] #btn-select-error").text("문제오류");
  $(".pop-wrap[data-pop=error-report-pop] #file-error").val("");
  $(".pop-wrap[data-pop=error-report-pop] #error-file-name").val("");
  $(".pop-wrap[data-pop=error-report-pop] #txt-error-area").val("");
  $('html , body').css('overflow', 'hidden');
  $('.dim').fadeIn();
  $(".pop-wrap[data-pop=error-report-pop]").show();
}

//문제,정답,해설 조건 변경
function changeView(type) {
  if (type === 'type1') { //문제만
    $("#view-que-detail-list .explain-area").hide();
    $("#item-similar-area .explain-area").hide();
    $("#item-delete-area .explain-area").hide();
    
    $("#view-que-detail-list .answer-area").hide();
    $("#item-similar-area .answer-area").hide();
    $("#item-delete-area .answer-area").hide();
  } else if (type === 'type2') { //문제+정답
    $("#view-que-detail-list .explain-area").hide();
    $("#item-similar-area .explain-area").hide();
    $("#item-delete-area .explain-area").hide();
    
    $("#view-que-detail-list .answer-area").show();
    $("#item-similar-area .answer-area").show();
    $("#item-delete-area .answer-area").show();
  } else if (type === 'type3') { //문제+해설+정답
    $("#view-que-detail-list .explain-area").show();
    $("#item-similar-area .explain-area").show();
    $("#item-delete-area .explain-area").show();
    
    $("#view-que-detail-list .answer-area").show();
    $("#item-similar-area .answer-area").show();
    $("#item-delete-area .answer-area").show();
  }
}

// 화면 정렬
function sortQue(target, sortType, moveSortNum) {
  if (target === "detail") {
    if (sortType === "number") {
      //그룹 정렬
      $("#view-que-detail-list .sort-group").sort(function (a, b) {
        let aVal = Number(a.getAttribute("data-sortNum"));
        let bVal = Number(b.getAttribute("data-sortNum"));
        return aVal < bVal ? -1 : aVal > bVal ? 1 : 0;
      }).appendTo($("#view-que-detail-list"));
      
      //지문 내 순서 정렬
      if (moveSortNum !== 'undefined' || moveSortNum !== null || moveSortNum !== "") {
        $("#view-que-detail-list .sort-group").eq(moveSortNum).find(".item-box").sort(function (a, b) {
          let aVal = Number(a.querySelector(".num").innerText);
          let bVal = Number(b.querySelector(".num").innerText);
          return aVal < bVal ? -1 : aVal > bVal ? 1 : 0;
        }).appendTo($(".sort-group").eq(moveSortNum));
      }
    } else {
      if (sortType === "unit") {
        //지문 내 순서 정렬
        $("#view-que-detail-list .sort-group").each(function (i) {
          $(this).find(".item-box").sort(function (a, b) {
            let aVal = a.querySelector(".que-top #chapterGp").value;
            let bVal = b.querySelector(".que-top #chapterGp").value;
            return aVal < bVal ? -1 : aVal > bVal ? 1 : 0;
          }).appendTo($(this));
          
          let sortValue = $(this).find(".que-top #chapterGp").val();
          $(this).attr("data-sortValue", sortValue);
          console.log("onload sortValue", sortValue)
        })
      } else if (sortType === "level") {
        //지문 내 순서 정렬
        $("#view-que-detail-list .sort-group").each(function (i) {
          $(this).find(".item-box").sort(function (a, b) {
            let aVal = a.querySelector(".que-top #difficultyCode").value;
            let bVal = b.querySelector(".que-top #difficultyCode").value;
            return aVal < bVal ? -1 : aVal > bVal ? 1 : 0;
          }).appendTo($(this));
          
          let sortValue = $(this).find(".que-top #difficultyCode").val();
          $(this).attr("data-sortValue", sortValue);
        })
        
      } else if (sortType === "type") {
        //지문 내 순서 정렬
        $("#view-que-detail-list .sort-group").each(function (i) {
          $(this).find(".item-box").sort(function (a, b) {
            let aVal = Number(a.querySelector(".que-top #questionFormCode").value);
            let bVal = Number(b.querySelector(".que-top #questionFormCode").value);
            return aVal < bVal ? -1 : aVal > bVal ? 1 : 0;
          }).appendTo($(this));
          
          let sortValue = $(this).find(".que-top #questionFormCode").val();
          $(this).attr("data-sortValue", sortValue);
        })
      }
      
      //그룹 정렬
      $("#view-que-detail-list .sort-group").sort(function (a, b) {
        let aVal = a.getAttribute("data-sortValue");
        let bVal = b.getAttribute("data-sortValue");
        return aVal < bVal ? -1 : aVal > bVal ? 1 : 0;
      }).appendTo($("#view-que-detail-list"));
      
      setSortNum(target);
      
      
    }
    
  } else if (target === "summary") {
    if (sortType === "number") {
      $(".summary-box").sort(function (a, b) {
        let aVal = Number(a.getAttribute("data-sortSummary"));
        let bVal = Number(b.getAttribute("data-sortSummary"));
        return aVal < bVal ? -1 : aVal > bVal ? 1 : 0;
      }).appendTo($("#table-1"));
      console.log("헬로우")
      //지문 내 순서 정렬
      $(".summary-box").each(function (i) {
        $(this).find(".col.que").sort(function (a, b) {
          let aVal = Number(a.querySelector("a .summary-num").textContent);
          let bVal = Number(b.querySelector("a .summary-num").textContent);
          return aVal < bVal ? -1 : aVal > bVal ? 1 : 0;
        }).appendTo($(this).children('.passage-table'));
      })
    }
  }
  console.log("sortType == ", sortType);
}

// 문항 번호 세팅
function setSortNum(target, moveSortNum) {
  if (target === "detail") { // 문제지 요약
    let numArr = [];
    let numGroupArr = [];
    let cnt = 0
    
    // 문항 정렬 번호
    $("#view-que-detail-list .item-box").each(function (i) {
      let beforeNum = $(this).children(".que-top").find(".num").text();
      numArr.push(beforeNum);
      cnt++;
      $(this).children(".que-top").find(".num").text(cnt);
    });
    
    // 그룹 정렬 번호
    $("#view-que-detail-list .sort-group").each(function (i) {
      let beforeGroupNum = $(this).attr("data-sortNum");
      numGroupArr.push(beforeGroupNum);
      $(this).attr("data-sortNum", i);
    });
    
    setPassageNum($("#view-que-detail-list .passage-box"));
    setNewNum("summary", numArr, numGroupArr);
    
  } else if (target === "summary") { // 문제지 요약
    let numArr = [];
    let numGroupArr = [];
    let cnt = 0
    // 문항 번호
    $(".col.que").each(function (i) {
      let beforeNum = $(this).find("a .summary-num").text();
      numArr.push(beforeNum);
      cnt++;
      $(this).find("a .summary-num").text(cnt);
    });
    
    // 그룹 정렬 번호
    $(".summary-box").each(function (i) {
      let beforeGroupNum = $(this).attr("data-sortSummary");
      numGroupArr.push(beforeGroupNum);
      $(this).attr("data-sortSummary", i);
    });
    
    setNewNum("detail", numArr, numGroupArr, moveSortNum);
    setPassageNum($("#view-que-detail-list .passage-box"));
    
  } else if (target === "similar") { // 유사문제
    let cnt = 0
    $("#item-similar-area .item-box").each(function (i) {
      if ($(this).parent(".sort-group").css("display") !== "none") {
        cnt++;
        $(this).children(".que-top").find(".num").text(cnt);
      }
    });
    setPassageNum($("#item-similar-area .passage-box"));
    
  } else if (target === "delete") { // 삭제 문항
    let cnt = 0;
    $("#item-delete-area .item-box").each(function (i) {
      cnt++;
      $(this).children(".que-top").find(".num").text(cnt);
    });
    setPassageNum($("#item-delete-area .passage-box"));
  }
}

// 정렬 동기화(문제목록<->요약)
function setNewNum(target, numArr, numGroupArr, moveSortNum) {
  if (target === "detail") {
    // 문제목록:문항 번호
    $("#view-que-detail-list .item-box").each(function (i) {
      let index = numArr.indexOf($(this).children(".que-top").find(".num").text());
      $(this).children(".que-top").find(".num").text(index + 1);
    })
    // 문제목록 : 그릅 정렬 번호
    $("#view-que-detail-list .sort-group").each(function (i) {
      let index = numGroupArr.indexOf($(this).attr("data-sortNum"));
      $(this).attr("data-sortNum", index);
    });
    sortQue(target, "number", moveSortNum);
    $("#select-sort-btn").text("사용자 정렬");
    
  } else if (target === "summary") {
    // 요약 : 문항 번호
    $("#table-1 .col").each(function (i) {
      let index = numArr.indexOf($(this).find("a .summary-num").text());
      $(this).find("a .summary-num").text(index + 1);
    });
    
    // 요약 : 그룹 정렬 번호
    $(".summary-box").each(function (i) {
      let index = numGroupArr.indexOf($(this).attr("data-sortSummary"));
      $(this).attr("data-sortSummary", index);
    });
    
    sortQue(target, "number");
  }
}

// 문제형태 변환
function filterFormType(type) {
  let typeNum = Number(type);
  if (typeNum >= 10 && typeNum <= 50) {
    return "multiple"
  } else if (typeNum >= 60 && typeNum <= 99) {
    return "subjective"
  }
  
  /*else if (typeNum == 60 || typeNum == 61) {
      return "subjective"
  } else {
      return "descriptive"
  }*/
}

// 하단영역 > 난이도별 개수 설정
function countBadgeLevel(id, num) {
  let levelCnt = $(".view-bottom #level-" + id).text() === "" ? 0 : Number($(".view-bottom #level-" + id).text());
  $(".view-bottom #badge-level-" + id).css("display", levelCnt + num === 0 ? "none" : "");
  $(".view-bottom #level-" + id).text(levelCnt + num);
  
  let level1 = parseInt($("#level-1").text()) || 0;
  let level2 = parseInt($("#level-2").text()) || 0;
  let level3 = parseInt($("#level-3").text()) || 0;
  let level4 = parseInt($("#level-4").text()) || 0;
  let level5 = parseInt($("#level-5").text()) || 0;
  let totalNumber = level1 + level2 + level3 + level4 + level5;
  
  $(".total-num span").text(totalNumber);
}

// 하단영역 > 문제형태별 개수 설정
function countBadgeFormType(id, num) {
  let formTypeCnt = $(".view-bottom #num-" + id).text() === "" ? 0 : Number($(".view-bottom #num-" + id).text());
  $(".view-bottom #badge-form-" + id).css("display", formTypeCnt + num === 0 ? "none" : "");
  $(".view-bottom #num-" + id).text(formTypeCnt + num);
}

// 유사문제 탭 > 난이도 검색 결과
function filterSimilar(filterType) {
  let similarCnt = $("#item-similar-area .sort-group").length;
  $("#item-similar-area").removeClass("no-data");
  $("#similar-no").remove();
  
  
  if (filterType === "") {
    $("#item-similar-area .sort-group").css("display", "");
    $("#item-similar-area .sort-group .item-box").css("display", "");
  } else {
    $("#item-similar-area .sort-group").each(function (e) {
      // 문항 난이도 일치 확인
      let hasFilterType = false;
      
      // 문항 난이도 일치 체크
      $(this).find('.item-box').each(function () {
        // Check if the question has the specified filterType
        if ($(this).find('input[id=difficultyCode][value=' + filterType + ']').length > 0) {
          hasFilterType = true;
          // 문항 난이도 일치하면 남김
          $(this).css("display", "");
        } else {
          // 문항 난이도 불일치 숨김
          $(this).css("display", "none");
        }
      });
      
      // 1개 이상 보여지는 문항이 있으면 노출처리
      if (filterType !== "" && hasFilterType) {
        $(this).css("display", "");
      } else {
        $(this).css("display", "none");
      }
    });
  }
  setSortNum("similar");
  
  if (similarCnt === $("#item-similar-area ").find(".sort-group:hidden").length) {
    $("#item-similar-area").addClass("no-data");
    $("#item-similar-area").append("<p id='similar-no'>해당 난이도의 유사 문제는 존재하지 않습니다.</p>");
  }
  
}

//탭 -> 문제목록 - 객체 내용 설정
function convertToLeft(target) {
  let btnDelHtml = "<button type=\"button\" class=\"btn-delete\"></button>";
  let btnSimilarHtml = "<button type=\"button\" class=\"btn-similar-que btn-default\" ><i class=\"similar\"></i> 유사 문제</button>";
  
  // 삭제 버튼
  target.find(".que-top .btn-wrap").append(btnDelHtml);
  target.find(".passage-box .btn-delete").attr("data-type", "all");
  // 유사문항 버튼(문항에만 추가)
  target.find(".passage-box .btn-add").remove();
  target.find(".btn-add").not(".passage-box .btn-add").replaceWith(btnSimilarHtml);
  
  return target;
}

//문제목록 -> 삭제 문항 - 객체 내용 설정
function convertToRigth(target) {
  let btnAddHtml = "<button type=\"button\" class=\"btn-default btn-add\" data-type=\"\"><i class=\"add-type02\"></i>추가</button>";
  let btnAllAddHtml = "<button type=\"button\" class=\"btn-default btn-add\" data-type=\"all\"><i class=\"add-type02\"></i>전체 추가</button>";
  
  target.find(".btn-delete").remove();
  target.find(".btn-similar-que").remove();
  
  target.find(".etc-btn-wrap").html(btnAddHtml);
  target.find(".passage-box .etc-btn-wrap").html(btnAllAddHtml);
  
  return target;
}

//문제지 요약 생성
function makeSummary(target, sortNum, type) {
  let html = '';
  let _beforeSort = sortNum - 1;
  
  // 지문
  if (target.hasClass("passage-view-que-box")) {
    html += `
            <div class="depth-01 summary-box ui-sortable" data-sortSummary=${sortNum}>
                <div class="dragHandle ui-sortable-handle drag-type02"><img src="/resource/popup/img/ico_move_type01.png" alt=""></div>
                <div class="col-group passage-table">
        `;
    
    target.find(".item-box").each(function (i) {
      html += `
                <div class="col depth-02 que">
                  <a href="javascript:;">
                    ${target.find(".item-box").length !== 1 ? '<span class="dragHandle ui-sortable-handle drag-type01"><img src="/resource/popup/img/ico_move_type02.png" alt=""></span>' : '<span></span>'}
                    <span class="summary-num">${$(this).find(".num").text()}</span>
                    <span class="tit" title="${$(this).find(".chapter").text()}">
                      <div class="txt">${$(this).find(".chapter").text()}</div>
                      <div class="tooltip-wrap">
                        ${$(this).attr("data-paperTitle") !== "" ? '<button type="button" class="btn-tip" style="position: relative; top: 1px; width: 14px; height: 16px; margin-left: 15px; background: url(https://testbank.tsherpa.co.kr/images/common/ico_btn_tip.png) no-repeat; background-size: contain; display: none"></button>' : ''}
                        ${$(this).attr("data-paperTitle") !== "" ? '<div class="tooltip type01"><div class="tool-type01">' + $(this).attr("data-paperTitle") + '</div></div>' : ''}
                      </div>
                    </span>
                    <span>${getQuestionType($(this).find("#questionFormCode").val())}</span>
                    <span><span class="que-badge">${$(this).find(".que-badge-group .que-badge").eq(0).text()}</span></span>
                  </a>
                </div>
            `;
    });
    
    html += '</div></div>';
    
    // 문항만 있는 경우
  } else {
    html += `
            <div class="col que summary-box" data-sortSummary=${sortNum}>
                <a href="javascript:;">
                    <span class="dragHandle ui-sortable-handle"><img src="/resource/popup/img/ico_move_type01.png" alt=""></span>
                    <span></span>
                    <span class="summary-num">${target.find(".num").text()}</span>
                    <span class="tit" title="${target.find(".chapter").text()}">
                        <div class="txt">${target.find(".chapter").text()}</div>
                        <div class="tooltip-wrap">
                            ${target.find(".item-box").attr("data-paperTitle") !== "" ? '<button type="button" class="btn-tip" style="position: relative; top: 1px; width: 14px; height: 16px; margin-left: 15px; background: url(../../images/common/ico_btn_tip.png) no-repeat; background-size: contain;"></button>' : ''}
                            ${target.find(".item-box").attr("data-paperTitle") !== "" ? '<div class="tooltip type01"><div class="tool-type01">' + target.find(".item-box").attr("data-paperTitle") + '</div></div>' : ''}
                        </div>
                    </span>
                    <span>${getQuestionType($(this).find("#questionFormCode").val())}</span>
                    <span><span class="que-badge">${target.find(".que-badge-group .que-badge").eq(0).text()}</span></span>
                </a>
            </div>
        `;
  }
  
  if (type === 'add') {
    $("#content-summary-area #table-1").append($(html));
    
  } else if (type === 'delete') {
    $("#content-summary-area #table-1").append($(html));
  }
  // 넘버링
  let _cnt = 0;
  
  $(".col.que").each(function (i) {
    _cnt++;
    $(this).find("a .summary-num").text(_cnt);
  });
  
  $(".summary-box").each(function (i) {
    $(this).attr("data-sortSummary", i);
  });
  
}


// 지문 번호 설정
function setPassageNum(passageBox) {
  passageBox.each(function (i) {
    let item = $(this).closest(".sort-group").children(".item-box");
    let passage = $(this).closest(".sort-group").children(".passage-box");
    let tmpText = item.first().find(".num").text();
    // console.log("tmpText == ",tmpText);
    // let tmpText = [2,3];
    
    
    if (item.length > 1) {
      tmpText += ' ~ ' + item.last().find(".num").text();
    }
    $(this).find(".num").text(tmpText);
    // console.log("setPassageNum,item == ",item);
    // 지문문항에 문항 1개만 있으면 전체추가, 삭제 버튼 제거
    let isSingleItem = item.length === 1;
    passage.find(".btn-add[data-type=all]").toggle(!isSingleItem);
    passage.find(".btn-delete[data-type=all]").toggle(!isSingleItem);
  });
  
}

// 문항 번호 설정
function setItemNum() {
  $('#view-que-detail-list .item-box').each(function (i) {
    $(this).find(".num").text((i + 1));
  });
  
  $('.summary-num').each(function (i) {
    $(this).text((i + 1));
  });
  
}

// 유사문제 조건 초기화
function clearSimilarCondition() {
  $("#item-similar-area").removeClass("no-data");
  $("#similar-level-btn").text("난이도 전체");
  $("#similar-level-btn").val("");
  $("#similar-level-btn").removeClass("active");
  $("#similar-level-list").css("display", "none");
}

// 난이도에 따른 색상 클래스를 반환하는 함수
function getColorClass(difficultyCode) {
  switch (difficultyCode) {
    case '01':
      return 'oceanblue';
    case '02':
      return 'purple';
    case '03':
      return 'green';
    case '04':
      return 'yellow';
    default:
      return 'pink';
  }
}

// 문제 형식에 따른 텍스트를 반환하는 함수
function getQuestionType(questionFormCode) {
  if (questionFormCode >= '10' && questionFormCode <= '50') {
    return '객관식';
  } else if (questionFormCode >= '60' && questionFormCode <= '99') {
    return '주관식';
  } else {
    return ''; // 다른 형식이 있다면 여기에 추가
  }
}
