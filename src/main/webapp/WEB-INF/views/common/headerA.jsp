<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: 이양진
  Date: 2024-03-07
  Description: T셀파 중고등 전체 서비스와 연결된 상단 헤더 및 퀵메뉴
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ include file="/resource/midhigh/css/style.html" %>--%>
<html>
<head>

    <title>교과서 목록</title>
    <meta name="Referrer" content="origin"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <meta name="viewport" content="width=1768"/>
    <meta name="robots" content="index,follow"/>
    <meta
            name="title"
            content="T셀파 중고등 - 오직 선생님만을 위한 교수학습 무료지원"
    />
    <meta name="url" content="https://mh.tsherpa.co.kr/"/>
    <meta
            name="keywords"
            content="T셀파 중고등,티셀파 중고등,교수지원,천재교육,천재교과서"
    />
    <meta
            name="description"
            content="천재교육, 천재교과서의 모든 학습자료는 기본! 강력한 평가자료와 다양한 콘텐츠제공!"
    />
    <meta
            name="image"
            content="https://mh.tsherpa.co.kr/webfile/Tsherpa2021/resource/main/assets/img/OpenGraph_1200x630_m.jpg"
    />
    <meta
            name="apple-mobile-web-app-title"
            content="T셀파 중고등 - 오직 선생님만을 위한 교수학습 무료지원"
    />
    <meta property="fb:app_id" content="453644223372937"/>
    <meta property="og:type" content="website"/>
    <meta
            property="og:title"
            content="T셀파 중고등 - 오직 선생님만을 위한 교수학습 무료지원"
    />
    <meta property="og:url" content="https://mh.tsherpa.co.kr/"/>
    <meta
            property="og:description"
            content="천재교육, 천재교과서의 모든 학습자료는 기본! 강력한 평가자료와 다양한 콘텐츠제공!"
    />
    <meta
            property="og:image"
            content="https://mh.tsherpa.co.kr/webfile/Tsherpa2021/resource/main/assets/img/OpenGraph_1200x630_m.jpg"
    />
    <meta name="twitter:card" content="summary_large_image"/>
    <meta
            name="twitter:title"
            content="T셀파 중고등 - 오직 선생님만을 위한 교수학습 무료지원"
    />
    <meta name="twitter:url" content="https://mh.tsherpa.co.kr/"/>
    <meta
            name="twitter:description"
            content="천재교육, 천재교과서의 모든 학습자료는 기본! 강력한 평가자료와 다양한 콘텐츠제공!"
    />
    <meta
            name="twitter:image"
            content="https://mh.tsherpa.co.kr/webfile/Tsherpa2021/resource/main/assets/img/OpenGraph_1200x630_m.jpg"
    />

    <link
            rel="shortcut icon"
            href="https://cdata2.tsherpa.co.kr/tsherpa/Tsherpa2021/resource/midhigh/assets/img/favicon.ico"
    />
    <link
            rel="apple-touch-icon-precomposed"
            sizes="192x192"
            href="https://cdata2.tsherpa.co.kr/tsherpa/Tsherpa2021/resource/midhigh/assets/img/Favorites_T-spa.png"
    />
    <link rel="stylesheet" type="text/css" href="/resource/midhigh/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/resource/midhigh/css/pages.css"/>

    <script src="/resource/js/polyfill.min.js"></script>
    <script src="/resource/common/js/lib/jquery.min.js"></script>
    <script src="/resource/common/js/lib/jquery.mCustomScrollbar.min.js"></script>
    <script src="/resource/js/jquery.mousewheel.min.js"></script>
    <script src="/resource/common/js/lib/bootstrap.min.js"></script>
    <script src="/resource/common/js/lib/bootstrap-datepicker.min.js"></script>
    <script src="/resource/common/js/lib/swiper.min.js"></script>
    <script src="/resource/common/js/lib/moment.min.js"></script>
    <script src="/resource/common/js/lib/moment.locale.js"></script>
    <script src="/resource/common/js/lib/lodash.min.js"></script>
    <script src="/resource/common/js/lib/js.cookie.min.js"></script>
    <script src="/resource/common/js/lib/js.storage.min.js"></script>
    <script src="/resource/common/js/lib/handlebars.min.js"></script>
    <script
            src="/resource/common/js/lib/alpine-3.12.0.min.js"
            type="module"
    ></script>

    <script src="/resource/js/auth-latest.min.js"></script>
    <script
            type="text/javascript"
            src="/resource/js/jquery.whensync.js"
    ></script>

    <script src="/resource/js/queryencrypt-latest.min.js"></script>
    <script src="/resource/common/js/legacy_common.js"></script>
    <script src="/resource/midhigh/js/common.js"></script>

    <script>
        var currentDevice = "DESKTOP";
        var downloadServerUrl =
            "#";
        var cdnUrl = "https://cdata2.tsherpa.co.kr/tsherpa";

        //통합회원 체크
        window.onload = function () {
            if (true) {
                if (Common.getCookie("popupYN") != "N") {
                    if (Common.getCookie("loginCheck") == "Y") {
                        integratedChange();
                    }
                }
                Common.setCookie("loginCheck", "N");
            }
        };

        function isUserLogin() {
            return true;
        }

        function checkUserLoggedIn(redirect) {
            if (!true) {
                alert("로그인 후 이용할 수 있는 서비스입니다.");
                if (redirect !== false) {
                    location.href =
                        "/login.html?returnUrl=" + encodeURIComponent(location.href);
                }
            }
            return true;
        }

        function isStudentMember() {
            return false;
        }

        function returnMemberType() {
            return "S";
        }

        function iRegularMember() {
            return false;
        }

        // 유치, 교대생, 중고등 준회원, 정회원, 영업 X && 초등 정회원, 영업, 초중고 관리자 (우리반T셀파, 알림장 등)
        function newRegularMember() {
            return true;
        }

        // 교대생, 유치 준회원, 중고등 준회원, 정회원, 영업 X && 유치/초등 정회원, 영업, 초중고 관리자 (tBag)
        function tBagRegularMember() {
            return false;
        }

        // 중고등 창체, 특별한수업자료, forTea 공통 권한, 유치 전체X, 초중고 교대생, 정회원, 영업, 관리자만 가능 (글내용, 미리보기, 다운로드 권한)
        function mRegularMember() {
            return true;
        }

        // 초중고 비/준회원, 유치 비/준/정회원, 관리자 X && 초중고 교대생, 정회원, 영업, 관리자, 유치원 영업 (내 교과/평가)
        // 초등에서는 초등 정회원만, 중고에서는 중고 정회원만 가능하도록 수정
        //[권한] 초등 정회원 권한 수정 #703 2023.09.15
        function CEMember() {
            return true;
        }

        // 유치X, 초등 영업, 관리자 중고등 정회원, 영업, 관리자만 가능 (교과서, 과목자료)
        function tBookSubRegularMember() {
            return true;
        }

        function checkMenuPermission(menu) {
            if (
                !isUserLogin() &&
                (menu == "curri" ||
                    menu == "community" ||
                    menu == "exam" ||
                    menu == "creativity")
            ) {
                checkUserLoggedIn(true);
            }
        }

        function integratedChange() {
            if (true) {
                let userName = "dongtest_002";
                let encryption = encodeURIComponent(queryEncrypt.encrypt(userName));
                $.get("https://sso.chunjae.co.kr:446/api/member/JoinedSite", {
                    userID: encryption,
                }).done(function (Status) {
                    if (Status.Result.Items[0].CreDate < "2018") {
                        if (Status.Result.Itemsummary.TotalCnt < 3) {
                            let url = "/modal/membership-integration.html";
                            $("#memberChangeModal").load(
                                url,
                                function (response, status, xhr) {
                                    $("#memberChange").modal("show");
                                }
                            );
                        }
                    }
                });
            }
        }

        function certification() {
            showCertificationModal("S", "", "", "btn", $("#certModalFooterDiv"));
        }
    </script>
    <script type="text/javascript">
        (function (c, l, a, r, i, t, y) {
            c[a] =
                c[a] ||
                function () {
                    (c[a].q = c[a].q || []).push(arguments);
                };
            t = l.createElement(r);
            t.async = 1;
            t.src = "https://www.clarity.ms/tag/" + i;
            y = l.getElementsByTagName(r)[0];
            y.parentNode.insertBefore(t, y);
        })(window, document, "clarity", "script", "j50r9or0xl");
    </script>
    <script>
        $.ajax({
            url: "https://sso.chunjae.co.kr:446/api/auth/Validation",
            data: {
                sessionData:
                    "p14XIr8X/4HwnQrhxmMgdVcGzb6521Eu2JIt1s0MhT6S05iZBXmpvaeMIy+0S4CoJOo6KAdvZW3bE3MARi6C/w==",
            },
            dataType: "json",
            cache: false,
            success: function (data) {
                if (data && data.Result) {
                    let Items = data.Result.Items;
                    $.ajax({
                        url:
                            "https://sso.chunjae.co.kr:446/api/auth/Authorize?Token=" +
                            Items.Token,
                        dataType: "text",
                        xhrFields: {withCredentials: true},
                        cache: false,
                        success: function (data) {
                            let reg = /_ChunjaeSSOEncData = '(.*)';/;
                            let ssoData = reg.exec(data)[1];
                            if (ssoData) {
                                if (isLoginPage()) {
                                    alert("이미 로그인되어 있습니다.");
                                    location.href = "/";
                                }
                                sessionStorage.removeItem("tsherpa_sso_reload");
                            } else {
                            }
                        },
                        error: function (e) {
                            console.error(e);
                        },
                    });
                }
            },
            error: function (e) {
                console.error(e);
            },
        });

        function isLoginPage() {
            return (
                location.pathname == "/login.html" ||
                location.pathname == "/mo_membership/login.html" ||
                location.pathname == "/mo_membership/class_app_login.html" ||
                location.pathname.startsWith("/mo_membership/signup")
            );
        }

        async function isSsoStudentLogout() {
            const response1 = await fetch(
                "https://sso.chunjae.co.kr:446/api/auth/Validation?sessionData=" +
                encodeURIComponent(
                    "p14XIr8X/4HwnQrhxmMgdVcGzb6521Eu2JIt1s0MhT6S05iZBXmpvaeMIy+0S4CoJOo6KAdvZW3bE3MARi6C/w=="
                ),
                {
                    method: "GET",
                    cache: "no-cache",
                    headers: {
                        Accept: "application/json",
                    },
                }
            );
            const data1 = await response1.json();
            if (data1 && data1.Result) {
                const Items = data1.Result.Items;
                const response2 = await fetch(
                    "https://sso.chunjae.co.kr:446/api/auth/AuthorizeStudent?Token=" +
                    Items.Token,
                    {
                        method: "GET",
                        cache: "no-cache",
                        credentials: "include", // This is equivalent to xhrFields: {withCredentials: true}
                        headers: {
                            Accept: "text/plain",
                        },
                    }
                );
                const data2 = await response2.text();
                const reg = /_ChunjaeSSOEncData = '(.*)';/;
                const ssoData = reg.exec(data2)[1];
                if (ssoData) {
                    alert("다른 SSO 세션이 존재하여, 로그아웃 하겠습니다.");
                    const url = location.href.replace(location.search, "");
                    document.location.href =
                        "https://class.tsherpa.co.kr//tclass/logout?returnUrl=" +
                        encodeURIComponent(
                            "https://sso.chunjae.co.kr:446/api/auth/logout?returnUrl=" +
                            encodeURIComponent(url + encodeURIComponent(location.search))
                        );
                    return true;
                }
            }
            return false;
        }
    </script>
    <script
            src="/resource/js/0ebf843a0e.js"
            crossorigin="anonymous"
    ></script>
