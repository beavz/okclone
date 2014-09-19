OKC.Views.ShowThread = Backbone.View.extend({
  initialize: function (options) {
    this.listenTo(this.model, "sync", this.render);
  },

  template: JST["threads/show"],

  render: function () {
    this.model.fetch();
    var content = this.template({
      thread: this.model,
      messages: this.model.messages()
    });

    this.$el.html(content);
    return this;
  }
})