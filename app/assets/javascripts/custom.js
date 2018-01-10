$( document ).ready(function() {
  $('#user_avatar').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert('Maximum file size is 5MB. Please choose a smaller file.');
    }
  });
  $('.btn-detail').click
  $('.btn-detail').on('click', function(event) {
    event.preventDefault();
    $('#content_hidden').css('display', 'block');
  });
});
