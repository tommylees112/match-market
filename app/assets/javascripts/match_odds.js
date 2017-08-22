$(document).ready(function() {
$(".tab").click(function() {
$(".tab").removeClass("active");
$(this).addClass("active");
$(".odds").removeClass("active");
$($(this).data("target")).addClass("active");
});
});
