'use strict';

/**
 * @ngdoc function
 * @name angularTestApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the angularTestApp
 */
angularTestApp
  .controller('AboutCtrl', ['$scope', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  }]);
