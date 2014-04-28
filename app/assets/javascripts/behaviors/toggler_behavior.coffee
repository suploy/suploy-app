$ ->
  $("body").on "click", ".js-toggler-target", ->
    container = $(@).closest(".js-toggler-container")
    container.toggleClass("on")

  # Toggle button. Show/hide content inside parent container.
  # Button does not change visibility. If button has icon - it changes chevron style.
  #
  # %div.js-toggle-container
  #   %a.js-toggle-button
  #   %div.js-toggle-content
  #
  $("body").on "click", ".js-toggle-button", (e) ->
    $(@).find('i').
      toggleClass('fa-chevron-down').
      toggleClass('fa-chevron-up')
    console.log $(@).closest(".js-toggle-container")
    console.log $(@).closest(".js-toggle-container").find(".js-toggle-content")
    $(@).closest(".js-toggle-container").find(".js-toggle-content").toggle()
    e.preventDefault()
