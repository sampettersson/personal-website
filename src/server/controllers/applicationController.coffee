module.exports = class applicationController

  class @routes

    @emailRoute = (req, res) ->

      sendgrid = require("sendgrid")(process.env.SENDGRID_USER, process.env.SENDGRID_PASS)

      if req.body.email is undefined or req.body.message is undefined
        res.json { err: true }
        return

      sendgrid.send {
        to: "sam@sampettersson.com",
        from: req.body.email,
        subject: "Contact form submission",
        text: req.body.message
      }, (err) ->

        if err
          res.json { err: true }

        else
          res.json { err: false }


    @applicationRoute = (req, res) ->

      res.render 'application'
