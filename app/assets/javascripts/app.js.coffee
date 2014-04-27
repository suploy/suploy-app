@suploy = angular.module("suploy", [
  "ngCookies"
  "ngAnimate"
  "ngTable"
  "ui.router"
  "chieffancypants.loadingBar"
  "baseControllers"
])

@baseControllers = angular.module("baseControllers", [])

@suploy.config [
  "cfpLoadingBarProvider"
  (cfpLoadingBarProvider) ->
    cfpLoadingBarProvider.includeBar = false
]

@suploy.run [
  "$templateCache"
  "$http"
  "userService"
  "$rootScope"
  "$state"
  "$location"
  ($templateCache, $http, userService, $rootScope, $state, $location) ->
    userService.getUserData()
    $http.get "/templates/users/sign_in.html",
      cache: $templateCache
    $rootScope.$state = $state
    $rootScope.checkPermission = (state) ->
      if state.accessLevel != accessLevels.public and not userService.signedIn
        $location.path "/users/sign_in"
    $rootScope.$on "$stateChangeStart", (ev, to, toParams, from, fromParams) ->
      $rootScope.checkPermission(to)
      return
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
