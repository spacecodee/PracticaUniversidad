package Controlador;

import SQL.Sentencias;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class ctrlPlanEstudio {

    private Sentencias sql;
    DefaultTableModel modelo;

    public void mostrarPlan(JTable tbl) {
        sql = new Sentencias();
        modelo = sql.mostrarPlanEstudios();
        tbl.setModel(modelo);
    }

}
