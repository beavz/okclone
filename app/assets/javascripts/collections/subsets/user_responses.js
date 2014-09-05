OKC.Subsets.UserResponses = Backbone.Subset.extend({

  url: function () {
    return this.user.url + "/responses";
  },

  initialize: function (models, options) {
    this.question = options.question;
  }
});