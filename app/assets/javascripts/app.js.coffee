@baseApp = angular.module("baseApp", [
  "ngCookies"
  "ngAnimate"
  "ngTable"
  "ui.router"
  "chieffancypants.loadingBar"
  "baseControllers"
])

@baseControllers = angular.module("baseControllers", [])

@baseApp.run [
  "$templateCache"
  "$http"
  "userService"
  ($templateCache, $http, userService) ->
    userService.getUserData()
    $http.get "/templates/users/sign_in.html",
      cache: $templateCache

]

@baseApp.factory "httpRequestInterceptor", [
  "$location"
  ($location) ->
    request: (config) ->
      config
    response: (response) ->
      if response.status == 401
        $location.path('/users/sign_up')
      response
]

@baseApp.config [
  "$httpProvider"
  ($httpProvider) ->
    $httpProvider.interceptors.push "httpRequestInterceptor"
]
