$(function(){
    "use strict";
    $(".mymemor").on("click",function(){
        $("body").css({"background":"url('../memorial/images/ngTwo.jpg')"})
        $("#commitShow1").show();
		
    })
    $("#commitY").on("click",function(){
        var merObject = $("#merObkect").val();
        var merName = $("#merMan").val();
        var name = $(".name");
        var Launch = $(".Launch")
        $("#commitShow1").hide();
        $(".fixedMain").hide();
        $("#commitShow2").show();
        name.html(merObject);
        Launch.html(merName);
    })
})