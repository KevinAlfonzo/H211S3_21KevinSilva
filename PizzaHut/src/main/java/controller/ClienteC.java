
import dao.ClienteImpl;
import java.io.IOException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import model.Cliente;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.*;
import javax.servlet.ServletContext;
import lombok.Data;

@Named(value = "clienteC")
@SessionScoped
@Data
public class ClienteC implements Serializable {

    private Cliente cliente;
    private ClienteImpl dao;
    private List<Cliente> lstCliente;
    private int estado = 1;

    public ClienteC() {
        cliente = new Cliente();
        dao = new ClienteImpl();

    }

    public void registrar() throws Exception {
        try {
            if (!dao.existe(cliente, lstCliente)) {
                cliente.setNOMCLI(caseMayuscula(cliente.getNOMCLI()));
                cliente.setAPECLI(caseMayuscula(cliente.getAPECLI()));;
                dao.registrar(cliente);
                listar();
                limpiar();
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Registrado", "Registrado con éxito"));

            } else {
                limpiar();
                FacesContext.getCurrentInstance().addMessage(null,
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "AVISO", "DNI duplicado"));
            }

        } catch (Exception e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de REGISTRAR en ClienteC/registrar : {0}.", e.getMessage());
        }
    }

    public void modificar() throws Exception {
        try {
            cliente.setNOMCLI(caseMayuscula(cliente.getNOMCLI()));
            cliente.setAPECLI(caseMayuscula(cliente.getAPECLI()));
            dao.modificar(cliente);
            listar();
            limpiar();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Modificado", "Registrado con éxito"));

        } catch (Exception e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de MODIFICAR en ClienteC/modificar : {0}.", e.getMessage());
        }
    }

    public void eliminar() throws Exception {
        try {
            dao.eliminar(cliente);
            listar();
            limpiar();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Eliminado", "Eliminado con éxito"));
        } catch (Exception e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de ELIMINAR en ClienteC/eliminar : {0}.", e.getMessage());
        }
    }

    public void listar() throws Exception {
        try {
            lstCliente = dao.listarTodosAc(estado);
        } catch (Exception e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de LISTAR en ClienteC/listar : {0}.", e.getMessage());
        }
    }

    public void limpiar() throws Exception {
        try {
            cliente = new Cliente();
        } catch (Exception e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de LIMPIAR en ClienteC/limpiar : {0}.", e.getMessage());
        }
    }
    
        public void restaurar() throws Exception {
        try {
            dao.cambiarEstado(cliente);
            listar();
            limpiar();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Restaurado", "Se restauro con éxito"));
        } catch (Exception e) {
            LogManager lgmngr = LogManager.getLogManager();
            Logger log = lgmngr.getLogger(Logger.GLOBAL_LOGGER_NAME);
            log.log(Level.INFO, "Se a encontrado un ERROR al momento de RESTAURAR en EmpleadoC/eliminar : {0}", e.getMessage());
        }
    }

        

    public String caseMayuscula(String camelcase) {
        char ch[] = camelcase.toCharArray();
        for (int i = 0; i < camelcase.length(); i++) {
            if (i == 0 && ch[i] != ' ' || ch[i] != ' ' && ch[i - 1] == ' ') {  // Si se encuentra el primer carácter de una palabra
                if (ch[i] >= 'a' && ch[i] <= 'z') {      // Si está en minúsculas
                    ch[i] = (char) (ch[i] - 'a' + 'A');  // Convertir en mayúsculas
                }
            } // Si aparte del primer carácter cualquiera está en mayúsculas
            else if (ch[i] >= 'A' && ch[i] <= 'Z') {     // Convertir en minúsculas
                ch[i] = (char) (ch[i] + 'a' - 'A');
            }
        }
        String st = new String(ch);
        camelcase = st;
        return camelcase;
    }

    public String camelMinuscula(String camelcase) {
        char ch[] = camelcase.toCharArray();
        for (int i = 0; i < camelcase.length(); i++) {
            if (i == 0 && ch[i] != ' ' || ch[i] != ' ' && ch[i - 1] == ' ') {  // Si se encuentra el primer carácter de una palabra
                if (ch[i] >= 'A' && ch[i] <= 'Z') {      // Si está en mayúsculas
                    ch[i] = (char) (ch[i] - 'A' + 'a');  // Convertir en minúsculas
                }
            } // Si aparte del primer carácter cualquiera está en mayúsculas
            else if (ch[i] >= 'A' && ch[i] <= 'Z') {     // Convertir en minúsculas
                ch[i] = (char) (ch[i] + 'a' - 'A');
            }
        }
        String st = new String(ch);
        camelcase = st;
        return camelcase;
    }

    
    
}