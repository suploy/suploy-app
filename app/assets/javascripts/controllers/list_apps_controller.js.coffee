@baseControllers.controller "ListAppsCtrl", [
  "$scope"
  "$http"
  "$location"
  "ngTableParams"
  ($scope, $http, $location, ngTableParams) ->
    promise = $http.get '/api/apps'
    promise.success (data, status, headers, config) ->
      $scope.apps = data.apps

    $scope.setCurrentAppId = (currentAppId) ->
      $scope.currentAppId = currentAppId

    $scope.deleteApp = ->
      $('#deleteModal').modal('hide')
      for app, i in $scope.apps
        if app.id == $scope.currentAppId
          $scope.apps.splice i, 1
          break
      $http.delete "/api/apps/#{$scope.currentAppId}"
]
