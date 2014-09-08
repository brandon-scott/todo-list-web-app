App.TodoController = Ember.ObjectController.extend({
	actions: {
		deleteTodo: function() {
			var todo = this.get('model');
			todo.deleteRecord();
			todo.save();
		}
	},
	isDone: function(key, value) {
		var model = this.get('model');

		if(value === undefined) {
			return model.get('isDone');
		} else {
			model.set('isDone', value);
			model.save();
			return value;
		}
	}.property('model.isDone')	
});