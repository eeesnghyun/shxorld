package web.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
 
import org.apache.commons.dbcp.ConnectionFactory;
import org.apache.commons.dbcp.DriverManagerConnectionFactory;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDriver;
import org.apache.commons.pool.impl.GenericObjectPool;

public class DBCPool extends HttpServlet {
	//ServletConfig config: web.xml�� ���ٰ��� ��ü
  public void init(ServletConfig config) throws ServletException {
      String poolName = config.getInitParameter("poolName");// Pool �̸�
      String jdbcDriver = config.getInitParameter("jdbcDriver");    // Driver Class
      String jdbcURL = config.getInitParameter("jdbcURL");          // MySQL ���� �ּ�
      String user = config.getInitParameter("user");                // ���� ���̵�
      String password = config.getInitParameter("password");        // ���� password
      
      int maxActive = 0;        // �ִ� ����� 
      int maxIdle = 0;          // ������� �����             
      
      maxActive = Integer.parseInt(config.getInitParameter("maxActive"));
      maxIdle = Integer.parseInt(config.getInitParameter("maxIdle"));
      
      try {
          // JDBC ����̹� �ε�, oracle.jdbc.driver.OracleDriver
          Class.forName(jdbcDriver);
          
          // Connection Pool ����
          GenericObjectPool connectionPool = new GenericObjectPool(null);
          connectionPool.setMaxActive(maxActive); // �ִ� ���� ����� 
          connectionPool.setMaxIdle(maxIdle);     // ���� ��� �����
          
          // ���� DB���� Ŀ�ؼ��� �������ִ� ���丮 ����
          ConnectionFactory connectionFactory = new DriverManagerConnectionFactory(
              jdbcURL,    // JDBC URL
              user,       // �����
              password);
          
          // Connection Pool�� PoolableConnection ��ü�� ������ �� �����
          // PoolableConnectionFactory ����
          PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(
              connectionFactory,
              connectionPool,
              null,  // statement pool
              null,  // Ŀ�ؼ� �׽�Ʈ ����: Ŀ�ؼ��� ��ȿ���� �׽�Ʈ�� �� ���Ǵ� ����.
              false, // read only ����
              true); // auto commit ����
          
          // Pooling�� ���� JDBC ����̹� ���� �� ���
          PoolingDriver driver = new PoolingDriver();
          
          // JDBC ����̹��� Ŀ�ؼ� Ǯ ���
          // ora10g2�� Connection ���� �䱸�� ����ϰ� �˴ϴ�.
          driver.registerPool(poolName, connectionPool);
          
          System.out.println("----------------------------------------------------------------------------------");
          System.out.println("                  >> DBCP Connection Pool�� ����Ǿ����ϴ� <<     ");
          System.out.println("----------------------------------------------------------------------------------");
          
      } catch(Exception ex) {
          //throw new ServletException(ex);
          ex.printStackTrace();
      }

  }

}
