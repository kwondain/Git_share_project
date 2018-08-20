package db;

import java.io.IOException;
import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// DB연결 객체 생성
public class DBConnection { 
	public Connection con = null;
	
	// 생성자 
	public DBConnection() throws IOException{
		
		try{
			   // 커넥션 풀 작업순서
			   // 1. JNDI(Java Naming Directory Interface)에 
			   //    접근하기 위한 객체 생성
		       Context init = new InitialContext();
			   // 2. Context.xml 파일에 설정된 리소스를 참조하여 
			   //    DataSource 객체를 생성한다.
		       DataSource ds = 
		         (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			   // 3. 커넥션 풀에  의한 DB 연동 객체 생성하여 연결시도
		       con = ds.getConnection(); // 커넥션 풀에서 객체 가져옴      
		       System.out.println("<h3> DBCP에 연결되었습니다.</h3>");
		   }catch(Exception e){
			   System.out.println("<h3> 연결에 실패하였습니다. </h3>");
		   }		
		
	}// 생성자 end
	

}






