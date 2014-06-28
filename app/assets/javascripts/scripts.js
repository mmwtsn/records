$(function() {

  //
  // Cache requisite jQuery objects
  //
  var $artist  = $('#artist');
  var $search  = $('#search');
  var $records = $('.records');
  var query    = $artist.val();

  //
  // Ensure search input field is empty on load
  //
  $artist.val('');

  //
  // Prevent user from submitting empty search queries;
  // Toggle display of search instructions to the user
  //
  $search.on('click', function(e) {

    // Ensure records and errors are cleared between searches
    $records.empty();
    $('.error').empty();

    // TODO
    // Display AJAX loading GIF while request is being processed

    if (query === '') {
      e.preventDefault();
      $('main').prepend('<p class="error">Search for something!</p>');
    }
  });

});
