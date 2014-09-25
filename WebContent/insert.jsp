<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>



<%@ page import="java.sql.*"%>

<%@ page import="javax.sql.*"%>

<%@ page import="javax.naming.*"%>

<%@ page import=" java.util.regex.*"%>



<%

String title = request.getParameter("title");

String writer = request.getParameter("writer");

String regdate = request.getParameter("regdate");

String content = request.getParameter("content");

 

if (title == "" || title == null)

	out.println("title이 null입니다.");

 

if (writer == "" || writer == null)

	out.println("writer가 null입니다.");

else if (!Pattern.matches(

		"^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))

	out.println("이메일 형식이 아닙니다.");

 

if (regdate == "" || regdate == null)

	out.println("regdate가 null입니다.");

else if (!Pattern.matches("^[0-9]*$", regdate))

	out.println("숫자형식이 아닙니다.");

 

if (content == "" || content == null)

	out.println("content가 null입니다.");

 

try {

	DataSource ds = null;

	Connection conn = null;

 

	//final String DATASOURCE = "java:comp/env/jdbc/OracleDB";
	final String DATASOURCE = "orcl";

 

	InitialContext ic = new InitialContext();

	ds = (DataSource) ic.lookup(DATASOURCE);

	conn = ds.getConnection();

	out.println("Oracle Database DataSource Connection Success!!");

 

	/*String driverName = "oracle.jdbc.driver.OracleDriver"; //데이터베이스에 접속하기위한 드라이버를 로드합니다.		 

	String url = "jdbc:oracle:thin:@localhost:1521:ORCL"; //접속 URL정보와 포트번호(oracle포트), sid(oracle버전) 

	Class.forName(driverName);

	Connection con = DriverManager.getConnection(url, "scott",

			"tiger"); // getCo... : 계정정보 url, id, pw	 

	out.println("Oracle Database Connection Success!!");*/

 

	PreparedStatement pstmt = null;		


//	String sql = "INSERT INTO BOARD VALUES (BOARD_SEQ.nextval, ?, ?, ?, " + 1 + ", ?)";
	String sql = "INSERT INTO BOARD2 VALUES (BOARD_SEQ.nextval, ?, ?, ?, " + 1 + ", ?)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, title);

	pstmt.setString(2, writer);

	pstmt.setString(3, regdate);

	pstmt.setString(4, content);
	
	pstmt.executeUpdate();

	/*String sql = "INSERT INTO BOARD "
			+ "VALUES (BOARD_SEQ.nextval, '" + title + "', '"
			+ writer + "', '" + regdate + "', '" + 1 + "', '"
			+ content + "')";*/

	conn.close();

 

} catch (Exception e) {

 

	out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");

	out.println(e.getMessage());

	e.printStackTrace();

} finally {

 

	out.print("<script>location.href='index.jsp';</script>");

 

}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Donghoon's Model1 Board - Board_Insert</title>

</head>

<body>



</body>



</html>
