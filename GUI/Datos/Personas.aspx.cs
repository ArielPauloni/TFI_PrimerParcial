using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BE;

namespace GUI.Datos
{
    public partial class Personas : System.Web.UI.Page
    {
        private TipoDocumentoBLL gestorTipoDocumento = new TipoDocumentoBLL();
        private PersonaBLL gestorPersona = new PersonaBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlTipoDocumento.DataSource = gestorTipoDocumento.Listar();
                ddlTipoDocumento.DataTextField = "DescripcionTipoDocumento";
                ddlTipoDocumento.DataValueField = "CodigoTipoDocumento";
                ddlTipoDocumento.DataBind();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Datos/Abonados.aspx");
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if ((!string.IsNullOrWhiteSpace(txtApellido.Text)) || (!string.IsNullOrWhiteSpace(txtNombre.Text)) ||
                (!string.IsNullOrWhiteSpace(txtNroDocumento.Text)))
            {
                TipoDocumentoBE tipoDoc = new TipoDocumentoBE
                {
                    DescripcionTipoDocumento = ddlTipoDocumento.SelectedItem.Text.ToString(),
                    CodigoTipoDocumento = short.Parse(ddlTipoDocumento.SelectedItem.Value)
                };
                PersonaBE persona = new PersonaBE
                {
                    Apellido = txtApellido.Text.Trim(),
                    Nombre = txtNombre.Text.Trim(),
                    TipoDocumento = tipoDoc,
                    NroDocumento = txtNroDocumento.Text.Trim()
                };
                if (gestorPersona.Insertar(persona) > 0)
                {
                    UC_MensajeModal.SetearMensaje("Datos Salvados correctamente");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
                }
                else
                {
                    UC_MensajeModal.SetearMensaje("No se pudieron grabar correctamente los datos");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
                }
                LimpiarDatos();
            }
            else
            {
                UC_MensajeModal.SetearMensaje("Falta completar algún dato");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
            }
        }

        private void LimpiarDatos()
        {
            txtApellido.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtNroDocumento.Text = string.Empty;
        }
    }
}