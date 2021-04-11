package SQL;

import Modelo.ObjetoEscuela;
import Modelo.ObjetoFacultad;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.swing.table.DefaultTableModel;

public class Sentencias extends Conexion {

    private Connection Con = null;
    private CallableStatement callSt = null;
    private ResultSet Res = null;

    public DefaultTableModel mostrarEscuela() {

        Con = getConexion();
        callSt = null;
        Res = null;

        String[] nombresColumnas = {
            "ID", "Facultad", "Nombre"
        };
        String[] registros = new String[3];

        DefaultTableModel modelo = new DefaultTableModel(null, nombresColumnas);

        try {

            String SQL = "CALL spMostrarEscuela()";
            callSt = Con.prepareCall(SQL);
            Res = callSt.executeQuery();

            while (Res.next()) {
                registros[0] = Res.getString(1);
                registros[1] = Res.getString(2);
                registros[2] = Res.getString(3);
                modelo.addRow(registros);
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.toString());
        } finally {
            try {
                Con.close();
            } catch (SQLException e) {
                System.err.println("Error: " + e.toString());
            }
        }

        return modelo;
    }

    public Vector<ObjetoFacultad> mostrarFacultad() {
        Con = getConexion();
        callSt = null;
        Res = null;

        Vector<ObjetoFacultad> objFacultad = new Vector<>();
        ObjetoFacultad objFacu;

        try {
            String SQL = "CALL spComboFacultad()";
            callSt = Con.prepareCall(SQL);
            Res = callSt.executeQuery();

            objFacu = new ObjetoFacultad();
            objFacu.setIdFacultad("0");
            objFacu.setNombreFacultad("Selecciona");
            objFacultad.add(objFacu);

            while (Res.next()) {
                objFacu = new ObjetoFacultad();
                objFacu.setIdFacultad(Res.getString(1));
                objFacu.setNombreFacultad(Res.getString(2));
                objFacultad.add(objFacu);
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.toString());
        } finally {
            try {
                Con.close();
            } catch (SQLException e) {
                System.err.println("Error: " + e.toString());
            }
        }

        return objFacultad;
    }

    public boolean registrarEscuela(ObjetoEscuela objetoEscuela) {
        CallableStatement callSt = null;
        Connection Con = getConexion();
        String SQL = "CALL spAgregarEscuela(?, ?, ?)";

        try {
            callSt = Con.prepareCall(SQL);
            callSt.setString(1, objetoEscuela.getIdEscuela());
            callSt.setString(2, objetoEscuela.getIdFacultad());
            callSt.setString(3, objetoEscuela.getNombreEscuela());
            callSt.execute();
            return true;
        } catch (SQLException e) {
            System.err.println("Error: " + e.toString());
            return false;
        } finally {
            try {
                Con.close();
            } catch (SQLException e) {
                System.err.println("Error: " + e.toString());
            }
        }
    }

    public DefaultTableModel buscar(String buscar) {

        Con = getConexion();
        callSt = null;
        Res = null;

        String[] nombresColumnas = {
            "ID", "Facultad", "Nombre"
        };
        String[] registros = new String[3];

        DefaultTableModel modelo = new DefaultTableModel(null, nombresColumnas);

        if (buscar.trim().length() > 0) {
            try {
                String SQL = "CALL spBuscarEscuela(?)";
                callSt = Con.prepareCall(SQL);
                callSt.setString(1, buscar);
                Res = callSt.executeQuery();

                while (Res.next()) {
                    registros[0] = Res.getString(1);
                    registros[1] = Res.getString(2);
                    registros[2] = Res.getString(3);

                    modelo.addRow(registros);
                }
            } catch (SQLException e) {
                System.err.println("Error: " + e.toString());
            } finally {
                try {
                    Con.close();
                } catch (SQLException e) {
                    System.err.println("Error: " + e.toString());
                }
            }
        }
        return modelo;
    }

