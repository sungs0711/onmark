<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>test.jsp</title>
</head>
<body>
	<h3>test.jsp</h3>
	<h1>3th branch���� ������ ����</h1>
	
	<%
		// 1. ȯ�� ����
		String driver="com.mysql.jdbc.Driver";
		//String url="jdbc:oracle:thin:@192.168.0.206:1521:orcl";
		String url="jdbc:mysql://192.168.0.206:3306/testdb";
		String user="scott";
		String password="tiger";
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		StringBuffer sb = new StringBuffer();
		Connection conn = null;
		
		// 2. ��Ƹ��� �ε�
		try {
			Class.forName(driver);
			// 3. Connection
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("����̹� �ε� ����");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("���� ����");
			e.printStackTrace();
		}
		
		// 4. sql ��
		sb.append("SELECT * FROM dept");
		
		// 5. ���� ��ü
		try {
			pstmt = conn.prepareStatement(sb.toString());
			// 6. ����
			rs = pstmt.executeQuery();
			// 7. ���ڵ庰 ���� ó��
			while(rs.next()) {
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				out.println("<h3>" + deptno + " : " + dname + " : " + loc + "<h3>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 8. �ڿ��ݳ�
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	%>
</body>
</html>