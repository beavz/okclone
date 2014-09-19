OKC.Views.ThreadIndex = Backbone.View.extend({
  template: JST["threads/index"],

  render: function () {
    var content = this.template({
      threads: this.collection
    });

    this.$el.html(content);
    return this;
  }
})