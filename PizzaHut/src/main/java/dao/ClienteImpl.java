package dao;

import java.io.File;
import java.io.IOException;
import java.util.List;
import model.Cliente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.LogManager;
import java.util.logging.Logger;
import javax.faces.context.FacesContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

public class ClienteImpl extends Conexion implements ICRUD<Cliente> {

    @Override
    public void registrar(Cliente cliente) {
        try {
            String sql = "insert into cliente"
                    + " (NOMCLI,APECLI,CELCLI,DNICLI,DIRCLI,ESTCLI)"
                    + " values (?,?,?,?,?,?) ";
            PreparedStatement ps = this.conectar().prepareStatement(sql);
            ps.setString(1, cliente.getNOMCLI());
            ps.setString(2, cliente.getAPECLI());
            ps.setString(3, cliente.getCELCLI());
            ps.setString(4, cliente.getDNICLI());
            ps.setString(5, cliente.getDIRCLI());
            ps.setString(6, "A");
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de REGISTRAR en ClienteImpl/registrar : {0}.", e.getMessage());
        }
    }

    @Override
    public void modificar(Cliente cliente) throws Exception {
        try {
            String sql = "update cliente set NOMCLI=?,APECLI=?,CELCLI=?,DIRCLI=?,DNICLI=?,ESTCLI=? where IDCLI=?";
            PreparedStatement ps = this.conectar().prepareStatement(sql);
            ps.setString(1, cliente.getNOMCLI());
            ps.setString(2, cliente.getAPECLI());
            ps.setString(3, cliente.getCELCLI());
            ps.setString(4, cliente.getDIRCLI());
            ps.setString(5, cliente.getDNICLI());
            ps.setString(6, "A");
            ps.setInt(7, cliente.getIDCLI());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de MODIFICAR en ClienteImpl/modificar : {0}.", e.getMessage());
        }
    }

    @Override
    public void eliminar(Cliente cliente) throws Exception {
        try {
            String sql = "UPDATE cliente SET ESTCLI='I' WHERE IDCLI LIKE ?";
            PreparedStatement ps = this.conectar().prepareStatement(sql);
            ps.setInt(1, cliente.getIDCLI());
            ps.executeUpdate();
        } catch (SQLException e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de ELIMINAR en ClienteImpl/eliminar : {0}.", e.getMessage());
        }
    }

    public List<Cliente> listarTodosAc(int estado) throws Exception {
        List<Cliente> lista = new ArrayList<>();
        ResultSet rs;
        String sql = "";
        switch (estado) {
            case 0:
                doSomething();
                break;
            case 1:
                sql = "SELECT * FROM cliente WHERE ESTCLI ='A' ORDER BY IDCLI DESC";
                break;
            case 2:
                sql = "SELECT * FROM cliente WHERE ESTCLI ='I' ORDER BY IDCLI DESC";
                break;
            case 3:
                sql = "select * from cliente ORDER BY IDCLI DESC";
                break;
        }
        try {
            PreparedStatement ps = this.conectar().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setIDCLI(rs.getInt("IDCLI"));
                cli.setNOMCLI(rs.getString("NOMCLI"));
                cli.setAPECLI(rs.getString("APECLI"));
                cli.setDIRCLI(rs.getString("DIRCLI"));
                cli.setCELCLI(rs.getString("CELCLI"));
                cli.setDNICLI(rs.getString("DNICLI"));
                cli.setESTCLI(rs.getString("ESTCLI"));
                lista.add(cli);
            }
        } catch (Exception e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de LISTAR LOS DATOS en ClienteImpl/listar : {0}.", e.getMessage());
        }
        return lista;
    }

    public boolean existe(Cliente modelo, List<Cliente> listaModelo) {
        for (Cliente cli : listaModelo) {
            if (modelo.getDNICLI().equals(cli.getDNICLI())) {
                return true;
            }
        }
        return false;
    }
    
        public void cambiarEstado(Cliente obj) throws Exception {
        try {
            String sql = "UPDATE cliente SET ESTCLI='A' WHERE IDCLI LIKE ?";
            PreparedStatement ps = this.conectar().prepareStatement(sql);
            ps.setInt(1, obj.getIDCLI());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("Error en ClienteImpl/cambiarEstado: " + e.getMessage());
        }
    }

        
    public List<Cliente> listarTodos() throws Exception {
        return Collections.emptyList();
    }

    private void doSomething() {
    }

    @Override
    public List<Cliente> listar() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Cliente> listarAgotado() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Cliente> Listado() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}