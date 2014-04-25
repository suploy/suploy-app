@suploy.config [
  "$stateProvider"
  "$urlRouterProvider"
  ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider.otherwise "/"

    $stateProvider.state("sign_in",
      url: "/users/sign_in"
      templateUrl: "/templates/users/sign_in.html"
      controller: "LoginCtrl"
    ).state("sign_up",
      url: "/users/sign_up"
      templateUrl: "/templates/users/sign_up.html"
      controller: "SignUpCtrl"
    ).state("forgot_password",
      url: "/users/forgot_password"
      templateUrl: "/templates/users/forgot_password.html"
      controller: "ForgotPasswordCtrl"
    ).state("confirmation",
      url: "/users/confirmation"
      templateUrl: "/templates/users/confirm.html"
      controller: "ConfirmUserCtrl"
    ).state("unlock",
      url: "/users/unlock"
      templateUrl: "/templates/users/unlock.html"
      controller: "UnlockUserCtrl"
    ).state("admin.dashboard",
      url: "/admin"
      templateUrl: "/templates/admin/dashboard.html"
      controller: "AdminDashboardCtrl"
    ).state("admin.users.list",
      url: "/admin/users"
      templateUrl: "/templates/admin/users/list.html"
      controller: "ManageUsersCtrl"
    ).state("admin.users.show",
      url: "/admin/users/:id"
      templateUrl: "/templates/admin/users/show.html"
      controller: "ShowUsersCtrl"
    ).state("admin.users.edit",
      url: "/admin/users/:id/edit"
      templateUrl: "/templates/admin/users/edit.html"
      controller: "EditUsersCtrl"
    ).state("user",
      templateUrl: "/templates/users/user.html"
      controller: "MenuCtrl"
    ).state("user.profile",
      url: "/profile"
      templateUrl: "/templates/users/profile.html"
      controller: "UserProfileCtrl"
    ).state("user.ssh_keys",
      url: "/ssh_keys"
      templateUrl: "/templates/users/ssh_keys.html"
      controller: "SshKeyCtrl"
    ).state("user.apps.home",
      url: "/"
      templateUrl: "/templates/apps/list.html"
      controller: "ListAppsCtrl"
    ).state("user.apps"
      template: '<div ui-view></div>'
    ).state("user.apps.list",
      url: "/apps"
      templateUrl: "/templates/apps/list.html"
      controller: "ListAppsCtrl"
    ).state("user.apps.show",
      url: "/apps/:id/show"
      templateUrl: "/templates/apps/show.html"
      controller: "ShowAppsCtrl"
    ).state("user.apps.create",
      url: "/apps/new"
      templateUrl: "/templates/apps/new.html"
      controller: "NewAppCtrl"
    ).state("user.apps.edit",
      url: "/apps/:id/edit"
      templateUrl: "/templates/apps/edit.html"
      controller: "UpdateAppCtrl"
    )
]
