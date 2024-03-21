<%--
  User: 이양진
  Date: 2024-03-07
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/common/headerA.jsp"/>

<!-- 즐겨찾는 교과서 -->
<%--<div class="tb-container tb-bookmark" style="" id="tb-bookmark">
  <form
          method="get"
          id="bookmarkListForm"
          action="https://mh.tsherpa.co.kr/testbank/bookmark_data.html"
          onsubmit="return false;"
  ></form>
  <h2 class="tb-container__header">즐겨찾는 교과서</h2>
  <div class="tb-container__body">
    <div class="columns" id="divBookmarkList">
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  onclick="delBookmark('M-testBank-math_01_01', 605534);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
        </div>
        <div class="item-content">
          <!-- 썸네일 -->
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/중학_수학1_이준열.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">수학 1 (이준열)</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1159');"
                      title="새창 열림"
                      class="button"
              ><i class="icon icon-memo-center"></i>시험지
                만들기</a
              >
              <a
                      href="javascript:;"
                      onclick="getExam(605534);"
                      title="다운로드"
                      class="button"
              ><i class="icon icon-download"></i>평가자료
                다운</a
              >
            </div>
          </div>
        </div>
      </div>
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  onclick="delBookmark('M-testBank-ko_01_06', 605850);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
        </div>
        <div class="item-content">
          <!-- 썸네일 -->
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/(15개정)(노)중학_국어3-2_교과서.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 3-2 (노미숙)</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1159');"
                      title="새창 열림"
                      class="button"
              ><i class="icon icon-memo-center"></i>시험지
                만들기</a
              >
              <a
                      href="javascript:;"
                      onclick="getExam(605850);"
                      title="다운로드"
                      class="button"
              ><i class="icon icon-download"></i>평가자료
                다운</a
              >
            </div>
          </div>
        </div>
      </div>
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  onclick="delBookmark('M-testBank-eng_01_02', 605684);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
        </div>
        <div class="item-content">
          <!-- 썸네일 -->
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-EE-EE-03-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">영어 2 (이재영)</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1161');"
                      title="새창 열림"
                      class="button"
              ><i class="icon icon-memo-center"></i>시험지
                만들기</a
              >
              <a
                      href="javascript:;"
                      onclick="getExam(605684);"
                      title="다운로드"
                      class="button"
              ><i class="icon icon-download"></i>평가자료
                다운</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>--%>
<!-- //즐겨찾는 교과서 -->

<!-- 평가자료 다운 팝업 -->
<div
        class="modal fade"
        tabindex="-1"
        role="dialog"
        id="subjectPopup"
        aria-modal="true"
>
  <form
          method="get"
          id="examDataListForm"
          action="https://mh.tsherpa.co.kr/testbank/exam_data.html"
          onsubmit="return false;"
  >
    <input
            type="hidden"
            id="examCateId"
            name="examCateId"
            value=""
    />
  </form>
  <div
          class="modal-dialog-centered modal-dialog modal-lg"
          role="document"
  >
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-title">평가자료 다운로드</div>
        <a class="close" data-dismiss="modal" aria-label="Close">
          <img
                  src="/resource/midhigh/img/common/btn-close-big-white.png"
                  alt="닫기버튼"
                  aria-hidden="true"
          />
        </a>
      </div>
      <div class="modal-body evalData_download-popup">
        <div class="category-line">
          <p class="loc">
            <span id="sp_lTitle"></span>
            <span id="sp_mTitle"></span>
            <span id="sp_sTitle"></span>
          </p>
        </div>
        <div class="inner">
          <div class="pop_title">
            <p>총<span id="sp_totalCnt">0</span>개</p>
            <a
                    href="javascript:;"
                    onclick="checkContentAll()"
                    class="btn btn-gray"
            ><span class="name">전체 선택</span></a
            >
          </div>
          <div class="table_wrapper">
            <table class="table text-align-center flat-row">
              <colgroup>
                <col style="width: 60px"/>
                <col style="width: 73px"/>
                <col style="width: auto"/>
                <col style="width: 140px"/>
              </colgroup>
              <tbody id="examList"></tbody>
            </table>
          </div>
          <div class="bot_btncase mt20">
            <p>
              선택한 학습자료<span id="sp_examData">0</span>개
            </p>
            <a
                    href="javascript:;"
                    onclick="allDownload()"
                    class="btn btn-gray"
            ><span class="name">다운로드</span></a
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 평가자료 다운 팝업 -->

