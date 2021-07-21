<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_js_css.jsp"%>
<title>Add Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Writes notes here</h1>


		<form action="SaveNotes" method="post">
			<div class="form-group">
				<label for="title">Title</label> <input type="text" name="title"
					required class="form-control" id="title " placeholder="Enter Notes">
			</div>
			<div class="form-group">
				<label for="content">Content</label>
				<textarea id="content" name="content" required class="form-control"
					style="height: 200px;" placeholder="Enter details upto 1500"></textarea>


			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>

		</form>


	</div>

</body>
</html>