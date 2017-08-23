FB.api('/{ID}?fields=picture.height(2048)', function(response){
   $("#profile_pic").attr("src",response.picture.data.url);
});
