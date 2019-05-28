package web.common;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBConnect {
//MySQL Connection Pool 기반 DBMS 접속 
 public Connection getConnection(){
   Connection con = null;          // DBMS 연결 객체

   try{
     // blog_v2jq 는 web.xml의 registerPool 변수의 값이어야 함 
     // <param-name>registerPool</param-name> <!-- 변수명 -->
     // <param-value>blog_v2jq</param-value>    <!-- 변수값 -->
     String poolName = "jdbc:apache:commons:dbcp:shXorld";
     con = DriverManager.getConnection(poolName);
     //System.out.println("Connection Mode 2: " + con.hashCode());

   }catch(Exception e){
     e.printStackTrace();
   }
   
   return con; // Void methods cannot return a value
 }
 
 // DB Connect Simple Ver.
 public Connection getConnectionNormal(){
   Connection con = null;
   
   try{
  	 String className = "com.mysql.jdbc.Driver";		// MySQL 연결 드라이버
 		 String url = "jdbc:mysql://localhost:3306/shxdb?useSSL=false&useUnicode=true&characterEncoding=euckr";
 		 String user = "root";
 		 String passwd = "1234";
  	 
     Class.forName(className); 				// memory로 드라이버 클래스를 로딩함
     con = DriverManager.getConnection(url, user, passwd); // MySQL 연결
     //System.out.println("Connection Mode 1: " + con.hashCode());
   }catch(Exception e){
     e.printStackTrace();
   }
   
   return con;
 }
}
