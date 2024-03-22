/** 공통 기능
 * 1. 텍스트 입력 시 글자 수 표시
 * 2. CheckBox 전체선택
 * 3. Ajax 호출
 * 4. moveScroll
 * 6. 태그 문자 제거 (html)
 * 6-1. 특수문자 제거S
 * 7. 게시글 뷰카운트 +1
 * 8. 최근 본 영상 저장
 * 9. file ICON
 * 10. Name Masking
 * 11. File_Name 특수문자 체크
 * 12. 숫자 천단위 , 처리
 *
 * 공통 modal
 * modal 1. T핀
 * modal 2. 최근 동영상 보기
 * */
/** 1. 텍스트 입력 시 글자 수 표시    (입력폼 : for  - 출력폼 : id ) */
// ajax 공통호출
const ajaxCall = (type, url, param, callback) => {
    $.ajax({
        url: url,
        type : type,
        data : param,
        contentType: "application/json",
        success: function (data) {
            console.log("ajaxCall 호출");
            return callback(data);
        },
        error : function (xhr, status, error) {
            window.location.href="/error/error";
        }
    });
}
$(document).on('keyup', '[data-input-keyup="keyup"]', function (e) {
    let id = $(this).attr("for");
    let txtCnt = $(this).val().length + "";
    let maxLength = Number($(this).attr('maxLength'));
    if (txtCnt > maxLength) {
        let txt = String($(this).val()).substring(0, 300);
        $(this).val(txt);
        txtCnt = txt.length;
    }
    $("#" + id).html(txtCnt);
});

/** 2. CheckBox 전체선택 */
function allCheck(name, name2) {
    // test
    var result = $("#all_" + name).prop("checked");
    $("input[name='" + name + "']").prop("checked", result);
    if (name2) {
        $("input[name='" + name2 + "']").prop("checked", result);
    }
}

