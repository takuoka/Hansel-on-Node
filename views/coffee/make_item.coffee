
###
Twitter関係
###
searchTwitter = () ->
    $.ajax({
        # url: 'http://search.twitter.com/search.json?' + jQuery.param(query),
        url: 'https://api.twitter.com/1/statuses/user_timeline.json?screen_name=Moscohan',
        dataType: 'jsonp',
        success: (data) ->
            tweetsHTML = '';
            step = 1;
            for i in [0..19] by step
                # clog "--" + i + "--"+data[i].text + "--" + data[i].created_at
                tweetsHTML += createTwitterItemHTML( data[i].text, data[i].created_at )

            onEndSearchTwitter(tweetsHTML)
    });

createTwitterItemHTML = ( message, time )->
    tweetHTML = '<div class="item twitter"><!-- twitter -->'+
                  '<img class="serviceIcon" src="images/serviceIcon/twitter.png" alt="Twitterより"/>'+
                  '<p class="message">' + message + '</p>'+
                  '<p class="time">' + time + '</p>'+
                '</div>';

createFBItemHTML = ( message)->
    feedHTML = '<div class="item twitter"><!-- twitter -->'+
                  '<img class="serviceIcon" src="images/serviceIcon/fb.png" alt="FBより"/>'+
                  '<p class="message">' + message + '</p>'+
                '</div>';


#searchFB = () ->
  #FB.api ('/me/likes','GET',(res) -> alert res)
  `
  function searchFB(){

  FB.api('/me/feed', function(response) {
        var fbHTML;
         //console.log('Good to see you, ' + response.name + '.');
         console.log(response.data.length);
         for(var i = 0 ; i < response.data.length ; i++){
           console.log(response.data[i].story);
           fbHTML += createFBItemHTML(response.data[i].story);
          }
          onEndSearchFB(fbHTML);
       });
  }
  `




# FB初期化
###FB.init = ({
    appId  : '1682711918536186'
    status : true # check login status
    cookie : true # enable cookies to allow the server to access the session
    xfbml  : true  # parse XFBML
})###

`
FB.init ({
    appId  : '1682711918536186',
    status : true, // check login status
    cookie : true, // enable cookies to allow the server to access the session
    xfbml  : true  // parse XFBML
});

`


# ログイン状態を確認
###FB.getLoginStatus = ((response) ->
    if response.status is 'connected'
        alert "ログインしてます"
        #ログイン後の処理
        #FB.api = ('/me', (response) -> alert response.name )
    else
       #login()#ログインしてないのでログインしてもらう
        alert "ログインしてね"
    )
FB.getLoginStatus()###

# ログインさせる
###FB.login = ((response) ->
    if response.authResponse
        #FB.api = ('/me', (response) -> clog 'こんにちは、 ' + response.name + 'さん')
    else alert "キャンセルしました"
    )
###
`
//うごく
var getLogin;

getLogin = FB.getLoginStatus(function(response) {
  if (response.status === 'connected') {
    var uid = response.authResponse.userID;
    var accessToken = response.authResponse.accessToken;
    //alert("ログイン");
  } else if (response.status === 'not_authorized') {
    alert("未認可");
    FB.login(function(response) {
   if (response.authResponse) {
     console.log('Welcome!  Fetching your information.... ');
     FB.api('/me', function(response) {
       console.log('Good to see you, ' + response.name + '.');
     });
   } else {
     console.log('User cancelled login or did not fully authorize.');
   }
 });
  } else {
    alert("それ以外");
    FB.login(function(response) {
   if (response.authResponse) {
     console.log('Welcome!  Fetching your information.... ');
     FB.api('/me', function(response) {
       console.log('Good to see you, ' + response.name + '.');
     });
   } else {
     console.log('User cancelled login or did not fully authorize.');
   }
 });
  }
 });
`

#ボタンクリックでログインしたい

###LoginFB = () ->
  alert(getLogin)
  getLogin()###

###`



FB.getLoginStatus(function(response) {
  if (response.status === 'connected') {
    var uid = response.authResponse.userID;
    var accessToken = response.authResponse.accessToken;
    alert("ログイン");
  } else if (response.status === 'not_authorized') {
    alert("未認可");
  } else {
    alert("それ以外");
  }
 });


 FB.login(function(response) {
   if (response.authResponse) {
     console.log('Welcome!  Fetching your information.... ');
     FB.api('/me', function(response) {
       console.log('Good to see you, ' + response.name + '.');
     });
   } else {
     console.log('User cancelled login or did not fully authorize.');
   }
 });


`
