@suploy.config [
  "$stateProvider"
  "$urlRouterProvider"
  ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider.otherwise "/"

    $stateProvider.state("unauthorized",
      template: "<div ui-view></div>"
    ).state("unauthorized.sign_in",
      url: "/users/sign_in"
      templateUrl: "/templates/users/sign_in.html"
      controller: "LoginCtrl"
      accessLevel: accessLevels.anon
    ).state("unauthorized.sign_up",
      url: "/users/sign_up"
      templateUrl: "/templates/users/sign_up.html"
      controller: "SignUpCtrl"
      accessLevel: accessLevels.anon
    ).state("unauthorized.forgot_password",
      url: "/users/forgot_password"
      templateUrl: "/templates/users/forgot_password.html"
      controller: "ForgotPasswordCtrl"
      accessLevel: accessLevels.anon
    ).state("unauthorized.confirmation",
      url: "/users/confirmation"
      templateUrl: "/templates/users/confirm.html"
      controller: "ConfirmUserCtrl"
      accessLevel: accessLevels.anon
    ).state("unauthorized.unlock",
      url: "/users/unlock"
      templateUrl: "/templates/users/unlock.html"
      controller: "UnlockUserCtrl"
      accessLevel: accessLevels.anon
    ).state("admin",
      template: "<div ui-view></div>"
    ).state("admin.dashboard",
      url: "/admin"
      templateUrl: "/templates/admin/dashboard.html"
      controller: "AdminDashboardCtrl"
      accessLevel: accessLevels.admin
    ).state("admin.users.list",
      url: "/admin/users"
      templateUrl: "/templates/admin/users/list.html"
      controller: "ManageUsersCtrl"
      accessLevel: accessLevels.admin
    ).state("admin.users.show",
      url: "/admin/users/:id"
      templateUrl: "/templates/admin/users/show.html"
      controller: "ShowUsersCtrl"
      accessLevel: accessLevels.admin
    ).state("admin.users.edit",
      url: "/admin/users/:id/edit"
      templateUrl: "/templates/admin/users/edit.html"
      controller: "EditUsersCtrl"
      accessLevel: accessLevels.admin
    ).state("user",
      templateUrl: "/templates/users/user.html"
      controller: "MenuCtrl"
      accessLevel: accessLevels.user
    ).state("user.profile",
      url: "/profile"
      templateUrl: "/templates/users/profile.html"
      controller: "UserProfileCtrl"
      accessLevel: accessLevels.user
    ).state("user.ssh_keys",
      url: "/ssh_keys"
      templateUrl: "/templates/users/ssh_keys.html"
      controller: "SshKeyCtrl"
      accessLevel: accessLevels.user
    ).state("user.apps.home",
      url: "/"
      templateUrl: "/templates/apps/list.html"
      controller: "ListAppsCtrl"
      accessLevel: accessLevels.user
    ).state("user.apps"
      template: '<div ui-view></div>'
    ).state("user.apps.list",
      url: "/apps"
      templateUrl: "/templates/apps/list.html"
      controller: "ListAppsCtrl"
      accessLevel: accessLevels.user
    ).state("user.apps.show",
      url: "/apps/:id/show"
      templateUrl: "/templates/apps/show.html"
      controller: "ShowAppsCtrl"
      accessLevel: accessLevels.user
    ).state("user.apps.create",
      url: "/apps/new"
      templateUrl: "/templates/apps/new.html"
      controller: "NewAppCtrl"
      accessLevel: accessLevels.user
    ).state("user.apps.edit",
      url: "/apps/:id/edit"
      templateUrl: "/templates/apps/edit.html"
      controller: "UpdateAppCtrl"
      accessLevel: accessLevels.user
    )
]
