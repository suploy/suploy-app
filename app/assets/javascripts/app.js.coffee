$ ->
  client = new ZeroClipboard(document.getElementById("copy_repo"))
  client.on "load", (client) ->
    client.on "dataRequested", (client, args) ->
      client.setText $("#repository").val()
      $('#copy_repo').tooltip(container: 'body', title: 'copied!', placement: 'left', trigger: 'manual')
      $('#copy_repo').tooltip('show')
      callback = ->
        $('#copy_repo').tooltip('hide')
      setTimeout callback, 3000
      return
