BigStart.Routers.Router = Backbone.Router.extend({
  initialize: function(project) {
    this.$rootEl = $('.current-content');
    this.project = project;
  },

  routes: {
    '': 'projectShowHome',
    'backers':'projectBackerIndex',
    'comments' : 'projectCommentIndex'
  },
  
  projectShowHome: function() {
    var homeView = new BigStart.Views.ProjectHome({
      model: this.project
    });
    this._swapView(homeView);
  },

  projectBackerIndex: function() {
    var backers = this.project.backers();
    var backersIndexView = new BigStart.Views.BackersIndex({
      collection: backers
    });
    this._swapView(backersIndexView);
  },
  
  projectCommentIndex: function() {
    var comments = this.project.comments();
    var commentsIndexView = new BigStart.Views.CommentsIndex({
      collection: comments
    });
    this._swapView(commentsIndexView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view; 
    this.$rootEl.html(view.render().$el);
  }
});
