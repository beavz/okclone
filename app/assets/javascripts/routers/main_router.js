OKC.Routers.Main = Backbone.Router.extend({
  initialize: {
    this.$rootEl = options.$rootEl;
  },
  
  routes: {
    "#/user/:id": "show"
  },
  
  show: function (id) {
    if (id === OKC.current_user.id) {
      OKC.current_user.fetch();
      var view = new OKC.Views.ShowCurrentUser({
        model: OKC.current_user
      })
      this._swapView(view);
    } else {
      var user = OKC.users.get(id);
      user.fetch();
      var view = new OKC.Views.ShowUser({
        model: user
      });
      this._swapView(view);
    } 
  },
  
  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});