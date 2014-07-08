$(function() {

  //
  // Cache requisite jQuery objects
  //
  var $artist  = $('#artist');
  var $search  = $('#search');
  var $records = $('.results');
  var $error   = $('.error');

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
    var query = $artist.val();

    // Ensure records and errors are cleared between searches
    $records.empty();
    $error.empty();

    // TODO
    // Display AJAX loading GIF while request is being processed

    // Show clear button when results are displayed
    var $clear = $('.clear');
    $clear.show();

    // Clear search results at the user's request
    $clear.on('click', function() {
      $records.empty();
      $artist.val('');
      $(this).hide();
    });

    // Upon empty search, clear or update error message
    if (query === '') {
      e.preventDefault();

      // Update error message
      $error.html('Search for something!');

      // Ensure "clear" button does not appear
      $clear.hide();
    }
  });

  //
  // Remove deleted record upon successful POST
  //
  $('.delete-record').bind('ajax:success', function() {
    $(this).closest('.record').remove();

    var $collection = $('.collection');

    // Was that the last record present in the UI?
    if (!$collection.find('.record').length) {
      $collection.append(
        '<p class="empty">' +
          'Buy some records, kid!' +
        '</p>'
      );
    }
  });

});
