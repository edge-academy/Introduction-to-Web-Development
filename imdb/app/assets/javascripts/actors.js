(function(){
  $("#getactors").on('click', function(){
      console.log("get actors was clicked");
      $.ajax({
        url: "/actor",
        dataType: "JSON",
        success:function(data){
          $("#actorspace").html(data.actor);
        }
      });
  });
});