</head>

<body>
<!--header-->

<div class="header_bg_2022_v2 sticky" x-data="mhHeaderObj">
    <header class="header">
        <div class="util-line clearfix">
          <span class="util-link">
            <a href="https://kid.tsherpa.co.kr/">유치</a>
            <a href="https://ele.tsherpa.co.kr/">초등</a>
            <a href="https://mh.tsherpa.co.kr/" class="dark">중학·고등</a>
            <a href="https://mall.tsherpa.co.kr/" target="_blank">T셀파몰</a>
            <a href="https://edu.tsherpa.co.kr/" target="_blank">연수원</a>
            <a
                    href="https://cjtext.tsherpa.co.kr/2022/intro/intro.html"
                    target="_blank"
            >천재교과서</a
            >
          </span>
            <span class="util-member">
            <a href="javascript:logout();"
            ><span class="underline">로그아웃</span></a
            >
            <a href="https://www.tsherpa.co.kr/myT/membership/membership.html"
            >MY T셀파</a
            >
            <a href="https://www.tsherpa.co.kr/center/M-noticM.html"
            >고객센터</a
            >
            <a href="https://www.tsherpa.co.kr/event/index.html">이벤트</a>
            <a href="https://www.tsherpa.co.kr/center/M-sitemap.html"
            >사이트맵</a
            >
          </span>
        </div>

        <script>
            function doLogin() {
                let loginUrl = "/login.html";
                if (location.pathname.indexOf("/login.html") < 0) {
                    loginUrl += "?returnUrl=" + encodeURIComponent(location.href);
                }
                location.href = loginUrl;
            }

            function logout() {
                Storages.cookieStorage.remove("gnb_seleted_grade");
                location.href = "/logout";
            }
        </script>
        <div class="header_top">
            <h1><a href="https://mh.tsherpa.co.kr/">T셀파</a></h1>
            <form
                    id="keywordForm"
                    name="keywordForm"
                    method="get"
                    action="https://mh.tsherpa.co.kr/testbank/testbank.html"
                    autocomplete="off"
                    target="_blank"
                    onsubmit="return false;"
            >
                <div class="search_area">
                    <input
                            type="text"
                            id="keyword"
                            name="keyword"
                            placeholder="검색어를 입력해주세요."
                            onkeyup="press();"
                    />
                    <a href="javascript:" class="btn btn_search" id="searchButton"
                    >검색</a
                    >
                </div>
            </form>
            <div class="header_top-banner">
                <a href="https://edu.tsherpa.co.kr/Untact/MeetList" target="_blank">
                    <img
                            src="/resource/midhigh/img/banner/area_header/img-banner_20230515.png"
                            alt="선생님들의 비대면 지식공유 모임 T 배움터"
                    />
                </a>
            </div>
        </div>

        <div class="header_nav">
            <div class="btn btn_allMenu">
                <button type="button">
                    <span>전체메뉴</span>
                </button>
            </div>
            <!-- 1뎁스 -->
            <nav>
                <ul class="gnb">
                    <li>
                        <a
                                class="
