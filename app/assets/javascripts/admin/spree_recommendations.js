$(document).ready(function(){
  $("#searchtext").change(function(){
    $.ajax({
      type: "POST",
      url: $(this).attr("data-live-search-url"),
      data: {"q": $(this).val()},
      success: function(html) {
        displayRow(html);
      }
    });
  }); 

  function displayRow(html){
    $("#searchtext").after(html);
  }  
});
