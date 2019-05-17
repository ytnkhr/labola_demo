# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).on 'turbolinks:load', ->
#       var listContents = $("#more-text li").length;
#       $("#more-text").each(function(){

#     #   //最初に表示させるアイテムの数
#       var Num = 6,
#           gtNum = Num-1;

#     #   //最初はmoreボタン表示にし、
#       $(this).find('#more_btn').show();
#       $(this).find('#close_btn').hide();
#       //10行目まで表示
#       $(this).find("li:not(:lt("+Num+"))").hide();

#     #   //moreボタンがクリックされた時
#       $('#more_btn').click(function(){

#          //Numに+3ずつしていく = 3行ずつ追加する
#           Num +=$("#more-text li").length;
#           $(this).parent().find("li:lt("+Num+")").slideDown();
#           //liの個数よりNumが多い時、
#           if(listContents <= Num){
#               $('#more_btn').hide();

#             #   //「閉じる」がクリックされたら、
#               $('#close_btn').click(function(){
#                 $(this).parent().find("li:gt("+gtNum+")").slideUp();//11行目以降は非表示にし、
#                 $(this).hide();//閉じるボタンを非表示
#                 $('#more_btn').show();//moreボタン表示に
#               });
#           }
#       });
#   });   
    
    