<!-- 교과서 목록 (국어/노미숙) -->
<div class="tb-container tb-list tb-0">
  <h2 class="tb-container__header">노미숙</h2>
  <div class="tb-container__body">
    <div class="columns">
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-KK-KK-02-03.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 1-1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1154');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611501"
                  onclick="delBookmark('M-testBank-ko_01_02', 611501);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611501"
                  onclick="addBookmark('M-testBank-ko_01_02','Y', 611501);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-KK-KK-02-04.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 1-2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1155');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611501');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611502"
                  onclick="delBookmark('M-testBank-ko_01_03', 611502);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611502"
                  onclick="addBookmark('M-testBank-ko_01_03','Y', 611502);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/15개정_(중)국어(노미숙)_2-1.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 2-1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1156');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611502');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611503"
                  onclick="delBookmark('M-testBank-ko_01_04', 611503);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611503"
                  onclick="addBookmark('M-testBank-ko_01_04','Y', 611503);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/15개정_(중)국어(노미숙)_2-2.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 2-2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1157');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611503');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611504"
                  onclick="delBookmark('M-testBank-ko_01_05', 611504);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611504"
                  onclick="addBookmark('M-testBank-ko_01_05','Y', 611504);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/중%20국어%203-1.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 3-1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1158');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611504');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  id="add_611505"
                  onclick="delBookmark('M-testBank-ko_01_06', 611505);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  style="display: none"
                  id="del_611505"
                  onclick="addBookmark('M-testBank-ko_01_06','Y', 611505);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/(15개정)(노)중학_국어3-2_교과서.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 3-2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1159');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611505');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->
<!-- 교과서 목록 (국어/박영목) -->
<div class="tb-container tb-list tb-0">
  <h2 class="tb-container__header">박영목</h2>
  <div class="tb-container__body">
    <div class="columns">
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611506"
                  onclick="delBookmark('M-testBank-ko_02_01', 611506);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611506"
                  onclick="addBookmark('M-testBank-ko_02_01','Y', 611506);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-KK-KK-03-01.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 1-1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1198');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611506');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611507"
                  onclick="delBookmark('M-testBank-ko_02_02', 611507);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611507"
                  onclick="addBookmark('M-testBank-ko_02_02','Y', 611507);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-KK-KK-03-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 1-2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1199');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611507');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611508"
                  onclick="delBookmark('M-testBank-ko_02_03', 611508);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611508"
                  onclick="addBookmark('M-testBank-ko_02_03','Y', 611508);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-KK-KK-03-03.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 2-1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1200');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611508');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611509"
                  onclick="delBookmark('M-testBank-ko_02_04', 611509);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611509"
                  onclick="addBookmark('M-testBank-ko_02_04','Y', 611509);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/15개정_(중)국어2-2(박영목)교과서.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 2-2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1201');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611509');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611510"
                  onclick="delBookmark('M-testBank-ko_02_05', 611510);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611510"
                  onclick="addBookmark('M-testBank-ko_02_05','Y', 611510);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-KK-KK-03-05.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 3-1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1202');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611510');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611511"
                  onclick="delBookmark('M-testBank-ko_02_06', 611511);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611511"
                  onclick="addBookmark('M-testBank-ko_02_06','Y', 611511);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/15개정(중)국어3-2(박영목)교과서표1(4).jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">국어 3-2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1203');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611511');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<!-- 교과서 목록 (영어/이재영) -->
