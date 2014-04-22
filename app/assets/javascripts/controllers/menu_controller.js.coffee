@baseControllers.controller "MenuCtrl", [
  "$scope"
  "$state"
  ($scope, $state) ->
    $scope.$state = $state
    console.debug $state
]
