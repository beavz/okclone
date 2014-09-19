OKC.Views.ShowUser = Backbone.View.extend({
  initialize: function () {
    this.tab = ".info";

    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click nav.tabs": "changeTab",
    "click ul" : "renderAlbumModal"
  },

  partials: {
    ".info" : "user_info",
    ".photos" : "user_photos",
    ".questions" : "user_questions"
  },

  template: JST["show_user"],

  render: function () {
    var content = this.template({
      user: this.model,
      tab: this.tab
    });
    this.$el.html(content);

    var tab = this.tab;
    var tabContent = JST[this.partials[tab]]({
      user: this.model
    });
    this.$(".tab-content").html(tabContent);

    return this;
  },

  changeTab: function (event) {
    event.preventDefault();
    this.tab = $(event.target).data().id;
    this.render();
  },

  renderAlbumModal: function (event) {
    var template = JST["album_modal"];

    var albumId = $(event.currentTarget).data().id;
    console.log(this.model.albums().get(albumId).pictures())
    var content = template({ album: this.model.albums().get(albumId) })
    $('ul.pictures').html(content);
  }
})