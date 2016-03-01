// var items = ['/images/pane1.jpg', '/images/pane2.jpg', '/images/pane3.jpg', '/images/pane4.jpg', '/images/pane5.jpg'];
// var imgCounter = 1;
var items;
var imgCounter = 0;
var item_offered_id ;
var item_liked_id;
var like_func = function(offered, liked){
  $.post('/likes', {item_offered_id: offered, item_liked_id: liked }, function(data, textStatus, jqXHR)
  {
    //saved func
  },"json").fail(function(jqXHR, textStatus, errorThrown)
  {
    //fail func
  });
};

var dislike_func = function(offered, liked){
  $.post('/likes', {item_offered_id: offered, item_liked_id: liked }, function(data, textStatus, jqXHR)
  {
    //saved func
  },"json").fail(function(jqXHR, textStatus, errorThrown)
  {
    //fail func
  });
};


$(document).ready(function() {
  item_offered_id = $(".menu-block").data('item-id');
  $.getJSON('/items', {filter: 1}, function(data) {
    if (!data){
      return false;
    }
    items = data;
    $('#itemImage').attr('src', items[0].picture_url.url);
    $("#itemTitle").text(items[0].name);
    item_liked_id = items[0].id ;
    imgCounter +=1;
  });

  $(".menu-block").on("click", function(){
    var small_pic = $(this).data('thumb-picture');
    var small_item_title = $(this).data('item-name');
    item_offered_id = $(this).data('item-id');
    $('#itemImage2').attr('src', small_pic);
  });
  $("#button-add-item").on("click", function(){
    $( "#item-modal" ).addClass("is-active");
  });
  $("#item-modal-close").on("click", function(){
    $("#item-modal").removeClass("is-active");
  });



  if ($('#touchsurface2').length){
    function swipedetect(el, callback){

      var touchsurface = el,
      swipedir,
      startX,
      startY,
      distX,
      distY,
      threshold = 75, //required min distance traveled to be considered swipe
      restraint = 100, // maximum distance allowed at the same time in perpendicular direction
      allowedTime = 500, // maximum time allowed to travel that distance
      elapsedTime,
      startTime,
      handleswipe = callback || function(swipedir){};

      touchsurface.addEventListener('touchstart', function(e){
        var touchobj = e.changedTouches[0];
        swipedir = 'none';
        dist = 0;
        startX = touchobj.pageX;
        startY = touchobj.pageY;
        startTime = new Date().getTime(); // record time when finger first makes contact with surface
        e.preventDefault();
      }, false);

      touchsurface.addEventListener('touchmove', function(e){
        e.preventDefault(); // prevent scrolling when inside DIV
      }, false);

      touchsurface.addEventListener('touchend', function(e){

        var touchobj = e.changedTouches[0];
        distX = touchobj.pageX - startX; // get horizontal dist traveled by finger while in contact with surface
        distY = touchobj.pageY - startY; // get vertical dist traveled by finger while in contact with surface
        elapsedTime = new Date().getTime() - startTime; // get time elapsed
        if (elapsedTime <= allowedTime){ // first condition for awipe met
          if (Math.abs(distX) >= threshold && Math.abs(distY) <= restraint){ // 2nd condition for horizontal swipe met

            swipedir = (distX < 0)? 'left' : 'right'; // if dist traveled is negative, it indicates left swipe
          }
          else if (Math.abs(distY) >= threshold && Math.abs(distX) <= restraint){ // 2nd condition for vertical swipe met
            swipedir = (distY < 0)? 'up' : 'down'; // if dist traveled is negative, it indicates up swipe
          }
        }
        handleswipe(swipedir);
        e.preventDefault();
      }, false);
    }

    window.addEventListener('load', function(){
      var el = document.getElementById('itemImage');
      var hidetimer = null;
      swipedetect(el, function(swipedir){
        swipe(swipedir);
      });
    }, false);

  }

  $('#like').on('click', function(){
    like_func(item_offered_id,item_liked_id);
    swipe('right');
  });
  $('#nope').on('click', function(){
    dislike_func(item_offered_id,item_liked_id);
    swipe('left');
  });
});

function swipe(swipedir){
  if (swipedir != 'none'){

    if (swipedir =='left'){

      $('.cardstatus').addClass('dislike');
      $("#inner").animate({
        left: '-1000px',
        opacity: '0.25',
      },{
        duration: 750,
        complete: function() {
          $("#inner").animate({
            opacity: '1.0',
            left: '0px',
          },750);
        }
      });
    }
    if (swipedir =='right'){
      $('.cardstatus').addClass('like');
      $("#inner").animate({
        left: '1000px',
        opacity: '0.25',
      },{
        complete: function() {
          $("#inner").animate({
            opacity: '1.0',
            left: '0px',
          },750);
        },
        duration: 750
      });
    }
    setTimeout(function(){
      if (!items){
        return false;
      }
      if (imgCounter > items.length - 1){
        imgCounter= 0
      }

      $('#itemImage').attr('src', items[imgCounter].picture_url.url);
      $("#itemTitle").text(items[imgCounter].name);
      item_liked_id = items[imgCounter].id ;
      $('.cardstatus').removeClass('like').removeClass('dislike');
      imgCounter += 1;
    }, 750);
  }
}
