package web.common;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBConnect {
//MySQL Connection Pool ��� DBMS ���� 
 public Connection getConnection(){
   Connection con = null;          // DBMS ���� ��ü

   try{
     // blog_v2jq �� web.xml�� registerPool ������ ���̾�� �� 
     // <param-name>registerPool</param-name> <!-- ������ -->
     // <param-value>blog_v2jq</param-value>    <!-- ������ -->
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
  	 String className = "com.mysql.jdbc.Driver";		// MySQL ���� ����̹�
 		 String url = "jdbc:mysql://localhost:3306/shxdb?useSSL=false&useUnicode=true&characterEncoding=euckr";
 		 String user = "root";
 		 String passwd = "1234";
  	 
     Class.forName(className); 				// memory�� ����̹� Ŭ������ �ε���
     con = DriverManager.getConnection(url, user, passwd); // MySQL ����
     //System.out.println("Connection Mode 1: " + con.hashCode());
   }catch(Exception e){
     e.printStackTrace();
   }
   
   return con;
 }
}
