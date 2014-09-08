App.Todo = DS.Model.extend({
	title: DS.attr('string'),
	description: DS.attr('string'),
	labels: DS.attr(),
	isDone: DS.attr('boolean')
});

App.Todo.FIXTURES = [
	{
		id: 1,
		title: 'this is my first task',
		description: 'this is the description of my task',
		labels: ['label 1', 'label 2', 'label 3'],
		isDone: true
	},
	{
		id: 2,
		title: 'cut the grass',
		description: 'another description',
		labels: ['label 4', 'label 5', 'label 6'],
		isDone: false
	},
	{
		id: 3,
		title: 'wash the dishes',
		description: 'this is my last description',
		labels: ['label 7', 'label 8', 'label 9'],
		isDone: false
	}
];