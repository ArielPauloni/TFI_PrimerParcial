using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;

namespace BLL
{
    public class FacturaBLL
    {
        public FacturaBE ArmarFactura(AbonadoBE abonado, List<LlamadaBE> llamadasDelMes, DateTime? fHasta)
        {
            try
            {
                FacturaBE factura = new FacturaBE();
                double costoLlamadas = 0;
                double costoRoaming = double.Parse(ConfigurationManager.AppSettings["CostoRoaming"]);
                double costoMantenimiento = 0;
                int totalMinutos = 0;
                int cantInternacionales = 0;
                int cantNacionales = 0;
                int cantMismaEmpresa = 0;
                int cantOtraEmpresa = 0;
                int aCel = 0;
                int aFijo = 0;
                bool esNacional = true, esMismaEmpresa = true, esFijo = true;

                LineaMapper lMap = new LineaMapper();
                CostoMapper cMap = new CostoMapper();
                List<CostoBE> costos = cMap.Listar();

                if (abonado.FechaAlta < fHasta)
                {
                    foreach (LlamadaBE llamada in llamadasDelMes)
                    {
                        if (string.Compare(llamada.Linea.TipoServicio.DescripcionTipoServicio, "Fijo", true) == 0) { aFijo++; esFijo = true; }
                        else if (string.Compare(llamada.Linea.TipoServicio.DescripcionTipoServicio, "Celular", true) == 0) { aCel++; esFijo = false; }

                        if (llamada.Linea.Ciudad.Pais.CodigoPais == abonado.Linea.Ciudad.Pais.CodigoPais) { cantNacionales++; esNacional = true; }
                        else { cantInternacionales++; esNacional = false; }

                        if (lMap.LineaEsDeAbonado(llamada.Linea)) { cantMismaEmpresa++; esMismaEmpresa = true; }
                        else { cantOtraEmpresa++; esMismaEmpresa = false; }

                        if (esFijo)
                        {
                            var costo = costos.Where(l => l.ServicioDestino.CodigoTipoServicio == 1 && l.EsNacional == esNacional &&
                            l.MismaEmpresa == esMismaEmpresa).FirstOrDefault();
                            double c = ((CostoBE)costo).Costo;

                            costoLlamadas += c * llamada.MinutosDuracion;
                        }
                        else
                        { //Destino es celular
                            if (abonado.Linea.TipoServicio.CodigoTipoServicio == 1)
                            { // (entre celulares)
                                var costo = costos.Where(l => l.ServicioDestino.CodigoTipoServicio == 2 && l.ServicioOrigen.CodigoTipoServicio == 2 &&
                                l.EsNacional == esNacional && l.MismaEmpresa == esMismaEmpresa).FirstOrDefault();
                                double c = ((CostoBE)costo).Costo;

                                costoLlamadas += c * llamada.MinutosDuracion;
                            }
                            else
                            { //(entre fijo y celu)
                                var costo = costos.Where(l => l.ServicioDestino.CodigoTipoServicio == 2 && l.ServicioOrigen.CodigoTipoServicio == 1 &&
                                l.EsNacional == esNacional && l.MismaEmpresa == esMismaEmpresa).FirstOrDefault();
                                double c = ((CostoBE)costo).Costo;

                                costoLlamadas += c * llamada.MinutosDuracion;
                            }
                        }
                        if (!esNacional) { costoLlamadas += costoRoaming * llamada.MinutosDuracion; }
                        totalMinutos += llamada.MinutosDuracion;
                    }
                    costoMantenimiento = double.Parse(ConfigurationManager.AppSettings["CargoMantenimiento"]);
                }

                factura.Detalle = string.Format(@"Total de llamadas: {0} <br>Duración total (en minutos): {1} <br> 
                    Cantidad de llamadas Nacionales: {2} <br>Cantidad de llamadas Internacionales: {3} <br> 
                    Cantidad de llamadas a otras empresas: {4} <br>Cantidad de llamadas a misma empresa: {5} <br>
                    Cantidad de llamadas a teléfono fijo: {6} <br>Cantidad de llamadas a teléfono celular: {7} <br>",
                    llamadasDelMes.Count.ToString(), totalMinutos.ToString(), cantNacionales.ToString(), cantInternacionales.ToString(),
                    cantOtraEmpresa.ToString(), cantMismaEmpresa.ToString(), aFijo.ToString(), aCel.ToString());
                factura.CostoMantenimiento = costoMantenimiento;
                factura.CostoTotal = factura.CostoMantenimiento + costoLlamadas;
                factura.Abonado = abonado;
                factura.FechaFactura = DateTime.Now;
                factura.Llamadas = llamadasDelMes;
                return factura;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string ObtenerDetalleLlamadasPorPromocion(string fStr)
        {
            double costoLlamadas = 0;
            double costoRoaming = double.Parse(ConfigurationManager.AppSettings["CostoRoaming"]);
            int totalMinutos = 0;
            int totalLlamadas = 0;
            int cantInternacionales = 0;
            int cantNacionales = 0;
            int cantMismaEmpresa = 0;
            int cantOtraEmpresa = 0;
            int aCel = 0;
            int aFijo = 0;
            bool esNacional = true, esMismaEmpresa = true, esFijo = true;

            DateTime? fDesde = default(DateTime?);
            DateTime? fHasta = default(DateTime?);

            fDesde = Convert.ToDateTime(fStr);
            fHasta = Convert.ToDateTime(fStr).AddMonths(1);

            AbonadoMapper aMap = new AbonadoMapper();
            LlamadaMapper llMap = new LlamadaMapper();
            List<AbonadoBE> abonadosDelMes = aMap.ObtenerAbonadosDelMes(fHasta);
            LineaMapper lMap = new LineaMapper();
            CostoMapper cMap = new CostoMapper();
            List<CostoBE> costos = cMap.Listar();

            foreach (AbonadoBE abonado in abonadosDelMes)
            {
                List<LlamadaBE> llamadas = llMap.ListarPorAbonado(abonado, fDesde, fHasta);

                totalLlamadas += llamadas.Count;

                foreach (LlamadaBE llamada in llamadas)
                {
                    if (string.Compare(llamada.Linea.TipoServicio.DescripcionTipoServicio, "Fijo", true) == 0) { aFijo++; esFijo = true; }
                    else if (string.Compare(llamada.Linea.TipoServicio.DescripcionTipoServicio, "Celular", true) == 0) { aCel++; esFijo = false; }

                    if (llamada.Linea.Ciudad.Pais.CodigoPais == abonado.Linea.Ciudad.Pais.CodigoPais) { cantNacionales++; esNacional = true; }
                    else { cantInternacionales++; esNacional = false; }

                    if (lMap.LineaEsDeAbonado(llamada.Linea)) { cantMismaEmpresa++; esMismaEmpresa = true; }
                    else { cantOtraEmpresa++; esMismaEmpresa = false; }

                    if (esFijo)
                    {
                        var costo = costos.Where(l => l.ServicioDestino.CodigoTipoServicio == 1 && l.EsNacional == esNacional &&
                        l.MismaEmpresa == esMismaEmpresa).FirstOrDefault();
                        double c = ((CostoBE)costo).Costo;

                        costoLlamadas += c * llamada.MinutosDuracion;
                    }
                    else
                    { //Destino es celular
                        if (abonado.Linea.TipoServicio.CodigoTipoServicio == 1)
                        { // (entre celulares)
                            var costo = costos.Where(l => l.ServicioDestino.CodigoTipoServicio == 2 && l.ServicioOrigen.CodigoTipoServicio == 2 &&
                            l.EsNacional == esNacional && l.MismaEmpresa == esMismaEmpresa).FirstOrDefault();
                            double c = ((CostoBE)costo).Costo;

                            costoLlamadas += c * llamada.MinutosDuracion;
                        }
                        else
                        { //(entre fijo y celu)
                            var costo = costos.Where(l => l.ServicioDestino.CodigoTipoServicio == 2 && l.ServicioOrigen.CodigoTipoServicio == 1 &&
                            l.EsNacional == esNacional && l.MismaEmpresa == esMismaEmpresa).FirstOrDefault();
                            double c = ((CostoBE)costo).Costo;

                            costoLlamadas += c * llamada.MinutosDuracion;
                        }
                    }
                    if (!esNacional) { costoLlamadas += costoRoaming * llamada.MinutosDuracion; }
                    totalMinutos += llamada.MinutosDuracion;
                }
            }

            return string.Format(@"Total de llamadas: {0} <br>Duración total (en minutos): {1} <br> 
                    Cantidad de llamadas Nacionales: {2} <br>Cantidad de llamadas Internacionales: {3} <br> 
                    Cantidad de llamadas a otras empresas: {4} <br>Cantidad de llamadas a misma empresa: {5} <br>
                    Cantidad de llamadas a teléfono fijo: {6} <br>Cantidad de llamadas a teléfono celular: {7} <br>",
                    totalLlamadas.ToString(), totalMinutos.ToString(), cantNacionales.ToString(), cantInternacionales.ToString(),
                    cantOtraEmpresa.ToString(), cantMismaEmpresa.ToString(), aFijo.ToString(), aCel.ToString());
        }

        public double ObtenerRecaudacionPorLlamadas(string fStr)
        {
            try
            {
                DateTime? fDesde = default(DateTime?);
                DateTime? fHasta = default(DateTime?);

                fDesde = Convert.ToDateTime(fStr);
                fHasta = Convert.ToDateTime(fStr).AddMonths(1);

                AbonadoMapper aMap = new AbonadoMapper();
                LlamadaMapper lMap = new LlamadaMapper();
                List<AbonadoBE> abonadosDelMes = aMap.ObtenerAbonadosDelMes(fHasta);
                List<FacturaBE> facturas = new List<FacturaBE>();
                double RecaudacionTotal = 0;

                foreach (AbonadoBE abonado in abonadosDelMes)
                {
                    List<LlamadaBE> llamadas = lMap.ListarPorAbonado(abonado, fDesde, fHasta);
                    FacturaBE factura = new FacturaBE();
                    factura = ArmarFactura(abonado, llamadas, fHasta);
                    RecaudacionTotal += factura.CostoTotal;
                    facturas.Add(factura);
                }
                return RecaudacionTotal;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
