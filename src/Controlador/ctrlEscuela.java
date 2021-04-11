package Controlador;

import Modelo.ObjetoEscuela;
import Modelo.ObjetoFacultad;
import SQL.Sentencias;
import java.util.Vector;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class ctrlEscuela {

    private Sentencias sql;
    private ObjetoFacultad objF;
    private ObjetoEscuela objE;

    DefaultTableModel modelo;
    DefaultComboBoxModel modeloCombo;

    public void mostrarEscuela(JTable tbl) {
        sql = new Sentencias();
        modelo = sql.mostrarEscuela();
        tbl.setModel(modelo);
    }

    public void datosProfesion(JComboBox cbx) {
        sql = new Sentencias();
        modeloCombo = new DefaultComboBoxModel(sql.mostrarFacultad());
        cbx.setModel(modeloCombo);
        objF = (ObjetoFacultad) cbx.getSelectedItem();
    }

    public void registrarEscuela(JComboBox cbx, JTextField txtID, JTextField txtNom) {
        objE = new ObjetoEscuela();
        sql = new Sentencias();
        objF = (ObjetoFacultad) cbx.getSelectedItem();

        objE.setIdEscuela(txtID.getText());
        objE.setIdFacultad(objF.getIdFacultad());
        objE.setNombreEscuela(txtNom.getText());

        if (cbx.getSelectedIndex() == 0) {
            JOptionPane.showMessageDialog(null, "Selecciona la facultad");
        } else {

            if (sql.registrarEscuela(objE)) {
                JOptionPane.showMessageDialog(null, "Registro Guardado");
                limpiarCajas(cbx, txtID, txtNom);
            } else {
                JOptionPane.showMessageDialog(null, "Error al Guardar");
                limpiarCajas(cbx, txtID, txtNom);
            }
        }

    }

    public void buscarEscuela(JTextField txt, JTable tbl) {
        if (txt.getText().trim().equals("")) {
            mostrarEscuela(tbl);
        } else {
            sql = new Sentencias();
            DefaultTableModel modelo = sql.buscar(txt.getText().trim());
            tbl.setModel(modelo);
        }
    }

    public void pasar(JTable tbl, JTextField txtID, JTextField txtNombre, JComboBox cbx) {
        int fila = tbl.getSelectedRow();

        txtID.setText(tbl.getValueAt(fila, 0).toString());
        ////
        String x = tbl.getValueAt(tbl.getSelectedRow(), 1).toString();
        String g = null;
        Vector v = new Vector();
        for (int i = 0; i < cbx.getItemCount(); i++) {
            v.add(cbx.getItemAt(i));
        }
        for (int i = 0; i < cbx.getItemCount(); i++) {
            g = v.get(i).toString();
            if (x.equalsIgnoreCase(g)) {
                cbx.setSelectedIndex(i);
            }
        }
        ///
        txtNombre.setText(tbl.getValueAt(fila, 2).toString());
        txtID.setEnabled(false);
    }

    public void actualizar(JTable tbl, JTextField txtID, JTextField txtNombre, JComboBox cbx) {
        objE = new ObjetoEscuela();
        sql = new Sentencias();
        objF = (ObjetoFacultad) cbx.getSelectedItem();

        objE.setIdFacultad(objF.getIdFacultad());
        objE.setNombreEscuela(txtNombre.getText());
        objE.setIdEscuela(txtID.getText());

        if (sql.actualizarDocentes(objE)) {
            JOptionPane.showMessageDialog(null, "Registro Actualizado");
            limpiarCajas(cbx, txtID, txtNombre);
        } else {
            JOptionPane.showMessageDialog(null, "Error al Actualizar");
            limpiarCajas(cbx, txtID, txtNombre);
        }
    }

    public void eliminar(JTextField txtID, JTextField txtNombre, JComboBox cbx) {
        sql = new Sentencias();

        if (sql.eliminar(txtID.getText().trim())) {
            JOptionPane.showMessageDialog(null, "Registro Eliminado");
            limpiarCajas(cbx, txtID, txtNombre);
        } else {
            JOptionPane.showMessageDialog(null, "Error al eliminar registro");
            limpiarCajas(null, txtID, null);
        }
    }

    public void limpiarCajas(JComboBox cbx, JTextField txtID, JTextField txtNom) {
        txtID.setText(null);
        txtNom.setText(null);
        cbx.setSelectedIndex(0);
        txtID.setEnabled(true);
    }

}
