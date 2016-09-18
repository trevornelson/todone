controllers = angular.module('controllers')
controllers.controller('ListController', ['$scope', '$http', function($scope, $http) {
  $scope.tasks = [];
  $http.get('/api/tasks.json').success(function(data) {
    $scope.tasks = data;
  });
}]);
