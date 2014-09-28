BigStart.Collections.Projects = Backbone.Collection.extend({
  url: "/api/projects",
  model: BigStart.Models.Project,
  
  getOrFetch: function(id){
    var projects = this, 
        project = this.get(id);

    if (!project){
      project = new BigStart.Models.Project({id: id});
      project.fetch({
        success: function(){
          projects.add(project);
        }
      })
    } else {
      project.fetch();
    }
    return project;
  },
});
