<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
	import="com.citsp.connection.DBConnection"
	import="javax.servlet.RequestDispatcher" %>
	<%
		Connection con=null;
		RequestDispatcher rd=null;
		PreparedStatement pstmt=null;
	    
	    int suspectid= Integer.parseInt(request.getParameter("id"));
	
		try {
		con=DBConnection.createConnection();

		pstmt= con.prepareStatement("delete from suspect where suspectid=?");
		pstmt.setInt(1,suspectid);
		
			
		int row = pstmt.executeUpdate();
		
		rd=request.getRequestDispatcher("Viewsuspect.jsp");
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