"
                                href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
                                data-target="sub01"
                        >교과서자료</a
                        >
                    </li>
                    <li>
                        <a
                                class="active"
                                href="https://mh.tsherpa.co.kr/testbank/testbank.html"
                        >문제은행</a
                        >
                    </li>
                    <li>
                        <a
                                class="
"
                                href="https://mh.tsherpa.co.kr/edutech/index.html"
                        >에듀테크</a
                        >
                    </li>
                    <li>
                        <a
                                class="
"
                                href="https://mh.tsherpa.co.kr/class-research/tspoon/index.html"
                        >수업연구소</a
                        >
                    </li>
                    <li style="position: relative">
                        <a href="https://sschannel.tsherpa.co.kr/" target="_blank">
                            <img
                                    src="/resource/midhigh/img/common/logo-ssam.png"
                                    alt="쌤채널"
                                    style="margin-top: -5px"
                            />
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <script>
        $(function () {
            /* 1뎁스 클릭 관련 */
            $(".gnb li a").on("click", function (e) {
                e.stopPropagation();
                let depths_one = $(this).attr("data-target");
                bgDimClose();
                if (depths_one == null || depths_one == "") {
                    //빈값이면
                    $(".gnb li a").removeClass("on"); //1뎁스 비활성화
                    $(".gnb_submenu").removeClass("on"); //2뎁스 영역 비활성화
                } else {
                    //클릭한 1뎁스의 href 에 값이있으면
                    if ($(this).hasClass("on")) {
                        //활성화된 상태에서 1뎁스 메뉴 클릭시
                        $(this).removeClass("on");
                        $(".gnb_submenu").removeClass("on");
                        $(".subs").removeClass("on");
                    } else {
                        //비활성화된 상태에서 1뎁스 메뉴 클릭시
                        $(".gnb li a").removeClass("on");
                        $(this).addClass("on");
                        $(".gnb_submenu").addClass("on");
                        $(".subs." + depths_one)
                            .addClass("on")
                            .siblings()
                            .removeClass("on");
                        $("body")
                            .addClass("modal-open")
                            .append(
                                "<div class='gnb-bg' style='z-index:50; position:fixed; width:100%; height:100%; left:0; top:0; background-color: rgba(0,0,0,.2);'></div>"
                            );
                        $(document).on("click.gnb2depth", function (e) {
                            let $clicked = $(e.target);
                            if (!$clicked.closest(".subs." + depths_one).length) {
                                bgDimClose();
                                $(".gnb li a").removeClass("on"); // 1뎁스 비활성
                                $(".gnb_submenu").removeClass("on"); // 2뎁스 영역 비활성
                            }
                        });
                    }
                }
            });
            /* 네비게이션 우측 닫기버튼 클릭시 */
            $(".gnb_submenu__close").on("click", function (e) {
                bgDimClose();
                $(".gnb li a").removeClass("on"); // 1뎁스 비활성
                $(".gnb_submenu").removeClass("on"); // 2뎁스 영역 비활성
            });

            function bgDimClose() {
                //열려있는 2뎁스 닫을때 딤드 관련 제거
                $(".gnb-bg").remove();
                $("body").removeClass("modal-open");
                $(document).off("click.gnb2depth"); // 닫기영역 클릭 이벤트 비활성
            }

            /* 2뎁스 교과서자료실 : 중학 & 고등 메뉴 클릭시 */
            $(".box01__list li a").on("click", function (e) {
                let num = $(this).parent().index();
                // 이전 선택 과목 초기화 & 첫번째 과목 선택
                $(".box02__list li a").removeClass("on");
                $(".box02__list").eq(num).find("li a").eq(0).addClass("on");
                // 현재선택한 중학 & 고등 메뉴 클릭시
                $(".box01__list li a").removeClass("on");
                $(this).addClass("on");
                $(".box02__list")
                    .css("display", "none")
                    .eq($(this).parent().index())
                    .css("display", "block");
            });
            /* 3뎁스 과목 클릭시 */
            $(".box02__list li a").on("click", function (e) {
                $(".box02__list li a").removeClass("on");
                $(this).addClass("on");
            });
            /* 4뎁스 클릭 관련 ~~~ 2015, 2020 개정 교육 과정 클릭 관련 */
            $(".box03__column__btn").on("click", function (e) {
                let _h = $(this).parent().find(".box03__list")[0].scrollHeight;
                if ($(this).hasClass("on")) {
                    $(this).parent().find(".box03__list").attr("style", "height:0px");
                    $(this).removeClass("on");
                    $(this).parent().find(".box03__list").removeClass("on");
                } else {
                    $(this)
                        .parent()
                        .find(".box03__list")
                        .attr("style", "height:" + _h + "px");
                    $(this).addClass("on");
                    $(this).parent().find(".box03__list").addClass("on");
                }
            });
        });
    </script>
