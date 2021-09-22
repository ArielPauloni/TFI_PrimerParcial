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
        private FacturaBLL gestorFacturas = new FacturaBLL();
        private LlamadaBLL gestorLlamadas = new LlamadaBLL();

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
                AbonadoBE abonado = new AbonadoBE();
                //AbonadoBE miAbonado = new AbonadoBE();
                abonado.NroAbonado = short.Parse(ddlAbonados.SelectedItem.Value);
                List<LlamadaBE> llamadasDelAbonado = gestorLlamadas.ListarPorAbonadoMasFecha(abonado, default(DateTime?), default(DateTime?));
                //miAbonado = gestorAbonados.ObtenerAbonado(abonado);

                string porcentajeLlamadasPorAbonado = gestorFacturas.ObtenerPorcentajeLlamadas(llamadasDelAbonado);

                UC_MensajeModal.SetearMensaje(porcentajeLlamadasPorAbonado);
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
            AbonadoBE abonado = new AbonadoBE();
            abonado.NroAbonado = 0;
            List<LlamadaBE> llamadas = gestorLlamadas.ListarPorAbonadoMasFecha(abonado, default(DateTime?), default(DateTime?));
            string porcentajeLlamadas = gestorFacturas.ObtenerPorcentajeLlamadas(llamadas);
                    
            UC_MensajeModal.SetearMensaje(porcentajeLlamadas);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
        }
    }
}