
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>

		<br>
		<h1 class="text-uppercase">All notes</h1>

		<div class="row">
			<div class="col-12 p-2">


				<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery(" from Note");
					List<Note> list = q.list();
					for (Note note : list) {
				%>
				<div class="card mt-2">
					<img class="card-img-top" style="max-width: 40px;"
						src="image/icon.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<p style="color: blue;">
							Last Update
							<%=note.getAddedDate()%></p>
						<a href="DeleteServlet?note_id=<%=note.getId()%>"
							class="btn btn-danger">Delete</a> <a
							href="edit.jsp?note_id=<%=note.getId()%>"
							class="btn btn-primary ml-1">Update</a>
					</div>
				</div>
				<%
					}

					s.close();
				%>

			</div>


		</div>
	</div>
</body>
</html>