$(function() {

  //
  // Cache requisite jQuery objects
  //
  var $artist  = $('#artist');
  var $search  = $('#search');
  var $records = $('.records');

  //
  // Ensure search input field is empty on load
  //
  $artist.val('');

  //
  // Prevent user from submitting empty search queries;
  // Toggle display of search instructions to the user
  //
  $search.on('click', function(e) {
    // Get search query value for each search
    var query    = $artist.val();

    // Ensure records and errors are cleared between searches
    $records.empty();

    // TODO
    // Display AJAX loading GIF while request is being processed

    // Upon empty search, clear or update error message
    if (query === '') {
      e.preventDefault();

      // Update error message
      $('.error').html('Search for something!');
    }
  });

});
