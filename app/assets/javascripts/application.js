// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

      //liの個数を取得
$(document).on('turbolinks:load', function() { 
      var listContents = $("#more-text li").length;
      $("#more-text").each(function(){

      //最初に表示させるアイテムの数
      var Num = 6,
          gtNum = Num-1;

      //最初はmoreボタン表示にし、
      $(this).find('#more_btn').show();
      $(this).find('#close_btn').hide();
      //10行目まで表示
      $(this).find("li:not(:lt("+Num+"))").hide();

      //moreボタンがクリックされた時
      $('#more_btn').click(function(){

         //Numに+3ずつしていく = 3行ずつ追加する
          Num +=$("#more-text li").length;
          $(this).parent().find("li:lt("+Num+")").slideDown();
          //liの個数よりNumが多い時、
          if(listContents <= Num){
              $('#more_btn').hide();

              //「閉じる」がクリックされたら、
              $('#close_btn').click(function(){
                $(this).parent().find("li:gt("+gtNum+")").slideUp();//11行目以降は非表示にし、
                $(this).hide();//閉じるボタンを非表示
                $('#more_btn').show();//moreボタン表示に
              });
          }
      });
  });   
    
    
});

 
