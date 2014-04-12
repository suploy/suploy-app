@baseControllers.controller "SshKeyCtrl", [
  "$scope"
  "$http"
  ($scope, $http) ->
    $scope.getSshKeys = ->
      promise = $http.get('/api/users/ssh_keys')
      promise.success (data, status, headers, config) ->
        $scope.ssh_keys = data
    $scope.createSshKey = ->
      promise = $http.post('/api/users/ssh_keys', {'ssh_key':{'title':$scope.title,'content':$scope.content}})
      promise.success (data, status, headers, config) ->
        $scope.ssh_keys.push data
        $scope.toggleNewSshKeyForm()
        $scope.title = ""
        $scope.content = ""
      promise.error (data, status, headers, config) ->
        $scope.all_errors = data.errors
    $scope.deleteSshKey = (index) ->
      ssh_key = $scope.ssh_keys[index]
      promise = $http.delete('/api/users/ssh_keys/'+ssh_key.id)
      promise.success (data, status, headers, config) ->
        $scope.ssh_keys.splice(index, 1)
      promise.error (data, status, headers, config) ->
        $scope.all_errors = data.errors
    $scope.toggleNewSshKeyForm = ->
      $scope.showNewSshKeyForm = !$scope.showNewSshKeyForm
    $scope.showNewSshKeyForm = false
    $scope.getSshKeys()
]
