// Generated by CoffeeScript 1.4.0
/*

  コンパイルは、  /views/coffee/　にて
  coffee --bare --compile --output ../../public/javascripts *.coffee
  または
  coffee --watch --bare --compile --output ../../public/javascripts *.coffee
*/

var appendPageHTML, clog, createDateString, createPageHTML, createPageHTMLclosure, dispTutArrowImg, dispTutInfoP, disp_WelcomeToHanselImg, disp_explain_UI, disp_final_logo, disp_final_subtitle, disp_massage_2, getItemHTML, getTwitterTest, getTwitterTest2, hideArrowImg, hide_explain_UI, hide_final_logo, hide_final_subtitle, hide_massage_2, onEndSearchFB, onEndSearchTwitter, onReadyHTML, tutrialInit;

clog = function(str) {
  return console.log(str);
};

onReadyHTML = function() {
  return searchTwitter();
};

onEndSearchTwitter = function(tweetsHTML) {
  appendPageHTML(tweetsHTML);
  appendPageHTML(getItemHTML());
  return $("#pageBox").turn();
};

onEndSearchFB = function(fbHTML) {
  appendPageHTML(fbHTML);
  return $("#pageBox").turn();
};

appendPageHTML = function(itemsHTML) {
  var D, dateStr, pageHTML;
  D = new Date();
  dateStr = createDateString(D.getFullYear(), D.getMonth(), D.getDate());
  pageHTML = createPageHTML(itemsHTML, dateStr);
  $("#pageBox").append(pageHTML);
  return clog("append_end");
};

createPageHTMLclosure = function() {
  var pageSum;
  pageSum = 0;
  return function(itemsHTML, dateString) {
    var pageHTML, right_left;
    clog("---------- START createPageHTML ----------");
    pageSum++;
    if (pageSum % 2 === 1) {
      right_left = "right";
    }
    if (pageSum % 2 === 0) {
      right_left = "left";
    }
    clog(pageSum + ':' + right_left);
    pageHTML = '<div class="page ' + right_left + 'Page">' + '<img src="images/bookParts/note_' + right_left + '.jpg" class="pageBgImg" height="1156" width="824"/>' + '<div class="pageContent">' + '<div class="pageHeader">' + '<p class="date">' + dateString + '</p>' + '</div>' + '<div class="itemBox">';
    pageHTML += itemsHTML;
    pageHTML += '</div>' + '</div>' + '</div>';
    clog(pageHTML);
    clog("---------- END createPageHTML----------");
    return pageHTML;
  };
};

createPageHTML = createPageHTMLclosure();

createDateString = function(year, month, date, day) {
  var Month;
  Month = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  return Month[month] + ' ' + date + ', ' + year;
};

getItemHTML = function() {
  var itemsHTML;
  itemsHTML = '';
  itemsHTML += getTwitterTest();
  itemsHTML += getTwitterTest2();
  itemsHTML += getTwitterTest();
  itemsHTML += getTwitterTest2();
  itemsHTML += getTwitterTest();
  return itemsHTML;
};

getTwitterTest = function() {
  return '<div class="item twitter"><!-- twitter -->' + '<img class="serviceIcon" src="images/serviceIcon/twitter.png" alt="Twitterより"/>' + '<p class="message">おめ〜〜！！内定祝いだぁ〜〜〜〜！！ねこまんま三人確定！ｗ＠モスコぉ〜！！</p>' + '<p class="time">2:33 PM</p>' + '</div>';
};

getTwitterTest2 = function() {
  return '<div class="item twitter"><!-- twitter -->' + '<img class="serviceIcon" src="images/serviceIcon/twitter.png" alt="Twitterより"/>' + '<p class="message">ひゃっほーーい！！いぇーーーーーい〜〜！！</p>' + '<p class="time">2:33 PM</p>' + '</div>';
};

/* ---------チュートリアル---------
*/


tutrialInit = function() {
  var arrowTimer;
  setTimeout(disp_WelcomeToHanselImg, 1500);
  setTimeout(dispTutInfoP, 3000);
  arrowTimer = setTimeout(dispTutArrowImg, 4500);
  $("#pageBox").bind("turning", function(event, page, view) {
    console.log(" - - - - turning event fire! - - - - ");
    console.log("page:" + page);
    console.log("view:" + view);
    hide_final_logo();
    hide_final_subtitle();
    hide_explain_UI();
    return hide_massage_2();
  });
  return $("#pageBox").bind("turned", function(event, page, view) {
    console.log("-------- turned event fire! --------");
    console.log("page:" + page);
    console.log("view:" + view);
    clearTimeout(arrowTimer);
    hideArrowImg();
    if (page === 6 || page === 7) {
      setTimeout(disp_explain_UI, 500);
      arrowTimer = setTimeout(dispTutArrowImg, 4300);
    }
    if (page === 8 || page === 9) {
      setTimeout(disp_massage_2, 500);
      arrowTimer = setTimeout(dispTutArrowImg, 5000);
    }
    if (page === 10) {
      setTimeout(disp_final_logo, 1500);
      return setTimeout(disp_final_subtitle, 4000);
    }
  });
};

disp_WelcomeToHanselImg = function() {
  return $("#welcomeToHanselImg").css({
    opacity: 1
  });
};

dispTutInfoP = function() {
  return $("#hanselMockTutrialInfo").css({
    opacity: 1
  });
};

dispTutArrowImg = function() {
  return $("#tutrialArrow").css({
    opacity: 0.8,
    top: "303px",
    left: "73%"
  });
};

hideArrowImg = function() {
  var $arrow;
  $arrow = $("#tutrialArrow");
  $arrow.css({
    opacity: 0
  });
  return setTimeout((function() {
    return $arrow.css({
      left: 0,
      top: "100%"
    });
  }), 1000);
};

disp_explain_UI = function() {
  return $("#tutrial_explainUI").css({
    opacity: 0.8,
    top: "528px",
    left: "7%"
  });
};

hide_explain_UI = function() {
  return $("#tutrial_explainUI").css({
    opacity: 0,
    top: "-100px"
  });
};

disp_massage_2 = function() {
  return $("#tutrial_message2").css({
    opacity: 0.8,
    top: "468px",
    left: "20%"
  });
};

hide_massage_2 = function() {
  return $("#tutrial_message2").css({
    opacity: 0,
    top: "-100px"
  });
};

disp_final_logo = function() {
  return $("#finalHanselLogo").css({
    opacity: 1
  });
};

hide_final_logo = function() {
  return $("#finalHanselLogo").css({
    opacity: 0
  });
};

disp_final_subtitle = function() {
  return $("#finalSubTitle").css({
    opacity: 1
  });
};

hide_final_subtitle = function() {
  return $("#finalSubTitle").css({
    opacity: 0
  });
};

/* ---------ここまでチュートリアル---------
*/

