window.OKC = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function (user_id) {
    OKC.formatting_data = new OKC.Models.FormattingData;
    OKC.formatting_data.fetch();

    OKC.current_user = new OKC.Models.User({ id: user_id });
    OKC.users = new OKC.Collections.Users();

    new OKC.Routers.Main({$rootEl : $(".main")});
    Backbone.history.start();

    console.log("backbone runs");
  }
};

