@baseControllers.controller "ManageUsersCtrl", [
  "$scope"
  "$http"
  "$location"
  "ngTableParams"
  ($scope, $http, $location, ngTableParams) ->
    promise = $http.get '/api/admin/users'
    promise.success (data, status, headers, config) ->
      $scope.users = data.users
      $scope.usersTable = new ngTableParams(
        page: 1
        count: 10
      ,
        total: data.meta.total
        getData: ($defer, params) ->
          $defer.resolve data.users.slice((params.page() - 1) * params.count(), params.page() * params.count())
          return
      )

    $scope.setCurrentUserId = (currentUserId) ->
      $scope.currentUserId = currentUserId

    $scope.deleteUser = ->
      $('#deleteModal').modal('hide')
      for user, i in $scope.users
        if user.id == $scope.currentUserId
          $scope.users.splice i, 1
          break
      $http.delete "/api/admin/users/#{$scope.currentUserId}"
]
