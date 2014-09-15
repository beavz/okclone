OKC.Subsets.MessageThread = Backbone.Subset.extend({
  url: function () {
    "api/users/" + this.user.id + "messages";
  },

  initialize: function (models, options) {
    this.user = options.user;
  }
})