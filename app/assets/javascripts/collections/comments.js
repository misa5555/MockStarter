BigStart.Collections.Comments = Backbone.Collection.extend({
  model: BigStart.Models.Comment,
  url: "/api/comments",
  
  initialize: function (model, options){
    this.project = options.project;
  },
  
});
