window.BigStart = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Utils: {},

  initialize: function(id) {
    var project = new BigStart.Models.Project({id: id})
    project.fetch();
    new BigStart.Routers.Router(project);
    Backbone.history.start();  
  }
};

