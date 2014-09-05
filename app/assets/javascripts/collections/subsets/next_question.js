OKC.Subsets.NextQuestion = Backbone.Subset.extend({
  model: OKC.Models.Question,

  url: function () {
    return this.user.url + "/questions";
  },

  initialize: function (models, options) {
    this.user = options.user;
  }
});