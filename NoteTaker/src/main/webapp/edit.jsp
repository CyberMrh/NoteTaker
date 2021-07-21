<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit here</h1>

		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());

			Session s = FactoryProvider.getFactory().openSession();
			Note note = (Note) s.get(Note.class, noteId);
		%>


		<form action="UpdateServlet" method="post">
			<input value="<%=note.getId()%>" name="noteId" type="hidden" />

			<div class="form-group">
				<label for="title">Title</label> <input type="text" name="title"
					required class="form-control" id="title " placeholder="Enter Notes"
					value="<%=note.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="content">Content</label>
				<textarea id="content" name="content" required class="form-control"
					style="height: 200px;" placeholder="Enter details"><%=note.getContent()%></textarea>

			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-success">Save</button>
			</div>

		</form>
	</div>
</body>
</html>