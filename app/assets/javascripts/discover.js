window.Discover = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Utils: {},

  initialize: function() {
    var projects = new Discover.Collections.Projects();
    projects.fetch();
    new Discover.Routers.Router(projects);
    Backbone.history.start();
  }

};
