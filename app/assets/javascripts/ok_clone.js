window.OKC = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function (user_id) {
    //initialize a router
    OKC.current_user = new OKC.Models.User({ id: user_id });
    OKC.users = new OKC.Collections.Users();
    Backbone.history.start();
    
    alert("hi")
  }
};
