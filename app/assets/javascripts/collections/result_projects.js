Discover.Collections.Projects = Backbone.Collection.extend({
  url: "/api/search",
  model: Discover.Models.Project,

  filterByCategory: function(category_id) {
    filtered = this.filter(function(model) {
      return model.get("category_id") === category_id;
      });
    return new Discover.Collections.Projects(filtered);
  }
});
//Discover.Collections.projects = new Backbone.Collections.Projects();
