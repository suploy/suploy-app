@baseControllers.controller "ListAppsCtrl", [
  "$scope"
  "$http"
  "$location"
  ($scope, $http, $location) ->
    promise = $http.get '/api/apps'
    promise.success (data, status, headers, config) ->
      $scope.appsTable = new ngTableParams(
        page: 1
        count: 10
      ,
        total: data.meta.total
        getData: ($defer, params) ->
          $defer.resolve data.slice((params.page() - 1) * params.count(), params.page() * params.count())
          return
      )
]