</div>

<script>
    let mhHeaderObj = {
        mhCateIndex: 0,
        mhCateList: [{"id": "604260", "code": "M-textBook", "name": "중학"}, {
            "id": "605947",
            "code": "H-textBook",
            "name": "고등"
        }],
        showTextBookList: {},
        getTextBookList: async function (groupId = 1) {
            let _this = this;
            // 교과서자료 GNB 메뉴 교과서 가져오기
            _this.showTextBookList = await $.get("/midhigh/getTextbookData.do", {
                mhCateId: _this.mhCateList[_this.mhCateIndex].id,
                groupId: groupId
            });

            // 애니메이션효과를 주기위해 불가피하게 높이값을 고정으로 설정(auto설정 후 높이값 측정)
            let $column = $('.box03__column__btn');
            $column.each(function () {
                if ($(this).hasClass("on")) {
                    $(this).siblings(".box03__list").attr('style', 'height: auto');
                }
            });
            setTimeout(function () {
                $column.each(function () {
                    let _h = $(this).siblings('.box03__list')[0].scrollHeight;
                    if ($(this).hasClass("on")) {
                        if (_h) $(this).siblings(".box03__list").attr('style', 'height:' + _h + 'px');
                    }
                });
            }, 200)
        },
        goBookPage: function (id) {
            let _this = this;
            location.href = "/curri/schoolbookdata.html?id=" + id;
        },
        showTextBookMenu: function (mhIndex, groupId) {
            let _this = this;
            _this.mhCateIndex = mhIndex;
            _this.getTextBookList(groupId);
            $('.btn_close_menu').trigger("click");
            setTimeout(() => {
                $('.gnb li:first a').trigger("click");
                $('.box01__list li:eq(' + mhIndex + ') a').trigger("click");
                $('.box02__list:eq(' + mhIndex + ') li:eq(' + (groupId - 1) + ') a').trigger("click");
            }, 250);
        },
        init: function () {
            let _this = this;
            _this.getTextBookList(1);
        },
    };
