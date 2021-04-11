package SQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {

    private static final String BASE = "universidadpublic";
    private static final String USERNAME = "scodee";
    private static final String PASSWORD = "spacecodee";
    private static final String URL = "jdbc:mysql://localhost:3306/" + BASE + "?serverTimezone=UTC";
    private static final String Driver = "com.mysql.cj.jdbc.Driver";
    
    private Connection Con = null;

    public Connection getConexion() {
        try {
            
            Class.forName(Driver);
            Con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

        } catch (SQLException e) {
            System.err.println(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return Con;
    }

}
