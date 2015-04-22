module.exports = class applicationRoute

  constructor: (router) ->

    controllers = require "controllers"

    router.post '/email', controllers.applicationController.routes.emailRoute
    router.get '*', controllers.applicationController.routes.applicationRoute