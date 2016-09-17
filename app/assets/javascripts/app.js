app = angular.module('app', [
  'templates',
  'ngRoute',
  'ng-token-auth',
  'controllers'
]);

controllers = angular.module('controllers',[])

app.config([ '$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'index.html',
      controller: 'ListController'
    })
    .when('/sign_in', {
      templateUrl: 'user_sessions/new.html',
      controller: 'UserSessionsController'
    });

}]);

app.run(['$rootScope', '$location', function($rootScope, $location) {
  $rootScope.$on('auth:login-success', function(event, user) {
    $location.path('/');
  });
}]);
