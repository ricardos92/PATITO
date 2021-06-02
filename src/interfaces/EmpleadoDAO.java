package interfaces;

import java.util.ArrayList;

import beans.EmpleadoDTO;

public interface EmpleadoDAO {
    
    public int registrar(EmpleadoDTO e);
    public ArrayList<EmpleadoDTO> listado();
    public int actualizarEmpleado(EmpleadoDTO e);
    public int eliminar(EmpleadoDTO e);
    public EmpleadoDTO validarAcceso(String correo_usuario, String clave);
    public ArrayList<EmpleadoDTO> listadoTipoEmpleado();
}
