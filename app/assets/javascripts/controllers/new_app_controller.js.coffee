@baseControllers.controller "NewAppCtrl", [
  "$scope"
  "$http"
  "$location"
  ($scope, $http, $location) ->
    $scope.createApp = ->
      promise = $http.post '/api/apps', {'app':$scope.app}
      promise.success (data, status, headers, config) ->
        $location.path '/apps'
]
