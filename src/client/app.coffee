require "document-register-element"

# Register custom elements
document.registerElement "application-root"
document.registerElement "application-view"
document.registerElement "application-page"

require "angular"
require "angular-route"
require "skrollr"
require "angular-skrollr"
require "ng-device-detector"

App = angular.module 'sampettersson.com', ["ngRoute", "ng.deviceDetector"]

App.run ['$route', angular.noop]

App.config ($routeProvider, $locationProvider) ->

  $routeProvider.when '/',
    templateUrl: "/client/views/indexView.html"
  .when '/projects/strive-forwards',
    templateUrl: "/client/views/strive-forwardsView.html"
  .when '/projects/berdie',
    templateUrl: "/client/views/berdieView.html"
    controller: "berdieController"
  .otherwise
    templateUrl: "/client/views/notFoundView.html"

  $locationProvider.html5Mode true

  return

module.exports = App