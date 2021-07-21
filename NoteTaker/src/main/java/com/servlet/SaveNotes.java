package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.jar.Attributes.Name;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class SaveNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note(title, content, new Date());

//			System.out.println(note.getId() + ": " + note.getTitle());
//			this for check either ur program is working or not. output will  be shown on terminal
			
//			Now hibernate Save
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}