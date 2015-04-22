App = require "../app"

App.controller 'applicationController', ($scope, $rootScope, deviceDetector) ->
  $scope.twitterLink = "https://www.twitter.com/fotomagin"

  $rootScope.device = {}
  $rootScope.device.mobile = deviceDetector.isMobile()
  $rootScope.device.desktop = deviceDetector.isDesktop()
  $rootScope.device.ios = deviceDetector.raw.os.ios
  $rootScope.device.android = deviceDetector.raw.os.android

App.directive 'contactPopup', ($timeout) ->
  directive = {}

  directive.restrict = "E"
  directive.templateUrl = "/client/views/contactPopup.html"
  directive.link = ($scope, $element) ->

    $scope.contactPopup = {}

    $scope.contact = () ->

      if !$scope.showContactPopup
        $scope.showContactPopup = true

        $timeout () ->
          $scope.contactPopup.marginTop = -Math.abs($element[0].children[1].offsetHeight + 15)
          $scope.contactPopup.marginLeft = -Math.abs(($element[0].children[1].offsetWidth - $element[0].children[2].offsetWidth) / 2)
          $scope.animateContactPopup = true
        , 50

      else

        $scope.contactPopup.animateOut = true

        $timeout () ->
          $scope.contactPopup.animateOut = false
          $scope.showContactPopup = false
          $scope.animateContactPopup = false
        , 250

  return directive

