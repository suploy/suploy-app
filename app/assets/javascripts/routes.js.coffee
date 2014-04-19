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
    ).state("profile",
      url: "/users/profile"
      templateUrl: "/templates/users/profile.html"
      controller: "UserAccountCtrl"
    ).state("home",
      url: "/"
      templateUrl: "/templates/index.html"
      controller: "HomeCtrl"
    ).state("dashboard",
      url: "/admin"
      templateUrl: "/templates/admin/dashboard.html"
      controller: "AdminDashboardCtrl"
    ).state("manage_users",
      url: "/admin/users"
      templateUrl: "/templates/admin/users/list.html"
      controller: "ManageUsersCtrl"
    ).state("show_user",
      url: "/admin/users/:id"
      templateUrl: "/templates/admin/users/show.html"
      controller: "ShowUsersCtrl"
    ).state("edit_user",
      url: "/admin/users/:id/edit"
      templateUrl: "/templates/admin/users/edit.html"
      controller: "EditUsersCtrl"
    ).state("list_applications",
      url: "/apps"
      templateUrl: "/templates/apps/list.html"
      controller: "ListAppsCtrl"
    ).state("create_application",
      url: "/apps/new"
      templateUrl: "/templates/apps/new.html"
      controller: "NewAppCtrl"
    ).state("update_application",
      url: "/apps/:id/edit"
      templateUrl: "/templates/apps/edit.html"
      controller: "UpdateAppCtrl"
    )
]
