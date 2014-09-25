BigStart.Models.Project = Backbone.Model.extend({
  urlRoot: "/api/projects",
  
  backers: function() {
    if(!this._backers) {
      this._backers = new BigStart.Collections.Backers([], { project: this });
    }
    return this._backers;
  },

  parse: function(response){
    if( response.backers){
      this.backers().set(response.backers, { parse: true });
      delete response.backers;
    }
    return response;
  }
});
