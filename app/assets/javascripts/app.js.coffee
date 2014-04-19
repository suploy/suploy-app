@suploy = angular.module("suploy", [
  "ngCookies"
  "ngAnimate"
  "ngTable"
  "ui.router"
  "chieffancypants.loadingBar"
  "baseControllers"
])

@baseControllers = angular.module("baseControllers", [])

@suploy.run [
  "$templateCache"
  "$http"
  "userService"
  ($templateCache, $http, userService) ->
    userService.getUserData()
    $http.get "/templates/users/sign_in.html",
      cache: $templateCache

]

@suploy.factory "httpRequestInterceptor", [
  "$location"
  ($location) ->
    request: (config) ->
      config
    response: (response) ->
      if response.status == 401
        $location.path('/users/sign_up')
      response
]

@suploy.config [
  "$httpProvider"
  ($httpProvider) ->
    $httpProvider.interceptors.push "httpRequestInterceptor"
]
