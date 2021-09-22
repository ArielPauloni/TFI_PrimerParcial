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
    public partial class Pto4 : System.Web.UI.Page
    {
        private AbonadoBLL gestorAbonados = new AbonadoBLL();
        private LlamadaBLL gestorLlamadas = new LlamadaBLL();
        private FacturaBLL gestorFacturas = new FacturaBLL();

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

                var months = CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;
                for (int i = 0; i < months.Length - 1; i++)
                {
                    ddlMes.Items.Add(new ListItem(char.ToUpper(months[i][0]) + months[i].Substring(1), (i + 1).ToString()));
                }
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            if (ddlAbonados.SelectedIndex > 0)
            {
                DateTime? fDesde = default(DateTime?);
                DateTime? fHasta = default(DateTime?);

                string fStr = ddlAnio.Text + "/" + ddlMes.SelectedValue + "/" + "01";
                fDesde = Convert.ToDateTime(fStr);
                fHasta = Convert.ToDateTime(fStr).AddMonths(1);

                AbonadoBE abonado = new AbonadoBE();
                AbonadoBE miAbonado = new AbonadoBE();
                abonado.NroAbonado = short.Parse(ddlAbonados.SelectedItem.Value);
                List<LlamadaBE> llamadasDelMes = gestorLlamadas.ListarPorAbonadoMasFecha(abonado, fDesde, fHasta);
                miAbonado = gestorAbonados.ObtenerAbonado(abonado);

                Session["LlamadasDelMesPto4"] = llamadasDelMes;

                FacturaBE factura = new FacturaBE();
                factura = gestorFacturas.ArmarFactura(miAbonado, llamadasDelMes, fHasta);

                UC_MensajeModal.SetearMensaje(factura.Detalle + @"<br> Total de la factura: " + factura.CostoTotal.ToString());
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);

                grvCargosDelMes.DataSource = llamadasDelMes;
                grvCargosDelMes.DataBind();

                divResultados.Visible = true;
            }
            else
            {
                divResultados.Visible = false;
                UC_MensajeModal.SetearMensaje("Por favor, seleccione un abonado");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
            }
        }

        protected void grvCargosDelMes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvCargosDelMes.PageIndex = e.NewPageIndex;
            grvCargosDelMes.EditIndex = -1;
            grvCargosDelMes.DataSource = Session["LlamadasDelMesPto4"];
            grvCargosDelMes.DataBind();
        }
    }
}