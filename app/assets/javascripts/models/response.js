OKC.Models.Response = Backbone.Model.extend({
  urlRoot: "api/responses/",
  collection: OKC.Collections.UserResponses,
  
  parse: function (attributes) {
    this.question = new OKC.Models.Question( 
      attributes.question, 
      { parse : true }
    );
    delete attributes.question; 
    return attributes;
  }
})