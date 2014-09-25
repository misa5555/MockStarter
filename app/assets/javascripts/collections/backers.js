BigStart.Collections.Backers = Backbone.Collection.extend({
  model: BigStart.Models.Backer,
  url: "/api/backers",
  
  initialize: function (model, options){
    this.project = options.project;
  },

});