</script>

<!-- gnb sitemap -->
<div class="gnb_sitemap_2023">
    <div class="map_header">
        <div class="inner">
            <span>T셀파 중학·고등 전체 서비스</span>
            <a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#" class="btn_close_menu">
                <img src="/resource/midhigh/img/common/btn-close-big-white.png" alt="닫기버튼">
            </a>
        </div>
    </div>
    <div class="map_wrap">
        <div class="map_inner">
            <div class="site_list">
                <div class="subject">
                    <span><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                             onclick="mhHeaderObj.$data.showTextBookMenu(0, 1)">중학 교과서 자료</a></span>
                    <ul>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(0, 1)">국어</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(0, 2)">영어</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(0, 3)">수학</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(0, 4)">사회/역사/도덕</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(0, 5)">과학/기술·가정/정보</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(0, 6)">음악/미술/체육</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(0, 7)">선택/외국어</a></li>
                    </ul>
                </div>
            </div>
            <div class="site_list">
                <div class="subject">
                    <span><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                             onclick="mhHeaderObj.$data.showTextBookMenu(1, 1)">고등 교과서 자료</a></span>
                    <ul>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 1)">국어</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 2)">영어</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 3)">수학</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 4)">사회</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 5)">역사</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 6)">도덕</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 7)">과학</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 8)">기술·가정/정보</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 9)">음악/미술/체육</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 10)">제2외국어/한문</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage#"
                               onclick="mhHeaderObj.$data.showTextBookMenu(1, 11)">교양/전문</a></li>
                    </ul>
                </div>
            </div>
            <div class="site_list">
                <div class="subject">
                    <span><a href="https://mh.tsherpa.co.kr/testbank/testbank.html">문제은행</a></span>
                    <ul>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=M-TestBank">중학</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage">시험지
                            보관함</a></li>
                    </ul>
                </div>
            </div>
            <div class="site_list">
                <div class="subject">
                    <span><a href="https://mh.tsherpa.co.kr/edutech/index.html">에듀테크</a></span>
                    <ul>
                        <li><a href="https://mh.tsherpa.co.kr/edutech/index.html">에듀테크 리스트</a></li>
                    </ul>
                </div>
            </div>
            <div class="site_list">
                <div class="subject">
                    <span><a href="https://mh.tsherpa.co.kr/class-research/tspoon/index.html">수업연구소</a></span>
                    <ul>
                        <li><a href="https://mh.tsherpa.co.kr/class-research/tspoon/index.html">Tspoon(매거진)</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/class-research/request/index.html">자료요청</a></li>
                        <li><a href="https://mh.tsherpa.co.kr/class-research/vote/index.html">T Poll(설문조사)</a></li>
                    </ul>
                </div>
            </div>
            <div class="site_list">
                <div class="subject">
                    <span><a href="https://sschannel.tsherpa.co.kr/" target="_blank">쌤 채널</a></span>
                    <ul>
                        <li><a href="https://sschannel.tsherpa.co.kr/" target="_blank">쌤 채널</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <span class="drop_showArea">
        <span></span>
    </span>
</div>

<script>
    $(document).ready(function () {
        // 사이트맵 클릭 관련
        $('.btn_allMenu').on("click", function (e) {
            e.preventDefault();
            $(this).parents('body').addClass('_body_scroll');
            $(".quick_menu").css("z-index", 50);
            $(this).toggleClass("open");
            $(".gnb_sitemap_2023").slideToggle(100);
            $('.submenu-bg_dmimd').remove();
            $('.header_bg_2022_v2').append('<div class="submenu-bg_dmimd"></div>');
        });
        $('.btn_close_menu').on("click", function (e) {
            e.preventDefault();
            $(this).parents('body').removeClass('_body_scroll');
            $(".quick_menu").css("z-index", 105);
            $(".gnb_sitemap_2023").slideUp(100);
            $('.btn_allMenu').removeClass("open");
            $('.submenu-bg_dmimd').remove();
        });
    });
</script>
<!-- // gnb sitemap -->

