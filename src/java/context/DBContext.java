
package context;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
    
    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
    /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
    private static Connection con;

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ManagerFood","sa","long");
        }catch (Exception ex) {
            ex.printStackTrace();
        } 
        return con;
    }
        public static void main(String[]args ){
        try{
            System.out.println(new DBContext().getConnection());
        }catch(Exception e){
            
        }
    }
        //fdsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    /*Insert your other code right after this comment*/
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
//    private final String serverName = "localhost";
//    private final String dbName = "Manager";
//    private final String portNumber = "1433";
   // private final String instance="";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
//    private final String userID = "sa";
//    private final String password = "long";
//      try {
//            String user = "sa";
//            String pass = "long";
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=testDb";
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            connection = DriverManager.getConnection(url, user, pass);
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
}
 