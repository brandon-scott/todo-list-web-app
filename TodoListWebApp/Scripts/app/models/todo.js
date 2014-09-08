App.Todo = DS.Model.extend({
	title: DS.attr('string'),
	isDone: DS.attr('boolean')
});

App.Todo.FIXTURES = [
	{
		id: 1,
		title: 'this is my first task',
		isDone: true
	},
	{
		id: 2,
		title: 'cut the grass',
		isDone: false
	},
	{
		id: 3,
		title: 'wash the dishes',
		isDone: false
	}
];