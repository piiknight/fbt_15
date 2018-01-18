document.addEventListener("turbolinks:load", function() {
  $('#user_avatar').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert('Maximum file size is 5MB. Please choose a smaller file.');
    }
  });

  $('.btn-detail').on('click', function(event) {
    $('#content_hidden').css('display', 'block');
  });

  $('.btn-load, .btn-detail').on('click', function(event) {
    window.location.reload();
  });

  $('.star-rating').raty({
    path: '/assets/',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });

  $('#star-rating').raty({
    path: '/assets',
    scoreName: 'review[rating]'
  });
});

$(document).on('change', '#categories', function(){
  var category = $(this).val();

  $.ajax({
    url: '/tours',
    method: 'GET',
    format: 'js',
    data: {category: category},
    error: function (xhr, status, error) {
    },
    success: function (response) {
      $('#categories_tours').html(response);
    }
  });
});
