app.directive('taskItem', function() {
  return {
    restrict: 'E',
    scope: {
      task: '=',
      index: '@',
      last: '@'
    },
    link: function(scope, element, attrs) {
      scope.updateTask = function() {
        scope.$parent.tasks[scope.index] = scope.task;
        if (scope.last === 'true') { scope.$parent.tasks.push(''); }
      };
    },
    templateUrl: 'task-item.html'
  }
});