    public boolean actualizarDocentes(ObjetoEscuela objetoEscuela) {
        CallableStatement callSt = null;
        Connection Con = getConexion();
        String SQL = "CALL spActualizarEscuela(?, ?, ?)";

        try {
            callSt = Con.prepareCall(SQL);
            callSt.setString(1, objetoEscuela.getIdFacultad());
            callSt.setString(2, objetoEscuela.getNombreEscuela());
            callSt.setString(3, objetoEscuela.getIdEscuela());
            callSt.execute();
            return true;
        } catch (SQLException e) {
            System.err.println("Error: " + e.toString());
            return false;
        } finally {
            try {
                Con.close();
            } catch (SQLException e) {
                System.err.println("Error: " + e.toString());
            }
        }
    }

    public boolean eliminar(String id) {
        CallableStatement callSt = null;
        Connection Con = getConexion();
        String SQL = "CALL spEliminarEscuela(?)";

        try {
            callSt = Con.prepareCall(SQL);
            callSt.setString(1, id);
            callSt.execute();
            return true;
        } catch (SQLException e) {
            System.err.println("Error: " + e.toString());
            return false;
        } finally {
            try {
                Con.close();
            } catch (SQLException e) {
                System.err.println("Error: " + e.toString());
            }
        }
    }

    public DefaultTableModel mostrarPlanEstudios() {

        Con = getConexion();
        callSt = null;
        Res = null;

        String[] nombresColumnas = {
            "ID", "Escuela", "Curso", "Ciclo", "Horas Teoricas", "Horas Prácticas", "Horas de Laboratorio", "Créditos"
        };
        String[] registros = new String[8];

        DefaultTableModel modelo = new DefaultTableModel(null, nombresColumnas);

        try {

            String SQL = "CALL spMostrarPlanEstudios()";
            callSt = Con.prepareCall(SQL);
            Res = callSt.executeQuery();

            while (Res.next()) {
                registros[0] = Res.getString(1);
                registros[1] = Res.getString(2);
                registros[2] = Res.getString(3);
                registros[3] = Res.getString(4);
                registros[4] = Res.getString(5);
                registros[5] = Res.getString(6);
                registros[6] = Res.getString(7);
                registros[7] = Res.getString(8);
                modelo.addRow(registros);
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.toString());
        } finally {
            try {
                Con.close();
            } catch (SQLException e) {
                System.err.println("Error: " + e.toString());
            }
        }

        return modelo;
    }

    public DefaultTableModel mostrarEscuelaCurso() {

        Con = getConexion();
        callSt = null;
        Res = null;

        String[] nombresColumnas = {
            "ID", "Curso", "Escuela"
        };
        String[] registros = new String[3];

        DefaultTableModel modelo = new DefaultTableModel(null, nombresColumnas);

        try {

            String SQL = "CALL spMostrarCurso()";
            callSt = Con.prepareCall(SQL);
            Res = callSt.executeQuery();

            while (Res.next()) {
                registros[0] = Res.getString(1);
                registros[1] = Res.getString(2);
                registros[2] = Res.getString(3);

                modelo.addRow(registros);
            }

        } catch (SQLException e) {
            System.err.println("Error: " + e.toString());
        } finally {
            try {
                Con.close();
            } catch (SQLException e) {
                System.err.println("Error: " + e.toString());
            }
        }

        return modelo;
    }

    public DefaultTableModel buscarPorEscuela(String buscar) {

        Con = getConexion();
        callSt = null;
        Res = null;

        String[] nombresColumnas = {
            "ID", "Curso", "Escuela"
        };
        String[] registros = new String[3];

        DefaultTableModel modelo = new DefaultTableModel(null, nombresColumnas);

        if (buscar.trim().length() > 0) {
            try {
                String SQL = "CALL spBuscarPorEscuela(?)";
                callSt = Con.prepareCall(SQL);
                callSt.setString(1, buscar);
                Res = callSt.executeQuery();

                while (Res.next()) {
                    registros[0] = Res.getString(1);
                    registros[1] = Res.getString(2);
                    registros[2] = Res.getString(3);

                    modelo.addRow(registros);
                }
            } catch (SQLException e) {
                System.err.println("Error: " + e.toString());
            } finally {
                try {
                    Con.close();
                } catch (SQLException e) {
                    System.err.println("Error: " + e.toString());
                }
            }
        }
        return modelo;
    }
}
