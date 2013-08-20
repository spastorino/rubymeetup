# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  $(".post-category").sortable({
    connectWith: '.post-category'
  })

  $("a#submit-picks").on("click", (e) ->
    featured_picks = []
    $("#featured li").each((index) ->
      featured_picks.push $(this).data('post-id')
    )

    $.post($('#featured').data('save-picks-url'), {'featured_pick_ids[]': featured_picks}, 'json')
      .fail(() ->
        alert("Your new picks couldn't be saved, please try again")
      ).done(() ->
        alert('saved!')
      )
  )
