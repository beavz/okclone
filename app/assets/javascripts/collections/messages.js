OKC.Collections.Messages = Backbone.Collection.extend({
  url: "/api/messages",
  model: OKC.Models.Message,
  comparator: function (message) {
    message.get("created_at")
  }
});