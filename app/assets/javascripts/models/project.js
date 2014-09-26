BigStart.Models.Project = Backbone.Model.extend({
  urlRoot: "/api/projects",
  
  backers: function() {
    if(!this._backers) {
      this._backers = new BigStart.Collections.Backers([], { project: this });
    }
    return this._backers;
  },
  
  comments: function(){
    if(!this._comments) {
      this._comments = new BigStart.Collections.Comments([], { project: this });
    }
    return this._comments;
  },

  parse: function(response){
    if(response.backers) {
      this.backers().set(response.backers, { parse: true });
      delete response.backers;
    }
    if (response.comments) {
      this.comments().set(response.comments, { parse: true });
      delete response.comments;
    }
    return response;
  }
});
