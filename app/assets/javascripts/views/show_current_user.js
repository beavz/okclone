OKC.Views.ShowCurrentUser = Backbone.View.extend({
  initialize: function () {
    this.tab = ".info";

    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click nav.tabs": "changeTab"
  },

  partials: {
    ".info" : "current_user_info",
    ".photos" : "current_user_photos",
    ".questions" : "current_user_questions"
  },

  template: JST["show_current_user"],

  render: function () {
    var content = this.template( {
      user: this.model,
      tab: this.tab
    });
    this.$el.html(content);

    var tab = this.tab;
    var tabContent = JST[this.partials[tab]]({ user: this.model});
    this.$(tab).html(tabContent);

    return this;
  },

  changeTab: function (event) {
    event.preventDefault();
    this.tab = $(event.target).data().id;
    this.render();
  }
})