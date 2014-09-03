OKC.Routers.Main = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "users/:id": "show"
  },

  show: function (id) {
    if (id == OKC.current_user.id) {
      OKC.current_user.fetch();
      var view = new OKC.Views.ShowCurrentUser({
        model: OKC.current_user
      });
    } else {
      var user = this._getUser(id);
      var view = new OKC.Views.ShowUser({
        model: user
      });
    }

    this._swapView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

  _getUser: function (id) {
    var user = OKC.users.get(id);
    if (user) {
      user.fetch();
    } else {
      user = new OKC.Models.User({ "id" : id });
      user.fetch({
        success: function (user) {
          user.collection = OKC.users;
          OKC.users.add(user);
        }
      });
    }

    return user;
  }
});