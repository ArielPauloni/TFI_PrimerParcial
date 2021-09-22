using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BLL;

namespace GUI.Consultas
{
    public partial class Pto6 : System.Web.UI.Page
    {
        private LlamadaBLL gestorLlamadas = new LlamadaBLL();
        private FacturaBLL gestorFacturas = new FacturaBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var months = CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;
                for (int i = 0; i < months.Length - 1; i++)
                {
                    ddlMes.Items.Add(new ListItem(char.ToUpper(months[i][0]) + months[i].Substring(1), (i + 1).ToString()));
                }
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            string fStr = ddlAnio.Text + "/" + ddlMes.SelectedValue + "/" + "01";
            
            string detalleDelMesPorPromocion = gestorFacturas.ObtenerDetalleLlamadasPorPromocion(fStr);

            UC_MensajeModal.SetearMensaje(string.Format(detalleDelMesPorPromocion));
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
        }
    }
}