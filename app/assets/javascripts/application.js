// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require modernizr-latest
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on("page:change", function() {
    $( "#past_events" ).hide();

    $( "#toggle_events" ).click(function() {
        if($( "#past_events" ).is(":visible"))
        {
            $( "#past_events" ).slideUp();
            $( "#toggle_events" ).text("Click here to show past events");
        }
        else
        {
            $( "#past_events" ).slideDown();
            $( "#toggle_events" ).text("Click here to hide past events");
        }
    });

    var sPath=window.location.pathname;
    var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);

    if(sPage == "book_a_lawn") {
        setTimeout(function() {
            var source = new EventSource('/lawn_monitor');
            source.addEventListener('update', function(e) {
                var obj = JSON.parse(e.data);
                var id = obj.lawn_id;
                var booked = obj.booked;

                $("#" + id + " p").html("Is booked: " + booked);
            });
        }, 1); 
    }
})
