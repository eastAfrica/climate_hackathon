$(document).ready(function(){

  $("#create_report").onclick({
      let XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

      smsSender: function (username) {
        let xhr = new XMLHttpRequest();
        let user = username;
        xhr.open("GET", "https://platform.clickatell.com/messages/http/send?apiKey=Mf1Wwh1VTuy7rE6EFOT_gQ==&to=250734598922&content=" + user + " needs+your+help+Emergency", true);
        xhr.onreadystatechange = function(){
          if (xhr.readyState === 4 && xhr.status === 200){
            console.log('success');
          }
        };
        xhr.send();
      }
    
  });

});
