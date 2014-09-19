OKC.Views.ShowThread = Backbone.View.extend({
  initialize: function (options) {
    this.listenTo(this.model.messages(), "add", this.render);
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "submit form.new-message" : "newMessage"
  },

  template: JST["threads/show"],

  render: function () {
    var content = this.template({
      thread: this.model,
      messages: this.model.messages()
    });

    this.$el.html(content);
    return this;
  },

  newMessage: function (event) {
    event.preventDefault();
    var view = this;
    var params = $(event.target).serializeJSON();
    var message = new OKC.Models.Message({
      to_user_id: this.model.get("otherUserId"),
      thread_id: this.model.id
    });

    message.save( params.message,
      { success: function (message) {
        view.model.messages().add(message);
      }
    });

  }
})
