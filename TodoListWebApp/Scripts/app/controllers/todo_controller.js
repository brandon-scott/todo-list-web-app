﻿App.TodoController = Ember.ObjectController.extend({
	actions: {
		showDetails: function() {
			currentDetailVisible = this.parentController.get('content').filterBy('isDetailVisible', true);
			for(var i = 0; i < currentDetailVisible.length; i++) {
				currentDetailVisible[i].set('isDetailVisible', false);
			}
			this.set('isDetailVisible', true);
		},
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