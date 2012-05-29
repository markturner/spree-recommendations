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
    if ($("#RecommendationResults").length > 0){
      $("#RecommendationResults").replaceWith(html);
    }
    else{
      $("#searchtext").after(html);
    }
  }  
});
