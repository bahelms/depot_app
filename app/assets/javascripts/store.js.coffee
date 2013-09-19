$(document).on "ready page:change", -> # page:change is turbolinks
  $(".store .entry > img").click ->
    $(this).parent().find(":submit").click()
