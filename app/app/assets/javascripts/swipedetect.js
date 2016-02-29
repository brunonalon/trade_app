// var items = ['/images/pane1.jpg', '/images/pane2.jpg', '/images/pane3.jpg', '/images/pane4.jpg', '/images/pane5.jpg'];
// var imgCounter = 1;
var items;
var itemClick = function(){
asdasd;
};

$(document).ready(function() {

  $.getJSON('/items', null, function(data) {
    items = data;
    for (var i = 0; i < items.length; i++) {
      minipic = items[i].picture_url.mini.url;
      var itemname = items[i].name;
      var smallItemImg = $('<img>').attr('src', items[i].picture_url.thumb.url);
      var smallItemFigure = $('#smallItem');
      var menu = $('<a class="menu-block" href="#"><span class="menu-icon"><i class="image is-16x16"> <img src='+minipic+'></i></span> '+itemname+'</a>').click(function(){

        smallItemImg.appendTo(smallItemFigure);
      });
      var select = $(".menu");
      menu.appendTo(select);
    }
    // $("#itemTitle").text(items[0].name);
    var smallItemImg = $('<img>').attr('src', items[0].picture_url.thumb.url);
    var smallItemFigure = $('#smallItem');
    smallItemImg.appendTo(smallItemFigure);

    var bigItemImg = $('<img>').attr('src', items[0].picture_url.url);
    var bigItemFigure = $('#bigItem');
    bigItemImg.appendTo(bigItemFigure);

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
    swipe('right');
  });
  $('#nope').on('click', function(){
    swipe('left');
  });
});

function swipe(swipedir){
  if (swipedir != 'none'){
    console.log(swipedir);
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
      console.log(swipedir + "2");
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
      $('#itemImage').attr('src', items[imgCounter]);
      $('#itemImage2').attr('src', items[imgCounter]);
      $('.cardstatus').removeClass('like').removeClass('dislike');
      imgCounter += 1;
    }, 750);
  }
}
