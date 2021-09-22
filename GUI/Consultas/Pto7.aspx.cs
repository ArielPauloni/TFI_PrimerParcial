using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BLL;

namespace GUI.Consultas
{
    public partial class Pto7 : System.Web.UI.Page
    {
        private AbonadoBLL gestorAbonados = new AbonadoBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<AbonadoBE> abonados = gestorAbonados.Listar();
                var abonadoQuery = abonados.Select(a => new { NroAbonado = a.NroAbonado, DisplayText = a.ToString() });

                ddlAbonados.DataSource = abonadoQuery;
                ddlAbonados.DataValueField = "NroAbonado";
                ddlAbonados.DataTextField = "DisplayText";
                ddlAbonados.DataBind();
                ddlAbonados.Items.Insert(0, "Seleccione Abonado");
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            if (ddlAbonados.SelectedIndex > 0)
            {

                UC_MensajeModal.SetearMensaje(string.Format(""));
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
            }
            else
            {
                UC_MensajeModal.SetearMensaje("Por favor, seleccione un abonado");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
            }
        }

        protected void btnConsultar2_Click(object sender, EventArgs e)
        {
          
                UC_MensajeModal.SetearMensaje(string.Format(""));
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
        }
    }
}