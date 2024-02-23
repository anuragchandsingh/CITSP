<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
	import="com.citsp.connection.DBConnection"
	import="javax.servlet.RequestDispatcher" %>
	<%
		Connection con=null;
		RequestDispatcher rd=null;
		PreparedStatement pstmt=null;
	    
	    int evidenceid= Integer.parseInt(request.getParameter("id"));
	
		try {
		con=DBConnection.createConnection();

		pstmt= con.prepareStatement("delete from evidence where evidenceid=?");
		pstmt.setInt(1,evidenceid);
		
			
		int row = pstmt.executeUpdate();
		
		rd=request.getRequestDispatcher("ViewEvidence.jsp");
		if(row !=0)
		{
			request.setAttribute("status","success");
		}
		else
		{
			request.setAttribute("status", "failed");
		}
		rd.forward(request, response);
		pstmt.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
 %>		