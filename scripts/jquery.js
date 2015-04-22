$(function(){
    $('.fadein img:gt(0)').hide();
    setInterval(function(){
      $('.fadein :first-child').fadeOut(700)
         .next('img').fadeIn(700)
         .end().appendTo('.fadein');}, 
      10000);
});