<div class="tb-container tb-list tb-1" style="display: none">
  <h2 class="tb-container__header">이재영</h2>
  <div class="tb-container__body">
    <div class="columns">
      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-EE-EE-03-01.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">영어 1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1160');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611501"
                  onclick="delBookmark('M-testBank-ko_01_02', 611501);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611501"
                  onclick="addBookmark('M-testBank-ko_01_02','Y', 611501);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-EE-EE-03-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">영어 2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1161');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611501');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611502"
                  onclick="delBookmark('M-testBank-ko_01_03', 611502);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611502"
                  onclick="addBookmark('M-testBank-ko_01_03','Y', 611502);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-EE-EE-03-03.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">영어 3</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1162');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611502');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<!-- 교과서 목록 (영어/정사열) -->
<div class="tb-container tb-list tb-1" style="display: none">
  <h2 class="tb-container__header">정사열</h2>
  <div class="tb-container__body">
    <div class="columns">

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-EE-EE-06-01.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">영어 1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1163');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611501"
                  onclick="delBookmark('M-testBank-ko_01_02', 611501);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611501"
                  onclick="addBookmark('M-testBank-ko_01_02','Y', 611501);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-EE-EE-06-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">영어 2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1164');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611501');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
      <!-- item -->

      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611502"
                  onclick="delBookmark('M-testBank-ko_01_03', 611502);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611502"
                  onclick="addBookmark('M-testBank-ko_01_03','Y', 611502);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-EE-EE-06-03.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">영어 3</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1165');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611502');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<!-- 교과서 목록 (수학/이준열) -->
<div class="tb-container tb-list tb-2" style="display: none">
  <h2 class="tb-container__header">이준열</h2>
  <div class="tb-container__body">
    <div class="columns">

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-MM-MM-03-01.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">수학 1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1139');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-MM-MM-03-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">수학 2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1140');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-MM-MM-03-03.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">수학 3</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1141');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->


    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<!-- 교과서 목록 (수학/류희찬) -->
<div class="tb-container tb-list tb-2" style="display: none">
  <h2 class="tb-container__header">류희찬</h2>
  <div class="tb-container__body">
    <div class="columns">
      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-MM-MM-06-01.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">수학 1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1136');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-MM-MM-06-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">수학 2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1137');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-MM-MM-06-03.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">수학 3</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1138');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<!-- 교과서 목록 (사회/구정화) -->
<div class="tb-container tb-list tb-3" style="display: none">
  <h2 class="tb-container__header">구정화</h2>
  <div class="tb-container__body">
    <div class="columns">
      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-SS-SS-03-01.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">사회&#9312;</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1166');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-SS-SS-03-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">사회&#9313;</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1167');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<!-- 교과서 목록 (사회/박형준) -->
<div class="tb-container tb-list tb-3" style="display: none">
  <h2 class="tb-container__header">박형준</h2>
  <div class="tb-container__body">
    <div class="columns">
      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-SS-SS-06-01.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">사회&#9312;</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1168');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-SS-SS-06-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">사회&#9313;</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1169');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<!-- 교과서 목록 (역사/김덕수) -->
<div class="tb-container tb-list tb-4" style="display: none">
  <h2 class="tb-container__header">김덕수</h2>
  <div class="tb-container__body">
    <div class="columns">
      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-SS-SM-02-01.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">역사&#9312;</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1170');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-SS-SM-02-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">역사&#9313;</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1171');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<!-- 교과서 목록 (도덕/변순용) -->
<div class="tb-container tb-list tb-5" style="display: none">
  <h2 class="tb-container__header">변순용</h2>
  <div class="tb-container__body">
    <div class="columns">
      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/정본 15개정(중)도덕1(변순용).jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">도덕&#9312;</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1172');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/정본%2015개정(중)도덕2(변순용).jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">도덕&#9313;</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1173');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<!-- 교과서 목록 (과학/노태희) -->