<%-- quick menu --%>
<div class="quick_menu v2_1">
    <button class="btn_quick_toggle"><i>화살표</i></button>
    <p class="tit">Quick menu</p>

    <c:choose>
        <%-- 로그인 전 --%>
        <c:when test="${empty userId}">
            <div class="login_area">
                <form name="q_loginForm" action="/login" method="post">
                    <ul class="input_field">
                        <li>
                            <input type="text" id="ID" class="i_text" name="q_username" placeholder="아이디">
                        </li>
                        <li>
                            <input type="password" id="PW" class="i_text" name="q_password" placeholder="비밀번호">
                        </li>
                    </ul>

                    <div class="custom-control custom-checkbox save_id">
                        <input type="checkbox" class="custom-control-input" id="rememberUserId">
                        <label class="custom-control-label" for="rememberUserId">아이디 저장</label>
                    </div>

                    <a href="javascript: void(0);" class="btn_login">로그인</a>

                    <p class="login_find_btn_area">
                        <a href="https://www.tsherpa.co.kr/mo_membership/form_find_id.html?tab=id"
                           class="btn_find">아이디</a>
                        <a href="https://www.tsherpa.co.kr/mo_membership/form_find_id.html?tab=pw" class="btn_find">비밀번호
                            찾기</a>
                    </p>

                </form>
                <%-- 퀵메뉴 접혔을 시 버튼 --%>
                <button class="quick_open inp_auto">로그인</button>
                <%-- 퀵메뉴 접혔을 시 버튼 --%>
            </div>
        </c:when>
        <%-- 로그인 전 --%>

        <%-- 로그인 후 --%>
        <c:otherwise>
            <div class="quick_msg_box">
                <a
                        href="https://ele.tsherpa.co.kr/creativity/calendar/view.html?menu=calendar&amp;categoryId=453887relid=&amp;id=760891&amp;type=E-ex-00-season_03-Mar"
                        target="_blank"
                        class="txt"
                >겨울잠에서 깨어나는 경칩.</a
                >
            </div>

            <div class="login_area">
                <div class="intro">
                    <p class="name"><strong>${name}</strong> 선생님</p>
                </div>
                <a
                        href="https://www.tsherpa.co.kr/myT/membership/membership.html"
                        class="btn_my_sherpa"
                >MY T셀파</a
                >
                <div class="link_box">
                    <a href="javascript:logout()" class="btn_logout">로그아웃</a>
                    <a
                            href="https://www.tsherpa.co.kr/center/M-noticM.html"
                            class="btn_customer_center"
                    >고객센터</a
                    >
                </div>
                <!-- 퀵메뉴 접혔을 시 버튼 -->
                <button class="quick_open user">사용자</button>
                <!-- //퀵메뉴 접혔을 시 버튼 -->
            </div>
            <!-- //로그인 후 -->
        </c:otherwise>
        <%-- 로그인 후 --%>
    </c:choose>

    <script>
        function getLoginMessage() {
            return new Promise(function (resolve, reject) {
                let loginMessageList = JSON.parse(
                    sessionStorage.getItem("login-message")
                );
                if (!loginMessageList) {
                    $.get("/main/getLoginMessageList", null)
                        .done(function (result) {
                            sessionStorage.setItem(
                                "login-message",
                                JSON.stringify(result)
                            );
                            resolve(result);
                        })
                        .fail(function (e) {
                            console.error(e);
                            reject(e);
                        });
                } else {
                    resolve(loginMessageList);
                }
            });
        }

        $(async function () {
            let list = [];
            let priorList = [];
            let peakItem = null;
            let loginMessageList = await getLoginMessage();
            let now = moment();
            let nowDate = now.format("YYYY-MM-DD");
            let nowTime = now.format("HH:mm:ss");
            let weekDay = String(now.day() - 1);
            for (let item of loginMessageList) {
                let data = JSON.parse(item.data);
                if (data.st_date && data.repeat == "true") {
                    data.st_date = now.format("YYYY") + data.st_date.substring(4, 10);
                }
                if (data.en_date && data.repeat == "true") {
                    data.en_date = now.format("YYYY") + data.en_date.substring(4, 10);
                }
                if (data.site_id && data.site_id != "2") continue;
                if (data.st_date && data.st_date > nowDate) continue;
                if (data.en_date && data.en_date < nowDate) continue;
                if (data.st_time && data.st_time > nowTime) continue;
                if (data.en_time && data.en_time < nowTime) continue;
                if (data.week_day && !data.week_day.split(",").includes(weekDay))
                    continue;
                data.prior == "true" ? priorList.push(item) : list.push(item);
            }
            if (priorList.length > 0) {
                let peakIndex = Math.floor(Math.random() * priorList.length);
                peakItem = priorList[peakIndex];
            } else if (list.length > 0) {
                let peakIndex = Math.floor(Math.random() * list.length);
                peakItem = list[peakIndex];
            }
            if (peakItem) {
                let $msgBox = $("div.quick_msg_box");
                if (peakItem.url) {
                    $msgBox
                        .append(
                            `<a href="${peakItem.url}" target="_blank" class="txt">${peakItem.title}</a>`
                        )
                        .removeClass("no_link");
                } else {
                    $msgBox.append(`<span class="txt">${peakItem.title}</span>`);
                }
            }
        });
    </script>

    <ul class="quick_lst go_link">
        <li class="link_timetbl">
            <a href="https://www.tsherpa.co.kr/myT/curri/myCurri.html"
            ><i></i> <span>교과서 설정</span></a
            >
        </li>
    </ul>

    <ul class="quick_lst go_tbag">
        <li class="lst01">
            <a href="https://mh.tsherpa.co.kr/testbank/testbank.html"
            ><i></i> <span>문제은행</span></a
            >
        </li>
        <li class="lst08">
            <a href="javascript:" onclick="openBookDVD();"
            ><i></i> <span>교사용 DVD</span></a
            >
        </li>
    </ul>

    <a
            href="https://mh.tsherpa.co.kr/testbank/testbank.html#"
            class="btn_top"
            style="opacity: 1"
    ><span></span>TOP</a
    >
