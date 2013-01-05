###

  コンパイルは、  /views/coffee/　にて
  coffee --bare --compile --output ../../public/javascripts *.coffee
  または
  coffee --watch --bare --compile --output ../../public/javascripts *.coffee

###

clog = (str) -> console.log(str)


onReadyHTML = ->
  searchTwitter()


onEndSearchTwitter = (tweetsHTML)->
  appendPageHTML tweetsHTML
  appendPageHTML getItemHTML()
  $("#pageBox").turn()
  #$("#pageBox").turn({page:1})


onEndSearchFB = (fbHTML) ->
  appendPageHTML fbHTML
  $("#pageBox").turn()


# アイテムのHTMLから、ページのHTMLを作って追加する
appendPageHTML = ( itemsHTML )->
  D = new Date()
  dateStr = createDateString( D.getFullYear(), D.getMonth(), D.getDate() )
  pageHTML = createPageHTML( itemsHTML, dateStr )
  $("#pageBox").append( pageHTML )
  clog "append_end";


# アイテムのHTMLと日付 からページのHTMLを生成する関数のクロージャ
createPageHTMLclosure = ->
  pageSum = 0
  return (itemsHTML, dateString)->
    clog "---------- START createPageHTML ----------"
    pageSum++
    right_left = "right" if pageSum % 2 == 1
    right_left = "left"  if pageSum % 2 == 0
    clog pageSum+':'+right_left
    pageHTML = '<div class="page '+right_left+'Page">' +
                    '<img src="images/bookParts/note_'+right_left+'.jpg" class="pageBgImg" height="1156" width="824"/>' +
                    '<div class="pageContent">' +
                        '<div class="pageHeader">' +
                            '<p class="date">' + dateString + '</p>' +
                        '</div>' +
                        '<div class="itemBox">';
    pageHTML +=             itemsHTML;
    pageHTML +=         '</div>' +
                    '</div>' +
                '</div>';
    clog pageHTML
    clog "---------- END createPageHTML----------"
    return pageHTML

# クロージャから関数本体を生成
createPageHTML = createPageHTMLclosure()



# createDateString( D.getFullYear(), D.getMonth(), D.getDate() );
createDateString = ( year, month, date, day )->
  Month = ['January','February','March','April','May','June','July','August','September','October','November','December',]
  #Day = [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', ]
  # January 20, 2002
  return Month[month] + ' ' + date + ', ' + year



# ここでページの内容を追加する
getItemHTML = ->
  itemsHTML = ''
  itemsHTML += getTwitterTest()
  itemsHTML += getTwitterTest2()
  itemsHTML += getTwitterTest()
  itemsHTML += getTwitterTest2()
  itemsHTML += getTwitterTest()
  return itemsHTML


getTwitterTest = ->
  return '<div class="item twitter"><!-- twitter -->'+
              '<img class="serviceIcon" src="images/serviceIcon/twitter.png" alt="Twitterより"/>'+
              '<p class="message">おめ〜〜！！内定祝いだぁ〜〜〜〜！！ねこまんま三人確定！ｗ＠モスコぉ〜！！</p>'+
              '<p class="time">2:33 PM</p>'+
         '</div>'


getTwitterTest2 = ->
  return '<div class="item twitter"><!-- twitter -->'+
              '<img class="serviceIcon" src="images/serviceIcon/twitter.png" alt="Twitterより"/>'+
              '<p class="message">ひゃっほーーい！！いぇーーーーーい〜〜！！</p>'+
              '<p class="time">2:33 PM</p>'+
         '</div>'




















### ---------チュートリアル--------- ###

tutrialInit = ->
  setTimeout(disp_WelcomeToHanselImg, 1500)
  setTimeout(dispTutInfoP, 3000)
  arrowTimer = setTimeout(dispTutArrowImg, 4500)

  # ページめくり中に発火するイベント
  $("#pageBox").bind "turning", (event, page, view) ->
    console.log " - - - - turning event fire! - - - - "
    console.log "page:"+page
    console.log "view:"+view
    hide_final_logo()
    hide_final_subtitle()
    hide_explain_UI()
    hide_massage_2()

  # ページめくった後に発火するイベント
  $("#pageBox").bind "turned", (event, page, view) ->
    console.log "-------- turned event fire! --------"
    console.log "page:"+page
    console.log "view:"+view
    clearTimeout(arrowTimer)
    hideArrowImg()
    if page == 6 or page == 7
      setTimeout(disp_explain_UI, 500)
      arrowTimer = setTimeout(dispTutArrowImg,4300)
    if page == 8 or page == 9
      setTimeout(disp_massage_2, 500)
      arrowTimer = setTimeout(dispTutArrowImg,5000)
    if page == 10
      setTimeout(disp_final_logo, 1500)
      setTimeout(disp_final_subtitle, 4000)




disp_WelcomeToHanselImg = ->
  $("#welcomeToHanselImg").css opacity: 1
dispTutInfoP = ->
  $("#hanselMockTutrialInfo").css opacity: 1


dispTutArrowImg = ->
  $("#tutrialArrow").css
    opacity: 0.8
    top: "303px"
    left: "73%"
hideArrowImg = ->
  $arrow = $("#tutrialArrow")
  $arrow.css({opacity:0})
  setTimeout( (()->$arrow.css(left: 0,top: "100%")) ,1000)


disp_explain_UI = ->
  $("#tutrial_explainUI").css
    opacity: 0.8
    top: "528px"
    left: "7%"
hide_explain_UI = ->
  $("#tutrial_explainUI").css
    opacity: 0
    top: "-100px"


disp_massage_2 = ->
  $("#tutrial_message2").css
    opacity: 0.8
    top: "468px"
    left: "20%"
hide_massage_2 = ->
  $("#tutrial_message2").css
    opacity: 0
    top: "-100px"

disp_final_logo = -> $("#finalHanselLogo").css(opacity:1)
hide_final_logo = -> $("#finalHanselLogo").css(opacity:0)
disp_final_subtitle = -> $("#finalSubTitle").css(opacity:1)
hide_final_subtitle = -> $("#finalSubTitle").css(opacity:0)

### ---------ここまでチュートリアル--------- ###






