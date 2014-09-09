App.TodoController = Ember.ObjectController.extend({
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
		},
		saveChanges: function() {
			this.get('model').save();
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
	}.property('model.isDone'),

	isDueDateNear: function() {
		var dueTime = Date.parse(this.get('due')),
			currentTime = Date.parse(new Date()),
			compareTime = (dueTime - currentTime),
			oneDay = 86400000;

		if(!isNaN(dueTime)) {
			if(compareTime > oneDay) {
				// more than 24 hours
				return false;
			} else if(compareTime < oneDay && compareTime >= 0) {
				// less than 24 hours
				return true;
			} else {
				// date is in past
				return true;
			}
		}
	}.on('init').property('model.due')
});

Em.TextField.reopen({
	dateTimePicker: function(){
		if(this.$().hasClass('datetime-picker-field')) {
			this.$().datetimepicker();
		}
	}.on('didInsertElement'),
	tagsInput: function() {
		if(this.$().hasClass('tagsinput')) {
			this.$().tagsinput('items');
		}
		this.$().on('itemAdded itemRemoved', function(){
			$(this).focusout();
		});
	}.on('didInsertElement')
});