<div class="tb-container tb-list tb-6" style="display: none">
  <h2 class="tb-container__header">노태희</h2>
  <div class="tb-container__body">
    <div class="columns">
      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-NN-NN-04-01.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">과학 1</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1174');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-NN-NN-04-02.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">과학 2</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1175');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->

      <!-- item -->
      <div class="item">
        <div class="item-mark">
          <a
                  href="javascript:;"
                  style="display: none"
                  id="add_611500"
                  onclick="delBookmark('M-testBank-ko_01_01', 611500);"
                  class="tooltip-mark add-bookmark"
          ><span class="ir_su">즐겨찾기 삭제</span></a
          >
          <a
                  href="javascript:;"
                  id="del_611500"
                  onclick="addBookmark('M-testBank-ko_01_01','Y', 611500);"
                  class="tooltip-mark"
          ><span class="ir_su">즐겨찾기 등록</span></a
          >
        </div>
        <div class="item-content">
          <div class="item-image">
            <figure class="image is-thumnail">
              <img
                      src="/resource/midhigh/img/booklist/A8-C2-NN-NN-04-03.jpg"
                      alt="교과서 이미지"
              />
            </figure>
          </div>
          <div class="item-info">
            <p class="data_title">과학 3</p>
            <div class="data_buttons">
              <a
                      href="javascript:;"
                      onclick="customExamPopup('1176');"
                      title="새창 열림"
                      class="button"
              >
                <i class="icon icon-memo-center"></i>시험지 만들기
              </a>
              <a
                      href="javascript:getExam('611500');"
                      title="다운로드"
                      class="button"
              >
                <i class="icon icon-download"></i> 평가자료 다운
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- // item -->
    </div>
  </div>
</div>
<!-- // 교과서 목록 -->

<script>
  $(function () {
    getBookmark();
    setExamBank();
  });

  function setExamBank() {
    const btnExamBank = document.getElementById("btn-examBank");
    const btnStorage = document.getElementById("btn-storage");
    const linkExamBank = btnExamBank.querySelector('a');
    const linkStorage = btnStorage.querySelector('a');

    linkExamBank.classList.add("tabs__link--on");
    linkStorage.classList.remove("tabs__link--on");

    $(".tabs__list--4").show();
  }

  function downloadContents(ids) {
    if (!checkUserLoggedIn(location.href)) {
      return false;
    }
    if (ids.length === 0 || ids === undefined) {
      alert("선택한 항목이 없습니다.");
      return false;
    }
    openHiddenFrame("/common/download_files.html?ids=" + ids);
  }

  function checkContentAll() {
    let list = $("input[name=examData]:checked");
    let checkCnt = 0;
    if (list.length > 0) {
      $("input:checkbox[name=examData]").each(function () {
        $(this).prop("checked", false);
      });
    } else {
      $("input:checkbox[name=examData]").each(function () {
        $(this).prop("checked", true);
        checkCnt++;
      });
    }

    $("#sp_examData").html(checkCnt);
  }

  function checkContent() {
    let checkCnt = 0;
    $("input:checkbox[name=examData]").each(function () {
      if ($(this).prop("checked")) {
        checkCnt++;
      }
    });
    $("#sp_examData").html(checkCnt);
  }

  function allDownload() {
    if (!checkUserLoggedIn(location.href)) {
      return false;
    }
    let ids = [];
    $("input:checkbox[name=examData]").each(function () {
      if ($(this).prop("checked")) {
        ids.push($(this).val());
      }
    });
    downloadContents(ids);
  }
</script>

