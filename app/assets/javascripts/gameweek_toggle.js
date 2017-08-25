$(document).ready(function() {


    var load = $(".fixture_tab").first();
    load.addClass("active");
    $(".fixtures").removeClass("active");
    $(load.data("target")).addClass("active");
    $(".gameweek_fixtures").removeClass("active");
    $(".fixtures.active #game_week" + load.data("week")).addClass("active");


  $(".fixture_tab").click(function(){
    console.log($(this).data("week"));
    $(".fixture_tab").removeClass("active");
    $(this).addClass("active");
    $(".fixtures").removeClass("active");
    $($(this).data("target")).addClass("active");
    $(".gameweek_fixtures").removeClass("active");
    $(".fixtures.active #game_week" + $(this).data("week")).addClass("active");
  })

  $(".next").click(function() {
    var active = $($(".fixtures.active").data("target") + ".active");
    if (active.next().hasClass("gameweek_fixtures")) {
      active.removeClass("active");
      active.next().addClass("active");
    }
  });


  $(".previous").click(function() {
    var active = $($(".fixtures.active").data("target") + ".active");
    if (active.prev().hasClass("gameweek_fixtures")) {
      active.removeClass("active");
      active.prev().addClass("active");
    }
  });
});
