$(document).ready(function() {
$(".fixture_tab").click(function() {
$(".fixture_tab").removeClass("active");
$(this).addClass("active");
$(".fixtures").removeClass("active");
$($(this).data("target")).addClass("active");
});
});