<script>
  //즐겨찾는 교과서
  function getBookmark() {
    callAjax("bookmarkListForm", function (data) {
      try {
        let result = JSON.parse(data);
        let totalCnt = Number(result["totCnt"]) || 0;
        let bookmarkList = result["list"] || [];
        $("#divBookmarkList").empty();
        if (totalCnt > 0) {
          bookmarkList.forEach(function (item, index) {
            let tmpHtml = "";
            if (item.subjectId > 1135) {
              tmpHtml =
                '<a href="javascript:;" onclick="customExamPopup(' +
                item.subjectId +
                ');" title="새창 열림" class="button"><i class="icon icon-memo-center"></i>시험지 만들기</a>';
            }
            let newHtml = "";
            if (item.newYN === "Y") {
              newHtml = "<mark>NEW</mark>";
            }
            $("#divBookmarkList").append(
              '<div class="item">' +
              '    <div class="item-mark">' +
              '        <a href="javascript:;" onclick="delBookmark(\'' +
              item.testbookCode +
              "', " +
              item.cateId +
              ');" class="tooltip-mark add-bookmark"><span class="ir_su">즐겨찾기 삭제</span></a>' +
              "        " +
              newHtml +
              "    </div>" +
              '    <div class="item-content">' +
              "        <!-- 썸네일 -->" +
              '        <div class="item-image">' +
              '            <figure class="image is-thumnail">' +
              '                <img src="' +
              item.cover +
              '" alt="교과서 이미지" />' +
              "            </figure>" +
              "        </div>" +
              '        <div class="item-info">' +
              '            <p class="data_title">' +
              item.title +
              " (" +
              item.writer +
              ")</p>" +
              '            <div class="data_buttons">' +
              "                " +
              tmpHtml +
              '                <a href="javascript:;" onclick="getExam(' +
              item.cateId +
              ');"  title="다운로드" class="button"><i class="icon icon-download"></i>평가자료 다운</a>' +
              "            </div>" +
              "        </div>" +
              "    </div>" +
              "</div>"
            );
          });
          $(".tb-container.tb-bookmark").show();
        } else {
          $(".tb-container.tb-bookmark").hide();
        }
      } catch (e) {
        console.log(e);
      }
    });
  }

  //평가자료 팝업
  function getExam(id) {
    if (!checkUserLoggedIn(location.href)) {
      return false;
    }

    $("#examCateId").val(id);
    callAjax("examDataListForm", function (data) {
      try {
        let result = JSON.parse(data);
        let examList = [];
        let totalCnt = Number(result["totCnt"]);

        if (totalCnt > 0) {
          examList = result["list"];

          $("#sp_totalCnt").html(totalCnt);
          $("#sp_lTitle").html(result["lTitle"]);
          $("#sp_mTitle").html(result["mTitle"]);
          $("#sp_sTitle").html(result["sTitle"]);

          $("#examList").empty();
          examList.forEach(function (item, index) {
            $("#examList").append(
              "<tr>" +
              "    <td>" +
              '        <div class="custom-control custom-checkbox no-label">' +
              '           <input type="checkbox" class="custom-control-input" name="examData" id="check_' +
              item.id +
              '" value="' +
              item.id +
              '" onclick="checkContent();">' +
              '           <label class="custom-control-label" for="check_' +
              item.id +
              '"></label>' +
              "        </div>" +
              "    </td>" +
              '    <td><span class="point_colum">' +
              item.type +
              "</span></td>" +
              "    <td>" +
              item.title +
              "</td>" +
              "    <td>" +
              '        <a href="javascript:;" onclick="downloadContents(' +
              item.id +
              ')" class="btn btn-gray">' +
              '            <i class="icon icon-download"></i><span class="name">다운로드</span>' +
              "        </a>" +
              "    </td>" +
              "</tr>"
            );
          });

          $("#subjectPopup").modal("show");
        } else {
          alert("등록된 자료가 없습니다.");
        }
      } catch (e) {
        console.log(e);
      }
    });
  }

  // 과목별 탭
  function getBookByArea(btnId) {
    let btn = document.getElementById(btnId);
    let link = btn.querySelector('a');

    // 현재 선택된 버튼에 대한 클래스 조작
    link.classList.add('tabs__link--on');

    // 다른 버튼에 대한 클래스 조작
    let otherBtns = document.querySelectorAll('.tabs__list--4 > .tabs__item:not(#' + btnId + ')');
    otherBtns.forEach(item => {
      let otherLink = item.querySelector('a');
      otherLink.classList.remove('tabs__link--on');
    });

    // 과목별 교과서 목록 인덱싱
    const container = document.getElementsByClassName("tb-container tb-list");
    const containers = {};

    for (let i = 0; i < $("li").length; i++) {
      containers[`btn-` + i] = document.getElementsByClassName(`tb-` + i);
    }

    // 모든 과목의 교과서 목록 숨기기
    const hideAllContainers = () => {
      Array.from(container).forEach(item => item.style.display = "none");
    };

    // 특정 과목의 교과서 목록 노출시키기
    const showSelectedContainer = () => {
      Array.from(containers[btnId]).forEach(item => item.style.display = "block");
    };

    // 버튼에 클릭 이벤트 생성
    const button = document.getElementById(btnId);
    button.addEventListener("click", function () {
      hideAllContainers();
      showSelectedContainer();
    })

    return false;
  }

  //즐겨찾기 추가
  function addBookmark(testbookCode, testbankYN, cateId) {
    if (!checkUserLoggedIn(location.href)) {
      return false;
    }

    let data = {
      testbookCode: testbookCode.toString(),
      testbankYN: testbankYN.toString(),
    };

    $.ajax({
      type: "post",
      url: "/pinTestbook/add",
      data: data,
      dataType: "json",
      cache: false,
      async: false,
      success: function (response) {
        let result = response.success;
        if (result) {
          alert("즐겨찾는 교재로\n등록되었습니다.");
          getBookmark();
          $("#add_" + cateId).show();
          $("#del_" + cateId).hide();
        }
      },
      error: function (request, status, error) {
        console.error(request, status, error);
      },
    });
  }

  //즐겨찾기 삭제
  function delBookmark(testbookCode, cateId) {
    if (!checkUserLoggedIn(location.href)) {
      return false;
    }

    let data = {testbookCode: testbookCode.toString()};
    $.ajax({
      type: "post",
      url: "/pinTestbook/delete",
      data: data,
      dataType: "json",
      cache: false,
      async: false,
      success: function (response) {
        let result = response.success;
        if (result) {
          alert("즐겨찾는 교재에서\n삭제되었습니다.");
          getBookmark();
          $("#add_" + cateId).hide();
          $("#del_" + cateId).show();
        }
      },
      error: function (request, status, error) {
        console.error(request, status, error);
      },
    });
  }

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
</script>
</div>

