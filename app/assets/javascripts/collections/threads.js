OKC.Collections.Threads = Backbone.Collection.extend({
  url: "/api/message_threads",
  model: OKC.Models.Thread,
  comparator: function () {
    //TODO order by last created message
  }
});