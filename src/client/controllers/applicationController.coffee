App = require "../app"

App.controller 'applicationController', ($scope, $rootScope, deviceDetector) ->
  $scope.twitterLink = "https://www.twitter.com/fotomagin"

  $rootScope.device = {}
  $rootScope.device.mobile = deviceDetector.isMobile()
  $rootScope.device.desktop = deviceDetector.isDesktop()
  $rootScope.device.ios = deviceDetector.raw.os.ios
  $rootScope.device.android = deviceDetector.raw.os.android