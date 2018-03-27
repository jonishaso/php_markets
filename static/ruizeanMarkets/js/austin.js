var tt = '<{$ajaxUrl}>';
alert(tt);
var pageNo = 1;
$(window).scroll(function() {
    if($(window).scrollTop() == $(document).height() - $(window).height()) {
           // ajax call get data from server and append to the div
           $.post("<{$ajaxUrl}>"+pageNo, {start:1, n:50},function(txt){
           	alert(txt);
           },"text");
           
           
    }
});