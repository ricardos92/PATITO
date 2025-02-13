<%@page import="beans.EmpleadoDTO"%>
<%@page import="beans.ClienteDTO"%>
<%@ taglib  uri="/WEB-INF/libreria.tld" prefix="tools"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
  EmpleadoDTO user = (EmpleadoDTO) request.getSession().getAttribute("e");
  if (user == null) {
      response.sendRedirect("login.jsp");
  }
  
%> 
    
<%
   ClienteDTO existeCliente = (ClienteDTO) request.getAttribute("clienteEncontrado");
   String action = "cs?opcion=registrar";
   String typeColor = "primary";
   String opcion = "Registrar";
   String tituloForm = "Registro de Clientes";
   String entidad = "cliente";
              
   if (existeCliente != null) {
       action = "cs?opcion=actualizar";
       typeColor = "success";
       opcion="Actualizar";
       tituloForm = "Actualizar un cliente";
     }     
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <jsp:include page="reusable/styles.jsp"></jsp:include>
    <title><%=opcion%> Cliente</title>
  </head>
  <body>
    <div class="wrapper">
      <jsp:include page="components/sidebar.jsp"></jsp:include>
      <jsp:include page="components/header.jsp"></jsp:include>
      <div class="page-wrapper">
        <div class="page-content">
          <jsp:include page="components/breadcrumb.jsp">
            <jsp:param name="pagina" value="Cliente" />
            <jsp:param name="accion" value="<%=opcion%>" />
          </jsp:include>
          <div class="row">
            <div class="col-xl-9 mx-auto">
              <hr />
              <form
                id="myForm"
                action="<%=action%>"
                class="needs-validation"
                method="POST"
                novalidate
              >
                <div
                  class="
                    card
                    border-top border-0 border-4 border-<%=typeColor%>
                  "
                >
                  <div class="card-body">
                    <div class="border p-4 rounded">
                      <div class="card-title d-flex align-items-center">
                        <div>
                          <i
                            class="bx bxs-user me-1 font-22 text-<%=typeColor%>"
                          ></i>
                        </div>
                        <h5 class="mb-0 text-<%=typeColor%>">
                          <%=tituloForm %>
                        </h5>
                      </div>
                      <hr />
                      <input
                        type="hidden"
                        class="input-hidden"
                        id="input-hidden"
                        name="txtCodigoCliente"
                        data-entidad="<%=entidad %>"
                        value="${ clienteEncontrado.codigo }"
                      />
                      <div class="row mb-3">
                        <label
                          for="txtNombreCliente"
                          class="col-sm-3 col-form-label"
                          >Ingrese Nombre:
                        </label>
                        <div class="col-sm-9">
                          <input
                            type="text"
                            class="form-control"
                            id="txtNombreCliente"
                            name="txtNombreCliente"
                            placeholder="Nombre del cliente"
                            value="${ clienteEncontrado.nombre }"
                            required
                          />
                          <div class="invalid-feedback">
                            Ingrese un nombre v&aacute;lido
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <label
                          for="txtApellidoCliente"
                          class="col-sm-3 col-form-label"
                          >Ingrese Apellido:
                        </label>
                        <div class="col-sm-9">
                          <input
                            type="text"
                            class="form-control"
                            id="txtApellidoCliente"
                            name="txtApellidoCliente"
                            placeholder="Apellido del cliente"
                            value="${ clienteEncontrado.apellido }"
                            required
                          />
                          <div class="invalid-feedback">
                            Ingrese un apellido v&aacute;lido
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <label
                          for="txtTelefonoCliente"
                          class="col-sm-3 col-form-label"
                          >N�mero tel&eacute;fonico:
                        </label>
                        <div class="col-sm-9">
                          <input
                            type="text"
                            class="form-control"
                            id="txtTelefonoCliente"
                            name="txtTelefonoCliente"
                            placeholder="Celular o fijo"
                            value="${ clienteEncontrado.telefono }"
                            required
                          />
                          <div class="invalid-feedback">
                            Ingrese un n�mero tel&eacute;fonico v�lido
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <label
                          for="txtDNICliente"
                          class="col-sm-3 col-form-label"
                          >DNI :</label
                        >
                        <div class="col-sm-9">
                          <input
                            type="text"
                            class="form-control"
                            id="txtDNICliente"
                            name="txtDNICliente"
                            placeholder="Dni del cliente"
                            value="${ clienteEncontrado.dni }"
                            required
                          />
                          <div class="invalid-feedback">
                            Ingrese un DNI v&aacute;lido
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <label
                          for="cboDistritoCliente"
                          class="col-sm-3 col-form-label"
                          >Distrito :</label
                        >
                        <div class="col-sm-9">
                          <select
                            id="cboDistritoCliente"
                            name="cboDistritoCliente"
                            class="form-select"
                            aria-label="Distrito del Cliente"
                            required
                          >
                            <tools:comboDistrito
                              idDistrito="${ clienteEncontrado.codigoDistrito }"
                            />
                          </select>
                          <div class="invalid-feedback">
                            Seleccione un distrito
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <label
                          for="txtDireccionCliente"
                          class="col-sm-3 col-form-label"
                          >Direcci&oacute;n :</label
                        >
                        <div class="col-sm-9">
                          <textarea
                            class="form-control"
                            id="txtDireccionCliente"
                            name="txtDireccionCliente"
                            rows="3"
                            placeholder="Direcci&oacute;n completa del cliente"
                            required
                          >${ clienteEncontrado.direccion }</textarea
                          >
                          <div class="invalid-feedback">
                            El campo direcci&oacute;n es obligatorio
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <label class="col-sm-3 col-form-label"></label>
                        <div class="col-sm-9">
                          <button
                            type="submit"
                            class="btn btn-<%=typeColor%> px-5"
                          >
                            <%=opcion%> Cliente
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="overlay toggle-icon"></div>
      <a href="javaScript:;" class="back-to-top"
        ><i class="bx bxs-up-arrow-alt"></i
      ></a>

      <jsp:include page="components/footer.jsp"></jsp:include>
    </div>

    <jsp:include page="reusable/scripts.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="js/send_form.js"></script>
  </body>
</html>
