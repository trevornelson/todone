controllers = angular.module('controllers')
controllers.controller('ListController', ['$scope', function($scope) {
  $scope.tasks = [
    'Test task 1',
    'Test task 2',
    ''
  ];
}]);
