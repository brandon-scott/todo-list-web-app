<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Todo List Web App</title>

	<link rel="stylesheet" href="content/css/bootstrap.min.css">
	<link rel="stylesheet" href="content/css/app.css">

	<!-[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]->
</head>
<body>

    <script type="text/x-handlebars" data-template-name="todos">
    	<header class="container text-center">
    			<h1>What do you need todo?</h1>
    		</header>

    		<section id="main" class="container">
    			<div id="add-task-wrapper" class="row">
    				<div class="col-md-3"></div>
    				<div class="col-md-6">
    					{{input type="text" placeholder="Add a new task" class="form-control" value=todoValue action="createTodo"}}
    				</div>
    				<div class="col-md-3"></div>
    			</div>

    			<div id="panels-wrapper" class="row">
    				
    				<div id="panel-left" class="col-md-3">
    					<div>
    						<h3>Tags</h3>
    						<ul>
    							<li>tag 1</li>
    							<li>tag 2</li>
    							<li>tag 3</li>
    						</ul>
    					</div>

    					<div>
    						<h3>Ignored Tasks</h3>
    						<ul>
    							<li>task 1</li>
    							<li>task 2</li>
    							<li>task 3</li>
    						</ul>
    					</div>
    				</div>

    				<div id="panel-center" class="col-md-6">
    					<ul class="list-unstyled">
    						{{#each itemController="todo"}}
    							<li {{bind-attr class=":clearfix isDone:done"}}>
    								{{input type="checkbox" checked=isDone class="toggle"}}
    								<label>{{title}}</label>
	    							<div class="pull-right">
	    								<button type="button" class="btn btn-default btn-sm" {{action "deleteTodo"}}>
	    									<span class="pull-right glyphicon glyphicon-trash"></span>
	    								</button>

	    								<button type="button" class="btn btn-default btn-sm">
	    									<span class="pull-right glyphicon glyphicon-eye-close"></span>
	    								</button>
	    							</div>
    							</li>
    						{{/each}}
    					</ul>
    				</div>

    				<div id="panel-right" class="col-md-3">
    					<h4>This is the name of the task</h4>
    					<div>
    						<label>Labels</label>
    						<input type="text" class="form-control">
    					</div>
    					<div>
    						<label>Deadline</label>
    						<input type="text" class="form-control">
    					</div>
    					<div>
    						<label>Description</label>
    						<textarea class="form-control"></textarea>
    					</div>
    				</div>
    			</div>

    			<div id="grouping-status-wrapper" class="row">
    				<div class="col-md-3"></div>
    				<div class="col-md-6">
    					<p class="text-center">{{count}} {{countText}} remaining</p>
    				</div>
    				<div class="col-md-3"></div>
    			</div>
    		</section>

    		<footer class="container">
    			<p class="text-center">
    				<small>Todo List App by Brandon Scott</small>
    			</p>
    		</footer>
    </script>

	<script src="scripts/lib/jquery.min.js"></script>
	<script src="scripts/lib/handlebars.min.js"></script>
	<script src="scripts/lib/ember.js"></script>
	<script src="scripts/lib/ember-data.js"></script>
	<script src="scripts/lib/bootstrap.min.js"></script>
	<script src="scripts/lib/bootstrap-tagsinput.min.js"></script>
	<script src="scripts/lib/moment.min.js"></script>
	<script src="scripts/lib/bootstrap-datetimepicker.min.js"></script>
	<script src="scripts/app/app.js"></script>
	<script src="scripts/app/router.js"></script>
	<script src="scripts/app/models/todo.js"></script>
	<script src="scripts/app/controllers/todo_controller.js"></script>
	<script src="scripts/app/controllers/todos_controller.js"></script>
</body>
