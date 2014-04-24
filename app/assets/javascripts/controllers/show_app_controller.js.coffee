@baseControllers.controller "ShowAppsCtrl", [
  "$scope"
  "$http"
  "$stateParams"
  "$location"
  ($scope, $http, $stateParams, $location) ->
    promise = $http.get "/api/apps/#{$stateParams.id}"
    promise.success (data, status, headers, config) ->
      $scope.app = data
    client = new ZeroClipboard(document.getElementById("copy_repo"))
    client.on "load", (client) ->
      client.on "dataRequested", (client, args) ->
        client.setText $("#repo_input").val()
        return

      return
]
