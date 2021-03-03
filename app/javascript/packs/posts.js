// Use jquery to handle likes
$(function () {
  // When like button is clicked, run the function
  $('.post-like').on('click', function () {
    // Create variable for Post id using an attribute from the like button itself
    // This will be set on page load using the view file
    var post_id = $(this).data('id');
    // Make request to controller using our likes route via ajax command
    $.ajax({
      // Passing in post id as variable
      url: '/post/like/' + post_id,
      method: 'GET',
      // No need for Data property because we are putting Post id into URL
      // Run function when successful
    }).done(function (response) {
      console.log(response);
    });
  });
});
