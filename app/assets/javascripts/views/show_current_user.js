OKC.Views.ShowCurrentUser = Backbone.View.extend({
  initialize: function () {
    
  },
  
  events: function () {
    
  },
  
  template: JST["show_current_user"],
  
  render: function () {
    var content = this.template( {
      user: this.model
    });
    this.$el.html(content);
    return this;
  }
})