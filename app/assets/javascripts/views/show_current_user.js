OKC.Views.ShowCurrentUser = Backbone.View.extend({
  initialize: function () {
    this.tab = ".info";
    this.editing = {};

    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click nav.tabs": "changeTab",
    "click button.edit" : "showForm",
    "submit form" : "update"
  },

  partials: {
    ".info" : "current_user_info",
    ".photos" : "current_user_photos",
    ".questions" : "current_user_questions"
  },

  template: JST["show_current_user"],

  render: function () {
    var content = this.template({
      user: this.model,
      tab: this.tab
    });
    this.$el.html(content);

    var tab = this.tab;
    var tabContent = JST[this.partials[tab]]({
      user: this.model,
      editing: this.editing
    });
    this.$(tab).html(tabContent);

    return this;
  },

  changeTab: function (event) {
    event.preventDefault();
    this.tab = $(event.target).data().id;
    this.render();
  },

  showForm: function (event) {
    event.preventDefault();
    var key = $(event.target).data().id;
    this.editing[key] = true;
    this.render();
  },

  update: function (event) {
    event.preventDefault();
    var form = $(event.currentTarget)
    var params = form.serializeJSON();
    OKC.current_user.save(params, { patch : true });
    this.editing[form.data().id] = false;
    this.render();
  }
})