/** 3. Ajax 호출 */
function callAjax(formId, callbackFn, errorFn) {
    let $source = $("#" + formId);
    let url = $source.attr('action') || $source.attr('href');
    let method = $source.attr('method') ? $source.attr('method') : 'GET';
    let enctype = $source.attr('enctype') || 'application/x-www-form-urlencoded';
    let data = $source.serializeArray();
    let ajaxOptions = {
        url: url,
        type: method,
        enctype: enctype,
        data: data,
        success: function (response) {
            try {
                if (callbackFn) {
                    callbackFn(response);
                }
            } catch (error) {
                console.log(error);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error(jqXHR, textStatus, errorThrown);
            if (errorFn) {
                errorFn(jqXHR, textStatus, errorThrown);
            }
        }
    };
    $.ajax(ajaxOptions).done(function () {
        // $('html, body').animate({ scrollTop: 0 }, 0);
    });
}

/** 4. moveScroll */
function moveScroll(id) {
    let top = ($(id).offset().top) - 118;
    $('html,body').animate({scrollTop: top}, 'slow');
}

/** 6. 태그 문자 제거 */
function removeHtml(text) {
    let html = removeEscape(text);
    let tmp = document.createElement("DIV");
    tmp.innerHTML = html;
    let result = tmp.innerText;
    tmp.remove();
    return result;
}

/** 6-1.특수문자 제거 */
function removeEscape(text) {
    let result = text.replace(/&amp;/gi, '&').replace(/&lt;/gi, '<').replace(/&gt;/gi, '>').replace(/&quot;/gi, '"').replace(/&nbsp;/gi, ' ').replace(/&#39;/gi, '');
    return result;
}

/** 6-1.특수문자 제거 */
function removeEscape(text) {
    let result = text.replace(/&amp;/gi, '&').replace(/&lt;/gi, '<').replace(/&gt;/gi, '>').replace(/&quot;/gi, '"').replace(/&nbsp;/gi, ' ').replace(/&#39;/gi, '');
    return result;
}

/** 7. 게시글 뷰카운트 +1 */
function contentCheck(id, siteId) {
    let urlTxt = '/api/contentClick?id=' + id;
    if (siteId) {
        urlTxt += '&siteId=' + String(siteId);
    }
    let ajaxOptions = {
        url: urlTxt,
        type: 'GET',
        success: function (response) {
            // console.log(response);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error('board click Error');
        }
    };
    $.ajax(ajaxOptions).done(function () {
    });
}

/** 8. 최근 본 영상 저장 */
function saveRecentlyVideo(formId, videoId) {
    let $source = $("#" + formId);
    let data = $source.serializeArray();
    // 이어보기 시간
    if (videoId) {
        let time = document.getElementById(videoId).currentTime;
        if (time > 60) {
            let min = Math.floor(time / 60);
            let sec = time % 60;
            time = ((min < 10) ? '0' + min : min) + ':' + ((sec < 10) ? '0' + sec : min);
        } else {
            let sec = Math.floor(time);
            time = '00:' + ((sec < 10) ? '0' + sec : sec);
        }
        $source.find("#playTime").val(time);
    }
    let ajaxOptions = {
        url: "/recentlyVideo/save.do",
        type: "POST",
        enctype: 'application/x-www-form-urlencoded',
        data: data,
        success: function (response) {
            // console.log(response);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log('Recently Video Error');
            console.error(jqXHR, textStatus, errorThrown);
        }
    };
    $.ajax(ajaxOptions).done(function () {
        // $('html, body').animate({ scrollTop: 0 }, 0);
    });
}

/** 9. file ICON
 ico-folder-green   --> 다중파일
 ico-link-connect-blue   --> in 링크 (현재창)
 ico-link-blue   --> 아웃 링크 (새창)
 ico-play-triangle-blue  --> mp4,mov, 등 영상
 ico-ppt --> ppt
 ico-img     --> 이미지
 ico-word    --> 워드
 ico-excel   --> 엑셀
 ico-hangle  --> 한글
 ico-pdf --> pdf
 ico-music   --> mp3
 ico-zip --> 압축파일, zip
 ico-file    --> 그외 기타
 */
function getFileType(filePath) {
    let result = 'other';
    if (!filePath) {
        return result;
    }
    filePath = filePath.toLowerCase().replace(/ /g, "").trim();
    let arr = filePath.split('.');
    switch (arr[arr.length - 1]) {
        case 'doc':
        case 'docx':
            result = 'word';
            break;
        case 'hwp':
            result = 'hangle';
            break;
        case 'pdf':
            result = 'pdf';
            break;
        case 'ppt':
            result = 'ppt';
            break;
        case 'pptx':
            result = 'ppt';
            break;
        case 'link':
            result = 'link-blue';
            break;
        case 'html':
        case 'mp3':
            result = 'music';
            break;
        case 'mov':
        case 'mp4':
            result = 'play-triangle-blue';
            break;
        case 'zip':
            result = 'zip';
            break;
        case 'jpg':
            result = 'img';
            break;
        case 'png':
            result = 'img';
            break;
        case 'gif':
            result = 'img';
            break;
        case 'xls':
        case 'xlsx':
            result = 'excel';
            break;
        default :
            result = 'file';
            break;
    }
    return result;
}

function setFileIcon(filePath, text) {
    if (!text) {
        text = '';
    }
    let result = 'icon-other';
    if (!filePath) {
        return result + text;
    }
    let fileType = getFileType(filePath);
    result = 'icon icon-' + fileType;
    return result + text;
}

/** 10. Name Masking **/
function nameMasking(name) {
    let result = '';
    let removeEng = name.replace(/\w/gi, '').trim();
    if (removeEng == '') { // 영어이름일 경우
        let arr = name.split(" ");
        if (arr.length > 1) {
            result = arr[0].substring(0, 3);
            let first = (arr.splice(0, arr.length - 1)).join(" ").substring(3);
            result += first.replace(/\w/gi, '*') + ' ' + arr[arr.length - 1];
        } else {
            console.log(removeEng, name);
            result = name.substring(0, 3);
            let tmp = name.substring(3, 0);
            result += tmp.replace(/\w/gi, '*');
        }
    } else {
        let arr = name.split('');
        if (arr.length > 2) {
            result = arr[0] + (name.substring(1, arr.length - 1)).replace(/[\W\w]/gi, '*') + arr[arr.length - 1];
        } else {
            result = arr[0] + '*';
        }
    }
    return result;
}

/** 11. File_Name 특수문자 체크 */
function fileNameEscCheck(fileName) {
    // 1. .이 2개 찍히는 파일은 업로드 불가
    let dotRemove = fileName.replace(/\./gi, '');
    if (fileName.length != (dotRemove.length + 1)) {
        return false;
    }
    // 2. 그 외 웹취약점에 활용될 수 있는 문자열 파일명에 있을 경우 업로드 불가
    let wordRemove = dotRemove.replace(/[`~!@#$%^&*|\\\'\";:\/?]/gi, '');
    if (wordRemove.length != dotRemove.length) {
        return false;
    }
    return true;
}

/** 12. 숫자 천단위 , 처리 */
function stringNumber(value) { // 숫자 천단위
    return value.toLocaleString();
}

/**
 14. API parameter 인코딩
 */
function encodeStr(str, lvl) {
    if (lvl == 1) {
        return encodeURIComponent(str);
    } else if (lvl == 2) {
        return encodeURIComponent(queryEncrypt.encrypt(str));
    }
}

/** filepath에서 fileName 추출 **/
function getFileName(fileName) {
    let arr = fileName.split("/");
    return arr[arr.length - 1];
}

/** modal 1. T핀 */
function showTPin() { // T핀 선택 모달
    $('#modalTpin').modal('show');
}

// 미리보기
function previewFile(filePath) {
    let nWidth = screen.width;
    let nHeight = screen.height;
    let windowX = (screen.width - nWidth) / 2;
    let windowY = (screen.height - nHeight) / 2;
    window.open("/modal/preview_file.html?filePath=" + filePath, "viewer_popup", 'scrollbars=yes,toolbar=no,status=no,resizable=yes,menubar=no,width=' + nWidth + ',height=' + nHeight + ',top=' + windowY + ',left=' + windowX + "'");
}

function addContentTPin(contentId) {
    $('#hiddenFrame').attr('src', '/common/content_file_tpin.html?ids=' + contentId);
}

function addTPins(pins, folderId) {
    if (!checkUserLoggedIn()) {
        return;
    }
    $("#modalTpin").modal('hide');
    $.post("/modal/t-pin.html?&folderId=" + (typeof folderId !== 'undefined' || folderId === null ? folderId : ''),
        {pins: JSON.stringify(pins)})
        .done(function (res) {
            $("#modalDiv").html(res);
            $("#modalTpin").modal('show');
            $('#modalTpin').on('shown.bs.modal', function () {
                $(".modal-backdrop.in").hide();
            });
        });
}

// type,	name, contentId, fileId, folderId, contentPath
function addTPin(tpin) {
    if (typeof type == 'undefined' || type === null) {
        alert('핀 유형 값이 없습니다');
        return;
    }
    if (typeof name == 'undefined' || name === null) {
        alert('핀 이름이 없습니다');
        return;
    }
    if (typeof contentId == 'undefined' || contentId === null) {
        alert('저장할 아이디가 없습니다.');
        return;
    }
    addTPins([tpin]);
}

function requestCopyright(id, title, categoryId) {
    $("#copyrightProtectIntro").modal('hide');
    $("#copyrightModalDiv").load("/modal/E-community-copyright-write.html?id=" + id + "&title=" + title + "&categoryId=" + categoryId, function (response, status, xhr) {
        $("#copyrightProtectIntro").modal('show');
        $('#copyrightProtectIntro').on('shown.bs.modal', function () {
            $(".modal-backdrop.in").hide();
        });
    });
}

// 최근 본 영상 Modal
function recentlyVideo() {
    if (!checkUserLoggedIn()) {
        return;
    }
    if (!mRegularMember()) {
        alert("정회원만 이용 가능합니다.");
        return;
    }
    $("#modalRecentlyVideo").modal('hide');
    $("#recentlyVideoModalDiv").load("/modal/recentlyVideo.html", function (response, status, xhr) {
        $("#modalRecentlyVideo").modal('show');
        $('#modalRecentlyVideo').on('shown.bs.modal', function () {
            $(".modal-backdrop.in").hide();
            $("#reloadRecnetlyVideoBtn").trigger("click");
        });
    });
}

function downloadFiles(files) {
    if (!checkUserLoggedIn()) {
        return;
    }
    let urlBase = cdnUrl;
    files.forEach(function (file) {
        if (!file.filepath.startsWith("http")) {
            file.filepath = urlBase + file.filepath;
        }
    });
    if (files.length == 1) {
        $('#hiddenFrame').attr("src", files[0].filepath);
        return;
    }
    let prevform = $("form[name='downform']");
    let newform;
    if (prevform.length == 0) {
        newform = $("<form></form>").prop("name", "downform").prop("method", "post").prop("target", "win_multidownload").prop("action", downloadServerUrl);
    } else {
        newform = prevform;
        newform.children().remove();
    }
    newform.append("<input type='hidden' name='fileinfo' value='" + JSON.stringify(files) + "' />");
    newform.appendTo("body");
    let width, height, x, y;
    width = 550;
    height = 350;
    x = (screen.width - width) / 2;
    y = (screen.height - height) / 2;
    window.open("", "win_multidownload", "left=" + x + ", top=" + y + ", width=" + width + ", height=" + height);
    newform.submit();
}

function downloadZipFile(files) {
    let prevform = $("form[name='zipDownform']");
    let newform;
    if (prevform.length == 0) {
        newform = $("<form></form>").prop("name", "zipDownForm").prop("method", "post").prop("target", "_blank").prop("action", "/download/zip.do");
    } else {
        newform = prevform;
        newform.children().remove();
    }
    for (var i = 0; i < files.length; i++) {
        newform.append('<input type="text" name="fileinfo[' + i + '].fcode" value="' + files[i].fcode + '"/>');
        newform.append('<input type="text" name="fileinfo[' + i + '].filepath" value="' + files[i].filepath + '"/>');
    }
    newform.appendTo("body");
    let width, height, x, y;
    width = 550;
    height = 350;
    x = (screen.width - width) / 2;
    y = (screen.height - height) / 2;
    newform.submit();
}

function openVideoPlayer(videoUrl, playContinue) {
    if (typeof playContinue === 'undefined') {
        playContinue = 'N';
    }
    let url = "/common/star_player.html?url=" + encodeURIComponent(videoUrl) + "&continue=" + playContinue;
    if (currentDevice == 'MOBILE') {
        let width = screen.width;
        let height = Math.round((width * 480) / 855);
        window.open(url + "&width=" + width + "&height=" + height);
    } else {
        let isIE11 = !!navigator.userAgent.match(/Trident.*rv\:11\./);
        if (isIE11) { // 사파리 or IE일 경우 사이즈 조절
            Common.openPop(850, 550, url, "no", "win_video_player");
        } else {
            Common.openPop(855, 560, url, "no", "win_video_player");
        }
    }
}

function openMusicPlayer(musicUrl, playContinue, title, type) {
    if (typeof playContinue === 'undefined') {
        playContinue = 'N';
    }
    let url = "/common/star_music_player.html?url=" + encodeURIComponent(musicUrl) + "&continue=" + playContinue + "&title=" + (title ? title : '') + "&playType=" + (type ? type : '');
    if (currentDevice == 'MOBILE') {
        window.open(url);
    } else {
        Common.openPop(480, 190, url, "no", "win_musicplayer");
    }
}

function openMultiVideoPlayer(videoList) {
    $.ajax({
        type: 'POST',
        url: "/starMultiPlayer/save.do",
        data: JSON.stringify(videoList),
        dataType: "json",
        contentType: 'application/json',
        success: function (data) {
            let url = "/common/star_multi_player.html?multiPlayId=" + data.id;
            if (currentDevice == 'MOBILE') {
                window.open(url);
            } else {
                Common.openPop(1000, 600, url, "no", "win_player");
            }
        }
    });
}

function addPinMenu(name, categoryId, callback, url, type) {
    if (!checkUserLoggedIn(true)) {
        return false;
    }
    if (url === undefined || url === null) {
        if (typeof window.currentPageUrl === 'undefined' || currentPageUrl === null) {
            url = window.location.pathname + window.location.search;
        } else {
            url = currentPageUrl;
        }
        if (url.startsWith("//")) {
            url = url.replace("//", "/");
        }
    }
    if (typeof window.currentPageTitle !== 'undefined' && window.currentPageUrl !== null) {
        if (name === '') {
            name = window.currentPageTitle;
        } else {
            name = name + '|' + window.currentPageTitle;
        }
    }
    let data = {
        name: name,
        categoryId: categoryId,
        url: url,
        type: type || ''
    };
    $.ajax({
        type: 'POST',
        url: "/pinMenu/add.do",
        data: data,
        success: function (result) {
            if (result.success) {
                alert("핀 메뉴를 등록 하였습니다.");
                if (callback) callback(result);
            } else {
                alert(result.message);
            }
        }
    });
    return true;
}

function removePinMenu(id, callback) {
    if (!checkUserLoggedIn()) {
        return;
    }
    let data = {
        id: id
    };
    $.post("/pinMenu/delete.do", data)
        .done(function (data) {
            alert("핀 메뉴를 삭제 하였습니다.");
            if (callback) callback(data);
        });
}

function addPinMenuSettingUrl(name, categoryId, url, callback) { // 핀 메뉴 등록
    if (!checkUserLoggedIn()) {
        return false;
    }
    let data = {
        name: name,
        categoryId: categoryId,
        url: url
    };
    $.ajax({
        type: 'POST',
        url: "/pinMenu/add.do",
        data: data,
        success: function (result) {
            alert("핀 메뉴를 등록 하였습니다.");
            if (callback) {
                callback(result);
            }
        }
    });
}

// 내 교과 등록
function addPinCurri(categoryId, callback) {
    if (!checkUserLoggedIn()) {
        return;
    }
    if (!tBookSubRegularMember()) {
        alert("중/고등 정회원만 서비스를 이용하실 수 있습니다.");
        return false;
    }
    let data = {categoryId: categoryId};
    let id = null;
    $.ajax({
        type: 'POST',
        url: "/pinCurri/addMidHigh.do",
        data: data,
        async: false,
        success: function (msg) {
            if (msg.success) {
                id = msg.id;
                alert("내 교과서로 등록하였습니다.\n등록된 내 교과서는 메인에서 확인하실 수 있습니다.");
                if (callback) callback(msg);
            } else {
                alert(msg.msg);
            }
        }
    });
    return id;
}

// 내 교과 삭제
function removePinCurri(tpinId) {
    if (!checkUserLoggedIn()) {
        return;
    }
    if (!CEMember()) {
        alert("정회원 인증을 하시면 나만의 교과/평가를 설정하실 수 있습니다.");
        return false;
    }
    let data = {tpinId: tpinId};
    let result = false;
    $.ajax({
        type: 'POST',
        url: "/pinCurri/delete.do",
        data: data,
        async: false,
        success: function (data) {
            result = data.success;
            alert("내 교과서 등록을 해제 하였습니다.");
        }
    });
    return result;
}

function addToTeachingFolder(ids) {
    if (!checkUserLoggedIn()) {
        return;
    }
    $("#teachingBoardUploadDiv").load("/modal/teaching_board_select.html?ids=" + ids.join(","),
        function (response, status, xhr) {
            $("#add_teaching_board").modal('show');
            $('#add_teaching_board').on('shown.bs.modal', function () {
                $(".modal-backdrop.in").hide();
            });
        }
    );
}

function addTeaching(contents) {
    if (!checkUserLoggedIn()) {
        return;
    }
    let url = '';
    if (contents) {
        url = "/teaching/E-com-teaching.html?contents=" + encodeURIComponent(JSON.stringify(contents));
    } else {
        url = "/teaching/E-com-teaching.html";
    }
    var width = 1920;
    var height = 1080;
    var multiview = window.open(url, "win_teaching_board", "left=0, top=0, width=1920, height=1080, fullscreen=yes, resizable=yes");
    if (currentDevice != 'MOBILE') multiview.resizeTo(width, height);
}

function openCurriCdDownload() {
    if (!checkUserLoggedIn()) {
        return;
    }
    if (!newRegularMember()) {
        alert("정회원만 이용할 수 있는 기능입니다.");
        return;
    }
    let url = "http://bfile.tsherpa.co.kr/popup/pop_cd/pop_cd.aspx";
    if (currentDevice == 'MOBILE') {
        window.open(url);
    } else {
        Common.openPop(957, 1170, url, "yes");
    }
}

function addfav(u, t) {
    try {
        window.external.AddFavorite(u, t);
    } catch (e) {
        alert("해당브라우저는 즐겨찾기 추가기능이 지원되지 않습니다.\n\n수동으로 즐겨찾기에 추가해주세요.");
    }
}

function isValidateUrl(value) {
    const expression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;
    const regexp = new RegExp(expression);
    return regexp.test(value);
}

/**
 * Format bytes as human-readable text.
 *
 * @param bytes Number of bytes.
 * @param si True to use metric (SI) units, aka powers of 1000. False to use
 *           binary (IEC), aka powers of 1024.
 * @param dp Number of decimal places to display.
 *
 * @return Formatted string.
 */
function humanFileSize(bytes, si, dp) {
    if (si === undefined) {
        si = false;
    }
    if (dp === undefined) {
        dp = 1;
    }
    const thresh = si ? 1000 : 1024;
    if (Math.abs(bytes) < thresh) {
        return bytes + ' B';
    }
    const units = si
        ? ['KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']
        : ['KiB', 'MiB', 'GiB', 'TiB', 'PiB', 'EiB', 'ZiB', 'YiB'];
    let u = -1;
    const r = Math.pow(10, dp);
    do {
        bytes /= thresh;
        ++u;
    } while (Math.round(Math.abs(bytes) * r) / r >= thresh && u < units.length - 1);
    return bytes.toFixed(dp) + ' ' + units[u];
}

function openChasi(curriId, id, onlyUrl, url) {
    if (!checkUserLoggedIn()) {
        return;
    }
    if (!newRegularMember()) {
        alert("정회원만 이용할수 있는 기능입니다");
        return;
    }
    var width = 1920;
    var height = 1080;
    if (onlyUrl && (url !== '' && url !== undefined)) {
        let newUrl = url;
        if (!newUrl.startsWith("http")) {
            newUrl = cdnUrl.replace("https:/", "http:/") + newUrl;
        }
        var multiview = window.open(newUrl, "win_popchasi", "left=0, top=0, width=1920, height=1080, fullscreen=yes, resizable=yes");
        if (currentDevice !== 'MOBILE') multiview.resizeTo(width, height);
    } else {
        var multiview = window.open("/curri/E-curri-chasi.html?cateId=" + id, "win_popchasi", "left=0, top=0, width=1920, height=1080, fullscreen=yes, resizable=yes");
        if (currentDevice !== 'MOBILE') multiview.resizeTo(width, height);
    }
    Storages.localStorage.set('curri.latest.unit.chasi_' + curriId, id);
}

function openCommunityChasi(id, onlyUrl, url) {
    if (!checkUserLoggedIn()) {
        return;
    }
    if (!newRegularMember()) {
        alert("정회원만 이용할수 있는 기능입니다");
        return;
    }
    let w = screen.width;
    let h = screen.height;   // 660
    if (onlyUrl && (url !== '' && url !== undefined)) {
        let newUrl = url;
        if (!newUrl.startsWith("http")) {
            newUrl = cdnUrl.replace("https:/", "http:/") + newUrl;
        }
        if (currentDevice == 'MOBILE') {
            window.open(newUrl);
        } else {
            Common.openPop(w, h, newUrl, "no", "win_popchasi", "yes");
        }
    } else {
        let url = "/curri/E-curri-chasi.html?cateId=" + id;
        if (currentDevice == 'MOBILE') {
            window.open(url);
        } else {
            Common.openPop(w, h, url, "no", "win_popchasi", "yes");
        }
    }
}

function inquiry() {
    if (!checkUserLoggedIn()) {
        return;
    }
    let url = "/modal/inquiry.html";
    $("#inquiryModal").load(url, function (response, status, xhr) {
        $("#inquiry").modal('show');
    });
}

function mobileInquiry() {
    if (!checkUserLoggedIn()) {
        return;
    }
    location.href = "/modal/inquiry_mobile.html";
}

function checkMember(ele) {
    if (!checkUserLoggedIn()) {
        return;
    }
    switch (ele) {
        case 1 :
            Common.openPop(screen.width = 840, screen.height = 800, (siteAttribute.exam_inquiry_site) ? siteAttribute.exam_inquiry_site : 'http://e.tsherpa.co.kr/curri/inquiry.aspx', 'yes');
            break;
        case 2 :
            if (!examRegularMember()) {
                alert("정회원만 시험지마법사가 가능합니다.");
                return;
            } else {
                window.open((siteAttribute.exam_wiz_site) ? siteAttribute.exam_wiz_site : 'http://exam2.tsherpa.co.kr/mypaper/pop_editpaper.aspx', '_blank');
            }
            break;
        case 3 :
            if (!examRegularMember()) {
                alert("정회원만 보충 문제 은행이 가능합니다.");
                return;
            } else {
                window.open((siteAttribute.exam_bank_site) ? siteAttribute.exam_bank_site : 'http://exam2.tsherpa.co.kr/mypaper2/pop_mypaper.aspx', '_blank');
            }
            break;
    }
}

function showOpenPopup() {
    $("#openPopup").modal("show");
}

/** TOP 버튼 동작(퍼블) */
$(document).ready(function () {
    $('.to_pagetop').click(function () {
        $('html,body').animate({scrollTop: 0}, 'slow');
        return false;
    });
    $(window).on('scroll', function () {
        var nDocH = $(document).height();
        var nWinH = $(window).height();
        var nMaxH = nDocH - nWinH;
        var scrollTop = $(window).scrollTop();
        if (scrollTop > 50) {
            $('.to_pagetop').css({'opacity': 1});
        } else {
            $('.to_pagetop').css({'opacity': 0});
        }
        if (scrollTop > nMaxH - 280 + 45) {
            $('.to_pagetop').css({'bottom': scrollTop - (nMaxH - 325)});
        } else {
            $('.to_pagetop').css({'bottom': '45px'});
        }
    });
});

function saveContentView(id, contentPath) {
    $.post("/contentView/save.do", {id: id, contentPath: contentPath}).done(function (data) {
    });
}

if (window.Handlebars) {
    Handlebars.registerHelper('ifEquals', function (arg1, arg2, options) {
        return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifNotEquals', function (arg1, arg2, options) {
        return (arg1 !== arg2) ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifStringEmpty', function (arg1, options) {
        return (arg1 == '') ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifStringNotEmpty', function (arg1, options) {
        return (arg1 !== '') ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifNull', function (arg1, options) {
        return (arg1 = null) ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifNotNull', function (arg1, options) {
        return (arg1 != null) ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifFilePathEmpty', function (arg1, options) {
        return (arg1 == '' || arg1 == '/') ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifFilePathNotEmpty', function (arg1, options) {
        return (arg1 !== '' && arg1 != '/') ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifStringContains', function (arg1, arg2, options) {
        return (arg1.indexOf(arg2) >= 0) ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifStringNotContains', function (arg1, arg2, options) {
        return (arg1.indexOf(arg2) < 0) ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifToStringNotEmpty', function (arg1, options) {
        arg1 = String(arg1);
        return (arg1 != 'undefined' && arg1 != null && arg1 != '') ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifArrayEmpty', function (list, options) {
        return (list.length == 0) ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('ifArrayNotEmpty', function (list, options) {
        return (list.length > 0) ? options.fn(this) : options.inverse(this);
    });
    Handlebars.registerHelper('encodeString', function (inputData) {
        return new Handlebars.SafeString(inputData);
    });
    Handlebars.registerHelper('dateFormat', function (date) {
        return moment(date).format('YYYY.MM.DD');
    });
    Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
        switch (operator) {
            case '==':
                return (v1 == v2) ? options.fn(this) : options.inverse(this);
            case '===':
                return (v1 === v2) ? options.fn(this) : options.inverse(this);
            case '!=':
                return (v1 != v2) ? options.fn(this) : options.inverse(this);
            case '!==':
                return (v1 !== v2) ? options.fn(this) : options.inverse(this);
            case '<':
                return (v1 < v2) ? options.fn(this) : options.inverse(this);
            case '<=':
                return (v1 <= v2) ? options.fn(this) : options.inverse(this);
            case '>':
                return (v1 > v2) ? options.fn(this) : options.inverse(this);
            case '>=':
                return (v1 >= v2) ? options.fn(this) : options.inverse(this);
            case '&&':
                return (v1 && v2) ? options.fn(this) : options.inverse(this);
            case '||':
                return (v1 || v2) ? options.fn(this) : options.inverse(this);
            default:
                return options.inverse(this);
        }
    });
    Handlebars.registerHelper('ifNumberCond', function (arg1, operator, arg2, options) {
        let v1 = Number(arg1);
        let v2 = Number(arg2);
        switch (operator) {
            case '==':
                return (v1 == v2) ? options.fn(this) : options.inverse(this);
            case '===':
                return (v1 === v2) ? options.fn(this) : options.inverse(this);
            case '!=':
                return (v1 != v2) ? options.fn(this) : options.inverse(this);
            case '!==':
                return (v1 !== v2) ? options.fn(this) : options.inverse(this);
            case '<':
                return (v1 < v2) ? options.fn(this) : options.inverse(this);
            case '<=':
                return (v1 <= v2) ? options.fn(this) : options.inverse(this);
            case '>':
                return (v1 > v2) ? options.fn(this) : options.inverse(this);
            case '>=':
                return (v1 >= v2) ? options.fn(this) : options.inverse(this);
            case '&&':
                return (v1 && v2) ? options.fn(this) : options.inverse(this);
            case '||':
                return (v1 || v2) ? options.fn(this) : options.inverse(this);
            default:
                return options.inverse(this);
        }
    });
    Handlebars.registerHelper('json', function (context) {
        return JSON.stringify(context);
    });
    Handlebars.registerHelper('encodeURI', function (context) {
        return encodeURIComponent(context);
    });
}

function alpineToObject(alpComponent) {
    return JSON.parse(JSON.stringify(alpComponent));
}

function getAlpineComponent(id) {
    let als = document.querySelectorAll('[x-data]');
    for (var i = 0; i < als.length; i++) {
        if (als[i].id === id) {
            return als[i].__x.getUnobservedData();
        }
    }
    return null;
}

function openHiddenFrame(url) {
    let iFrame = $('#hiddenFrame');
    if (iFrame.length == 0) {
        $('<iframe name="hiddenFrame" id="hiddenFrame" style="visibility: hidden;position: absolute; left: 0; top: 0; height:0; width:0; border: none;"></iframe>').appendTo('body');
        iFrame = $('#hiddenFrame');
    }
    let iFrameParent = iFrame.parent();
    iFrame.remove();
    iFrame.attr('src', url);
    iFrameParent.append(iFrame);
}

function openMaxWindow(url) {
    let w = screen.width;
    let h = screen.height;   // 660
    Common.openPop(w, h, url, "no", "win_popchasi", "yes");
}

function openNotification() {
    if (currentDevice == "MOBILE") {
        alert("알림장은 모바일에서 지원되지 않습니다.\r\nPC에서 확인해주세요.");
        return false;
    }
    if (!checkUserLoggedIn()) {
        return;
    }
    if (!newRegularMember2()) {
        alert("정회원만 이용가능합니다.");
        return;
    }
    window.open("http://note.tsherpa.co.kr/Sites/Chunjae/Web/client/index.html", "_blank");
}

function openMultiMedia() {
    if (!checkUserLoggedIn()) {
        return;
    }
    if (!newRegularMember()) {
        alert("정회원만 이용가능합니다.");
        return;
    }
    window.open("http://multi.tsherpa.co.kr/multi/Main.aspx", "_blank");
}

function openTDvd(tBook) {
    if (!checkUserLoggedIn()) {
        return;
    }
    if (!CEMember()) {
        alert("중,고등 정회원만 서비스를 이용하실 수 있습니다.");
        return;
    }
    if ($('#openTDvdButton').hasClass("disabled")) return;
    $('#openTDvdButton').addClass("disabled");
    $('#tDvdModalDiv').load("/modal/tDVD.html?tBook=" + tBook, function (response, status, xhr) {
        $('#tDvdPopup').modal('show');
        $('#openTDvdButton').removeClass("disabled");
    });
}

// 인증 팝업 (certification.html을 include)
function showCertificationModal(memberType, certFileName, oldSize, callType, elem) {
    elem.load("/modal/certification.html",
        {memberType: memberType, certFileName: certFileName, oldSize: oldSize, callType: callType},
        function (response, status, xhr) {
            $("#certification").modal("show");
        });
}

/**
 허용 파일 형식
 filePath: 파일 선택 시 입력되는 파일경로
 typeArr: 배열형태로 지정된 파일형식의 묶음. ex) ["gif", "jpg", "jpeg"]...
 */
function allowFiles(filePath, typeArr) {
    let result = false;
    if (!filePath) {
        return result;
    }
    filePath = filePath.toLowerCase().replace(/ /g, "").trim();
    let arr = filePath.split('.');
    let suffix = arr[arr.length - 1];
    let idx = _.indexOf(typeArr, suffix);
    if (idx != -1) {
        result = true;
    }
    return result;
}

/**
 * --------------------------------------------------------------------------
 *  common.js
 * --------------------------------------------------------------------------
 */

var front = front || {};
front.common = front.common || {};
front.common = (function () {
    var init = function () {
        this.a();
        this.inputFile();
        this.commonHandler();
    };
    var a = function () {
        $('a[href="#"]').on('click', function (e) {
            e.preventDefault();
        });
    };
    var inputFile = function () {
        $('.custom-file-input').on('change', function () {
            let fileName = $(this).val().split('\\').pop();
            $(this).siblings('.custom-file-label').addClass('selected').html(fileName);
        });
    };
    var commonHandler = function () {
        $(document).on({
            'show.bs.modal': function () {
                var zIndex = 1040 + (10 * $('.modal:visible').length);
                $(this).css('z-index', zIndex);
                setTimeout(function () {
                    $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
                }, 0);
            },
            'hidden.bs.modal': function () {
                if ($('.modal:visible').length > 0) {
                    // restore the modal-open class to the body element, so that scrolling works
                    // properly after de-stacking a modal.
                    setTimeout(function () {
                        $(document.body).addClass('modal-open');
                    }, 0);
                }
            }
        }, '.modal');
    };
    return {
        a: a,
        commonHandler: commonHandler,
        inputFile: inputFile,
        init: init
    };
})();
$(function () {
    front.common.init();
});
front.loading = front.loading || (function () {
    const showLoading = function () {
        $('._loading').show();
    };
    const hideLoading = function () {
        $('._loading').hide();
    };

    const isLoading = function () {
        $('._loading').is(':visible');
    };

    return {
        showLoading: showLoading,
        hideLoading: hideLoading,
        isLoading: isLoading
    };
})();
// 로딩 이미지 제어
(function () {
    let delayShow = 1000;
    let delayHide = 400;
    let tShow = null;
    let tHide = null;
    let processCount = 0;
    let isLoading = false;
    $(document).ajaxStart(function () {
        processCount++;
        if (processCount > 0) clearTimeout(tHide);
        tShow = setTimeout(function () {
            if (processCount > 0 && isLoading == false) {
                front.loading.showLoading();
                isLoading = true;
            }
        }, delayShow);
    });
    $(document).ajaxStop(function () {
        processCount--;
        if (processCount == 0) clearTimeout(tShow);
        tHide = setTimeout(function () {
            if (processCount == 0 && isLoading == true) {
                front.loading.hideLoading();
                isLoading = false;
            }
        }, delayHide);
    });
})();
