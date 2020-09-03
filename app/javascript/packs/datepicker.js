$(document).on('turbolinks:load', function() {
  let time = new Date()
  time.setHours(time.getHours() + 1)

  $('#event_datetime').datepicker({
    timepicker: true,
    minDate: time
  })
});
