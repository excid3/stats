app = angular.module("stats", ["ngRoute"]).config ($routeProvider) ->
  $routeProvider.when("/hits",
    templateUrl: "/hits.html",
    controller: "HitsController"
  )
  $routeProvider.when("/top/urls",
    templateUrl: "/top_urls",
    controller: "URLsController"
  )
  $routeProvider.when("/top/referrers",
    templateUrl: "/top_referrers",
    controller: "ReferrersController"
  )
  $routeProvider.otherwise({ redirectTo: "/hits" })

app.controller "HitsController", ->

app.controller "URLsController", ($scope, $http) ->
  $scope.url = "/top_urls.json"
  $scope.top_urls = {}

  $scope.loadTopURLs = ->
    $http.get($scope.url).then (response) ->
      $scope.top_urls = response.data

  $scope.loadTopURLs()

app.controller "ReferrersController", ($scope, $http) ->
  $scope.url = "/top_referrers.json"
  $scope.top_referrers = {}

  $scope.loadTopReferrers = ->
    $http.get($scope.url).then (response) ->
      $scope.top_referrers = response.data

  $scope.loadTopReferrers()
