OKC.Subsets.ThreadMessages = Backbone.Subset.extend({
  url: function () {
    "api/threads/" + this.thread.id + "messages";
  },

  initialize: function (models, options) {
    this.thread = options.thread;
  }
})