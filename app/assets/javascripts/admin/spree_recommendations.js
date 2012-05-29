$(document).ready(function(){
  $("#searchtext").keyup(function(){
    if ($(this).val().length > 2) {
      $.ajax({
        type: "POST",
        url: $(this).attr("data-live-search-url"),
        data: {"q": $(this).val()},
        success: function(html) {
          displayRow(html);
        }
      });
    }
    return false;
  }); 

  $("#RecommendationSearch").submit(function(){
    $.ajax({
      type: "POST",
      url: $(this).attr("data-live-search-url"),
      data: {"q": $(this).val()},
      success: function(html) {
        displayRow(html);
      }
    });
    return false;
  }); 
  
  function displayRow(html){
    if ($("#RecommendationResults").length > 0){
      $("#RecommendationResults").replaceWith(html);
    }
    else{
      $("#searchtext").after(html);
    }
  }  

  $("#RecommendationResults a.select").live("click", function(){
    $.ajax({
      type: "POST",
      url: $(this).attr("href"),
      data: {"recommended_id": $(this).attr("data-recommended-id")},
      success: function(html){ 
        $("#selected-recommendations table.index").replaceWith(html);
        $("#RecommendationResults").remove();
        $("#searchtext").val("");
      }
    }); 
    return false;
  });

  $("#selected-recommendations a.remove_recommendation").live("click", function(){
    $.ajax({
      type: "DELETE",
      url: $(this).attr("href"),
      data: {"recommendation_id": $(this).attr("data-recommendation-id")},
      success: function(html){
        $("#selected-recommendations table.index").replaceWith(html);
      }
    });
    return false;
  });
});
