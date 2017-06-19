// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require nested_form_fields
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
    $('#calendar').fullCalendar({
      // aspectRatio: 2,
      contentHeight: 358,
      header: {
        left: ' ',
        right: 'prev, today next',
        center: 'title',
      },
      defaultView: 'agendaWeek',
    views: {

          agendaWeek: {
            type: 'agendaWeek',
            duration: { days: 7},
            slotDuration: '08:00:00',
            slotLabelFormat: 'h',
            allDaySlot: false,
            buttonText: 'week',
      }
    }
    });
});