</div>

<script>
    if (Storages.cookieStorage.setPath("/").get("menu_collapse") == "Y") {
        $(".quick_menu").addClass("active");
    } else {
        $(".quick_menu").removeClass("active");
    }
    $(function () {
        $(".btn_quick_toggle").on("click", function (e) {
            e.preventDefault();
            $(".quick_menu").toggleClass("active");
            setQuickMenuCookie();
        });
        $(".quick_open").on("click", function (e) {
            e.preventDefault();
            $(".quick_menu").removeClass("active");
            if ($(this).hasClass("inp_auto")) {
                $(".input_field #ID").focus();
            }
            setQuickMenuCookie();
        });
        var btnTop = $(".btn_top");
        btnTop.on("click", function (e) {
            e.preventDefault();
            $("html, body").animate(
                {
                    scrollTop: 0,
                },
                "slow"
            );
        });
        $(window).on("load", function () {
            var scrollTop = $(window).scrollTop();
            if (scrollTop > 50) {
                btnTop.css({opacity: 1});
            } else {
                btnTop.css({opacity: 0});
            }
        });
        $(window).on("scroll", function () {
            var scrollTop = $(window).scrollTop();
            if (scrollTop > 50) {
                btnTop.css({opacity: 1});
            } else {
                btnTop.css({opacity: 0});
            }
        });

        function setQuickMenuCookie() {
            if ($(".quick_menu").hasClass("active")) {
                Storages.cookieStorage.setPath("/").set("menu_collapse", "Y");
            } else {
                Storages.cookieStorage.setPath("/").set("menu_collapse", "N");
            }
        }
    });
</script>

<script>
    async function oauthLogin(type) {
        if (await isSsoStudentLogout()) {
            return;
        }
        location.href =
            "https://www.tsherpa.co.kr/oauth2/login/" +
            type +
            "?returnUrl=" +
            encodeURIComponent(location.href);
    }

    function processLoginSuccess(response, id, pwd) {
        const doRedirect = (ssoLoginData) => {
            if (
                !(
                    ssoLoginData.user.curri === "C2" ||
                    ssoLoginData.user.curri === "C3"
                )
            ) {
                location.reload();
                return;
            }
            $.get("/pinCurri/getMainTpinCurri?siteId=7")
                .then((result) => {
                    if (result?.mainTpinCurri?.categoryId) {
                        location.replace(
                            "/curri/schoolbookdata.html?id=" +
                            result.mainTpinCurri.categoryId
                        );
                    } else {
                        location.reload();
                    }
                })
                .catch(() => location.reload());
        };
        let isIE11 = !!navigator.userAgent.match(/Trident.*rv\:11\./);
        if (isIE11) {
            let scriptUrl =
                "https://sso.chunjae.co.kr:446/api/auth/authenticate?SiteName=TSHERPA&Token=" +
                response.Items.Token;
            let s = document.createElement("script");
            s.type = "text/javascript";
            s.src = scriptUrl;
            $("head").append(s);
            let params = {
                token:
                response.Items.Token /* ★ 1. Token 정보는 필수사항입니다. ★ */,
                id: queryEncrypt.encrypt(
                    id
                ) /* 아래 항목들은 각 사이트에 맞게 적용*/,
                pwd: queryEncrypt.encrypt(pwd),
                openerType: "pagelogin",
                returnUrl: encodeURIComponent(queryEncrypt.encrypt(location.href)),
                encData: response.Items.SSOEncData,
                oReturnUrl: "",
                siteInfoIncorrect: "0",
            };
            $.post("/ssoLogin.do", params).done(function (data) {
                if (data.success) {
                    setTimeout(function () {
                        Common.setCookie("loginCheck", "Y");
                        doRedirect(data);
                    }, 600);
                } else {
                    alert(data.message);
                }
            });
        } else {
            $.getScript(
                "https://sso.chunjae.co.kr:446/api/auth/authenticate?SiteName=TSHERPA&Token=" +
                response.Items.Token
            ).done(function (script, textStatus) {
                let params = {
                    token:
                    response.Items.Token /* ★ 1. Token 정보는 필수사항입니다. ★ */,
                    id: queryEncrypt.encrypt(
                        id
                    ) /* 아래 항목들은 각 사이트에 맞게 적용*/,
                    pwd: queryEncrypt.encrypt(pwd),
                    openerType: "pagelogin",
                    returnUrl: encodeURIComponent(
                        queryEncrypt.encrypt(location.href)
                    ),
                    encData: response.Items.SSOEncData,
                    oReturnUrl: "",
                    siteInfoIncorrect: "0",
                };
                $.post("/ssoLogin.do", params).done(function (data) {
                    if (data.success) {
                        Common.setCookie("loginCheck", "Y");
                        doRedirect(data);
                    } else {
                        alert(data.message);
                    }
                });
            });
        }
    }

    async function login() {
        let id = $(".login_area input[name=q_username]").val();
        id = $.trim(id);
        let pwd = $(".login_area input[name=q_password]").val();
        pwd = $.trim(pwd);

        if (!id) {
            alert("아이디가 입력되지 않았습니다.");
            $("#ID").focus();
            return false;
        }

        if (!pwd) {
            alert("비밀번호가 입력되지 않았습니다.");
            $("#PW").focus();
            return false;
        }

        // 아이디 정규식
        let idEx = /^[A-Za-z0-9]{4,20}$/;
        if(!idEx.test(id)){
            alert("4자 이상 20자 이하의 영문, 숫자 혹은 특수문자로 이루어진 아이디를 입력해 주세요.");
            $("#ID").focus();
            return false;
        }

        // 비밀번호 정규식
        let pwdEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{4,20}$/;
        if(!pwdEx.test(pwd)){
            alert("4자 이상 20자 이하의 영문, 숫자, 특수문자로 이루어진 비밀번호를 입력해 주세요.");
            $("#PW").focus();
            return false;
        }

        let params = {
            id: id,
            pwd: pwd
        };

        $.ajax({
            url: "/login",
            data: JSON.stringify(params),
            contentType: "application/json",
            dataType: "json",
            cache: false,
            async: false,
            type: "POST",
            success: function (res) {
                switch (res.status) {
                    case "success":
                        // 아이디 기억하기
                        if ($("input:checkbox[id='rememberUserId']").is(":checked")) {
                            Storages.localStorage.set("loginuserid", id);
                        } else {
                            Storages.localStorage.remove("loginuserid");
                        }
                        // redirect
                        location.replace(location.href);
                        break;
                    case "fail":
                        alert(
                            "로그인에 실패하였습니다.\n다시 시도해주세요."
                        );
                        break;
                    default:
                        alert(
                            "로그인에 실패하였습니다.\n다시 시도해주세요."
                        );
                        break;
                }
            },
            error : function (xhr, status, error) {
                window.location.href="/error/error";
            }
        });

        if ($("input:checkbox[id='rememberUserId']").is(":checked")) {
            Storages.localStorage.set("loginuserid", id);
        } else {
            Storages.localStorage.remove("loginuserid");
        }
    }

    $(function () {
        $(".btn_login").on("click", function () {
            login();
        });
        // 로그인 이벤트 추가
        $("input[name=q_password]").on("keypress", function (e) {
            if (e.keyCode == 13) {
                login();
            }
        });
        let userid = Storages.localStorage.get("loginuserid");
        let $form = $('form[name="q_loginForm"]');
        if (userid) {
            $("input[name='q_username']", $form).val(userid);
            $("input:checkbox[id='rememberUserId']").prop("checked", true);
        }
        $form.submit(function (e) {
            e.preventDefault();
            login(e);
        });
    });
