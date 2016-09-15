app = angular.module('app', [
  'templates',
  'ngRoute',
  'controllers'
]);

app.config([ '$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'index.html',
      controller: 'ListController'
    });
}]);

controllers = angular.module('controllers', []);
controllers.controller('ListController', ['$scope', function($scope) {
  $scope.tasks = [
    'Test task 1',
    'Test task 2'
  ];
  $scope.task = '';

  $scope.addTask = function() {
    $scope.tasks.push(this.task);
  }
}]);