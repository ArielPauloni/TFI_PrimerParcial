using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BLL;

namespace GUI.Datos
{
    public partial class NuevaLlamada : System.Web.UI.Page
    {
        private AbonadoBLL gestorAbonados = new AbonadoBLL();
        private LlamadaBLL gestorLlamadas = new LlamadaBLL();
        private LineaBLL gestorLinea = new LineaBLL();

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

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Datos/Llamadas.aspx");
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if ((!string.IsNullOrWhiteSpace(txtFechaLlamada.Text)) || (ddlAbonados.SelectedIndex > -1) ||
                (ddlLineaDestino.SelectedIndex > -1) || (!string.IsNullOrWhiteSpace(txtMinutosDuracion.Text)))
            {
                AbonadoBE abonado = new AbonadoBE();
                abonado.NroAbonado = short.Parse(ddlAbonados.SelectedItem.Value);

                AbonadoBE miAbonado = new AbonadoBE();
                miAbonado = gestorAbonados.ObtenerAbonado(abonado);

                LineaBE lineaDestino = new LineaBE();
                lineaDestino.CodigoLinea = short.Parse(ddlLineaDestino.SelectedItem.Value);

                LineaBE miLineaDestino = new LineaBE();
                miLineaDestino = gestorLinea.ObtenerLinea(lineaDestino);

                LlamadaBE llamada = new LlamadaBE
                {
                    Abonado = miAbonado,
                    Linea = miLineaDestino,
                    FechaLlamada = DateTime.ParseExact(txtFechaLlamada.Text, "yyyy-MM-dd", null),
                    MinutosDuracion = short.Parse(txtMinutosDuracion.Text)
                };

                if (gestorLlamadas.Insertar(llamada) > 0)
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
            txtFechaLlamada.Text = string.Empty;
            txtMinutosDuracion.Text = string.Empty;
        }

        protected void ddlAbonados_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAbonados.SelectedIndex > 0)
            {
                AbonadoBE abonado = new AbonadoBE();
                abonado.NroAbonado = short.Parse(ddlAbonados.SelectedItem.Value);

                AbonadoBE miAbonado = new AbonadoBE();
                miAbonado = gestorAbonados.ObtenerAbonado(abonado);

                List<LineaBE> lineas = gestorLinea.Listar();
                var lineaQuery = lineas.Where(p => p.CodigoLinea != miAbonado.Linea.CodigoLinea)
                    .Select(p => new { CodigoLinea = p.CodigoLinea, DisplayText = p.ToString() });

                ddlLineaDestino.DataSource = lineaQuery;
                ddlLineaDestino.DataValueField = "CodigoLinea";
                ddlLineaDestino.DataTextField = "DisplayText";
                ddlLineaDestino.DataBind();
            }
        }
    }
}