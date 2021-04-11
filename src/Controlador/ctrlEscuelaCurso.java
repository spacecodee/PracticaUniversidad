package Controlador;

import SQL.Sentencias;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class ctrlEscuelaCurso {

    private Sentencias sql;
    DefaultTableModel modelo;

    public void mostrarEscuela(JTable tbl) {
        sql = new Sentencias();
        modelo = sql.mostrarEscuelaCurso();
        tbl.setModel(modelo);
    }

    public void buscarEscuela(JTextField txt, JTable tbl) {
        if (txt.getText().trim().equals("")) {
            mostrarEscuela(tbl);
        } else {
            sql = new Sentencias();
            modelo = sql.buscarPorEscuela(txt.getText().trim());
            tbl.setModel(modelo);
        }
    }
}