</script>

<form id="searchHeaderForm" name="searchHeaderForm" method="get"
      action="https://mh.tsherpa.co.kr/testbank/testbank.html?cateCode=TestBank-Storage" target="_blank">
    <input type="hidden" id="q" name="q" value="">
    <input type="hidden" id="fromSiteType" name="fromSiteType" value="midhigh">
</form>

<script>
    let _findUrl = 'https://www.tsherpa.co.kr/';
    let _keyword = '';
    let _section = '';
    let _keywordForm = $("#keywordForm");
    let _searchForm = $("#searchHeaderForm");

    // 검색 전송
    function doSearch() {
        if ($("#keyword").val() != "") {
            $(_searchForm).find("#q").val(encodeURIComponent($(_keywordForm).find("#keyword").val()));
            $(_searchForm).attr("action", _findUrl + "search/all.html");
            $(_searchForm).submit();
        } else {
            alert('검색어를 입력해 주세요.');
        }
        return false;
    }

    function press() {
        if (event.keyCode == 13) {
            if ($(_keywordForm).find("#keyword").val()) {
                doSearch();
            }
        }
    }

    $("#searchButton").on("click", function () {
        doSearch();
    });
</script>
<div id="tDvdModalDiv"></div>

<script>
    function openTShareCommonUrl(url) {
        if (!checkUserLoggedIn()) {
            return;
        }
        location.href = url;
    }

    // 교사용 DVD
    function openBookDVD(code) {
        if (!checkUserLoggedIn()) {
            return;
        }
        if (!CEMember()) {
            alert("중,고등 정회원만 서비스를 이용하실 수 있습니다.");
            return;
        }
        let schoolType = 'mid';
        let param = new URLSearchParams({tBook: code, type: schoolType, name: '', year: '2015'});
        front.loading.showLoading();
        $('#tDvdModalDiv').load("/modal/tDVD.html?" + param.toString(), function () {
            $('#tDvdPopup').modal('show');
            front.loading.hideLoading();
        });
    }
</script>
<script>
    if (moment() >= moment("2024-02-01") && moment() < moment("2024-02-13")) {
        $('div.header_top h1').addClass("logo_seollal")
    } else {
        $('div.header_top h1').removeClass("logo_seollal")
    }
</script>

<!--header-->
<jsp:include page="headerE.jsp"/>