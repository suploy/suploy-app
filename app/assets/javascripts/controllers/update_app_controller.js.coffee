@baseControllers.controller "UpdateAppCtrl", [
  "$scope"
  "$http"
  "$stateParams"
  "$location"
  ($scope, $http, $stateParams, $location) ->
    promise = $http.get "/api/apps/#{$stateParams.id}"
    promise.success (data, status, headers, config) ->
      $scope.app = data
    $scope.updateApp = ->
      promise = $http.put "/api/apps/#{$stateParams.id}", {'app':$scope.app}
      promise.success (data, status, headers, config) ->
        $location.path '/apps'
]
