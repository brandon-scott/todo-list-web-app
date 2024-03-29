﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Todo List Web App</title>

	<link rel="stylesheet" href="content/css/bootstrap.min.css">
	<link rel="stylesheet" href="content/css/bootstrap-tagsinput.css">
	<link rel="stylesheet" href="content/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="content/css/app.css">

	<!-[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]->
</head>
<body>

    <script type="text/x-handlebars" data-template-name="todos">
    	<header class="container">
    			<h1>ToDo App</h1>
    		</header>

    		<section id="main" class="container">
    			<div id="add-task-wrapper" class="row">
    				<div class="col-md-8">
    					{{input type="text" placeholder="Enter a new task" class="form-control input-lg" value=todoValue action="createTodo"}}
    				</div>
    				<div class="col-md-4"></div>
    			</div>

    			<div id="panels-wrapper" class="row">

    				<div id="panel-center" class="col-md-8">
    					<ul class="list-unstyled">
    						{{#each itemController="todo"}}
    							<li {{bind-attr class=":clearfix isDone:done :item-row"}}>
    								{{input type="checkbox" checked=isDone}}
    								<label {{action "showDetails" on="click"}} {{bind-attr class=":detail-panel-link isDueDateNear:error"}}>
    									{{title}}
									</label>
	    							<div class="pull-right">
	    								<button type="button" class="btn btn-default btn-sm" {{action "deleteTodo"}}>
	    									<span class="pull-right glyphicon glyphicon-trash"></span>
	    								</button>
	    							</div>
    							</li>
    						{{/each}}
    					</ul>
    				</div>

    				<div class="col-md-1"></div>
    				<div id="panel-right" class="col-md-3">
    					{{#each itemController="todo"}}
    					<div {{bind-attr class=":details-panel isDetailVisible:visible"}}>
    						<h4>{{title}}</h4>
							<div class="row">
								<label>Labels</label>
								{{input type="text" class="form-control" value=labels focus-out="saveChanges" class="tagsinput"}}
							</div>
							<div {{bind-attr class="isDueDateNear:error-input-wrapper :row"}}>
								<label>Due Date</label>
								{{input type="text" class="form-control datetime-picker-field" value=due focus-out="saveChanges"}}
							</div>
							<div class="row">
								<label>Description</label>
								{{textarea class="form-control" value=description focus-out="saveChanges"}}
							</div>
    					</div>
    					{{/each}}
    				</div>
    			</div>

    			<div id="grouping-status-wrapper" class="row">
    				<div class="col-md-8">
    					<p class="text-center">{{count}} {{countText}} remaining</p>
    				</div>
    				<div class="col-md-4"></div>
    			</div>
    		</section>

    		<footer class="container">
    			<p>
    				<small>Todo List App by Brandon Scott | v.0.0.1</small>
    			</p>
    		</footer>
    </script>
    	
	<script src="scripts/lib/jquery.min.js"></script>
	<script src="scripts/lib/handlebars.min.js"></script>
	<script src="scripts/lib/ember.js"></script>
	<script src="scripts/lib/ember-data.js"></script>
	<script src="https://cdn.firebase.com/js/client/1.0.21/firebase.js"></script>
	<script src="https://cdn.firebase.com/libs/emberfire/1.1.3/emberfire.min.js"></script>
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