<!-- ‘T셀파 교수자료 무단 배포 주의사항 안내’ 노출 화면 -->
<div class="middle-wrapper">
  <div class="caution-box">
    <p class="caution1">
      T셀파 교수자료 무단 배포 주의사항 안내 드립니다.
    </p>
    <p class="caution2">
      소중한 T셀파의 교수자료가 무단 배포 및 유출되지 않도록
      선생님들의 적극적인 협조 부탁드립니다.<br/>
      자료 유출로 인한 어려움을 겪지 않도록 선생님들께 간곡한
      부탁드립니다.<br/>
      학교에서 연구 목적 또는 수업 시에만 활용해 주세요.
    </p>
    <p class="caution3">
      T셀파의 교수자료의 저작권은 (주)천재교육에 있으며, 당사의 허락
      없이 무단으로 이를 유출하거나<br/>
      무단으로 타 사이트에 게재하는 경우 저작권법에 위배됩니다.
      T셀파의 교수자료의 저작권은 (주)천재교육에 있으며, 당사의 허락
      없이 무단으로 이를 유출하거나<br/>
      무단으로 타 사이트에 게재하는 경우 저작권법에 위배됩니다.
    </p>
    <a
            href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
            class="btn btn-secondary btn-icon"
            onclick="$('#unitSelect').modal('show')"
    >
                  <span class="name">유출 사례보기</span
                  ><i class="icon icon-arrow-right-white"></i>
    </a>
  </div>
</div>
<!--// ‘T셀파 교수자료 무단 배포 주의사항 안내’ 노출 화면 -->
</div>
</div>
</div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>