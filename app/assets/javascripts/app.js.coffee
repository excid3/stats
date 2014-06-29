app = angular.module("stats", ["ngRoute"]).config ($routeProvider) ->
  $routeProvider.when("/hits",
    templateUrl: "/hits.html",
    controller: "HitsController"
    activetab: "home"
  )
  $routeProvider.when("/top/urls",
    templateUrl: "/top_urls",
    controller: "URLsController"
    activetab: "top_urls"
  )
  $routeProvider.when("/top/referrers",
    templateUrl: "/top_referrers",
    controller: "ReferrersController"
    activetab: "top_referrers"
  )
  $routeProvider.otherwise({ redirectTo: "/hits" })

app.controller "HitsController", ($scope, $route) ->
  $scope.$route = $route

app.controller "URLsController", ($scope, $route, $http) ->
  $scope.$route = $route
  $scope.url = "/top_urls.json"
  $scope.top_urls = {}

  $scope.loadTopURLs = ->
    $http.get($scope.url).then (response) ->
      $scope.top_urls = response.data

  $scope.loadTopURLs()

app.controller "ReferrersController", ($scope, $route, $http) ->
  $scope.$route = $route
  $scope.url = "/top_referrers.json"
  $scope.top_referrers = {}

  $scope.loadTopReferrers = ->
    $http.get($scope.url).then (response) ->
      $scope.top_referrers = response.data

  $scope.loadTopReferrers()
