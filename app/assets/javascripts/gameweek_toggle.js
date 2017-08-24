$(document).ready(function() {
  $("#next").click(function() {
    var active = $(".gameweek_fixtures.active");
    if (active.next().hasClass("gameweek_fixtures")) {
      active.removeClass("active");
      active.next().addClass("active");
    }
  });
});

$(document).ready(function() {
  $("#previous").click(function() {
    var active = $(".gameweek_fixtures.active");
    if (active.prev().hasClass("gameweek_fixtures")) {
      active.removeClass("active");
      active.prev().addClass("active");
    }
  });
});
