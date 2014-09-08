App.TodosController = Ember.ArrayController.extend({
	actions: {
		createTodo: function() {
			var title = this.get('todoValue');
			if(!title) {return false;}
			if(!title.trim()) {return;}

			var todo = this.store.createRecord('todo', {
				title: title,
				isDone: false
			});

			this.set('todoValue', '');
			todo.save();
		},
	},

	count: function() {
		return this.filterBy('isDone', false).get('length');
	}.property('@each.isDone'),

	countText: function() {
		var count = this.get('count');
		return count === 1 ? 'task' : 'tasks';
	}.property('count')
});
