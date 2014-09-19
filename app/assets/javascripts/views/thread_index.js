OKC.Views.ThreadIndex = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, "sync", this.render)
  },

  template: JST["threads/index"],

  render: function () {
    var content = this.template({
      threads: this.collection
    });
    this.$el.html(content);
    return this;
  }
})