// require active_admin/base     // line disabled since it includes an old version!
// require jquery.tokeninput
//= require jquery
//= require jquery_ujs
//= require jquery-ui

/* Active Admin JS */
/* copied from 'app/assets/javascripts/base.js in active_admin source code */
$(function(){
  $(".datepicker").datepicker({dateFormat: 'yy-mm-dd'});

  $(".clear_filters_btn").click(function(){
    window.location.search = "";
    return false;
  });
});
/* END COPY */