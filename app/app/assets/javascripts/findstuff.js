$( document ).ready(function() {
  var items;
  $.getJSON('/users', null, function(data) {
    items = data.items;
    minipic = data[1].picture_url.mini.url;
    console.log(items);
    console.log(minipic);
  });
});
