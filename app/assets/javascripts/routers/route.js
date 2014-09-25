BigStart.Routers.Router = Backbone.Router.extend({
  initialize: function(project) {
    this.$rootEl = $('.current-content');
    this.project = project;
  },

  routes: {
    '': 'projectShowHome',
    'backers':'projectBackerIndex'
  },

  projectBackerIndex: function() {
    var backers = this.project.backers();
    var backerIndexView = new BigStart.Views.BackersIndex({
      collection: backers
    });
    this._swapView(backerIndexView);
  },
  
  projectShowHome: function() {
    var homeView = new BigStart.Views.ProjectHome({
      model: this.project
    });
    this._swapView(homeView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view; 
    this.$rootEl.html(view.render().$el);
  }
});
