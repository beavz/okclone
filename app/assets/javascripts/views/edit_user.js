OKC.Views.EditUser = Backbone.View.extend({
  initialize: function () {
  },

  events: {
    "submit form": "updateUser"
  },

  template: JST["users/edit"],

  render: function () {
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    return this;
  },

  updateUser: function (event) {
    event.preventDefault();
    var view = this;
    var formData = $(event.currentTarget).serializeJSON().user;
    this.model.save(formData, {
      patch : true,
      success: function (model, response) {
        console.log(response);
        $(view.$el).find(".status-message").html(response.message);
      }});
    this.render
  }
})