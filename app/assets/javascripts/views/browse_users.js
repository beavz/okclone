OKC.Views.BrowseUsers = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, "reset", this.render);
  },

  events: {
    "submit form.browse" : "browse",
    "submit form.search" : "browse"
  },

  template: JST["users/browse"],

  render: function () {
    console.log("view rendered")
    var content = this.template({
      users: this.collection
    });
    this.$el.html(content);
    return this;
  },


  browse: function (event) {
    console.log("in browse")
    event.preventDefault();
    var view = this;
    var formData = $(event.currentTarget).serializeJSON();
    console.log(formData);

    $.ajax({
      url: "/api/users",
      data: formData,
      success: function (users) {
        view.collection.reset(users);
      }
    })
  }

});