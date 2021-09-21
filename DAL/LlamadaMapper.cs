using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using BE;

namespace DAL
{
    public class LlamadaMapper
    {
        public int Insertar(LlamadaBE llamada)
        {
            AccesoSQL AccesoSQL = new AccesoSQL();
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(AccesoSQL.CrearParametroInt("NroAbonado", llamada.Abonado.NroAbonado));
            parametros.Add(AccesoSQL.CrearParametroInt("CodigoLinea", llamada.Linea.CodigoLinea));
            parametros.Add(AccesoSQL.CrearParametroDate("FechaLlamada", llamada.FechaLlamada));
            parametros.Add(AccesoSQL.CrearParametroInt("MinutosDuracion", llamada.MinutosDuracion));
            return AccesoSQL.Escribir("pr_Insertar_Llamada", parametros);
        }

        public List<LlamadaBE> Listar()
        {
            List<LlamadaBE> listaLlamadas = new List<LlamadaBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            DataTable tabla = AccesoSQL.Leer("pr_Listar_Llamadas", null);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    //Parte destino
                    TipoServicioBE TipoServ = new TipoServicioBE
                    {
                        CodigoTipoServicio = int.Parse(fila["CodigoTipoServicio"].ToString()),
                        DescripcionTipoServicio = fila["DescripcionTipoServicio"].ToString()
                    };

                    PaisBE pais = new PaisBE
                    {
                        CodigoPais = int.Parse(fila["CodigoPais"].ToString()),
                        PaisDescripcion = fila["DescripcionPais"].ToString()
                    };

                    CiudadBE ciudad = new CiudadBE
                    {
                        CodigoCiudad = int.Parse(fila["CodigoCiudad"].ToString()),
                        CiudadDescripcion = fila["DescripcionCiudad"].ToString(),
                        Pais = pais
                    };

                    LineaBE linea = new LineaBE
                    {
                        CodigoLinea = int.Parse(fila["CodigoLinea"].ToString()),
                        NroLinea = fila["NroLinea"].ToString(),
                        Ciudad = ciudad,
                        TipoServicio = TipoServ,
                        PrefijoLinea = fila["PrefijoLinea"].ToString()
                    };

                    //Parte abonado
                    TipoServicioBE TipoServAbonado = new TipoServicioBE
                    {
                        CodigoTipoServicio = int.Parse(fila["CodigoTipoServicioAbonado"].ToString()),
                        DescripcionTipoServicio = fila["DescripcionTipoServicioAbonado"].ToString()
                    };

                    PaisBE paisAbonado = new PaisBE
                    {
                        CodigoPais = int.Parse(fila["CodigoPaisAbonado"].ToString()),
                        PaisDescripcion = fila["DescripcionPaisAbonado"].ToString()
                    };

                    CiudadBE ciudadAbonado = new CiudadBE
                    {
                        CodigoCiudad = int.Parse(fila["CodigoCiudadAbonado"].ToString()),
                        CiudadDescripcion = fila["DescripcionCiudadAbonado"].ToString(),
                        Pais = paisAbonado
                    };

                    LineaBE lineaAbonado = new LineaBE
                    {
                        CodigoLinea = int.Parse(fila["CodigoLineaAbonado"].ToString()),
                        NroLinea = fila["NroLineaAbonado"].ToString(),
                        Ciudad = ciudadAbonado,
                        TipoServicio = TipoServAbonado,
                        PrefijoLinea = fila["PrefijoLineaAbonado"].ToString()
                    };
                    TipoDocumentoBE tipoDoc = new TipoDocumentoBE
                    {
                        CodigoTipoDocumento = int.Parse(fila["CodigoTipoDocumento"].ToString()),
                        DescripcionTipoDocumento = fila["DescripcionTipoDocumento"].ToString()
                    };

                    PersonaBE persona = new PersonaBE()
                    {
                        CodigoPersona = int.Parse(fila["CodigoPersona"].ToString()),
                        Apellido = fila["Apellido"].ToString(),
                        Nombre = fila["Nombre"].ToString(),
                        TipoDocumento = tipoDoc,
                        NroDocumento = fila["NroDocumento"].ToString(),
                    };
                    AbonadoBE abonado = new AbonadoBE
                    {
                        NroAbonado = int.Parse(fila["NroAbonado"].ToString()),
                        Persona = persona,
                        Linea = lineaAbonado
                    };

                    DateTime? fecha = default(DateTime?);
                    if (!string.IsNullOrWhiteSpace(fila["FechaLlamada"].ToString()))
                    {
                        fecha = (DateTime)fila["FechaLlamada"];
                    }
                    LlamadaBE llamada = new LlamadaBE
                    {
                        Abonado = abonado,
                        Linea = linea,
                        FechaLlamada = fecha,
                        MinutosDuracion = short.Parse(fila["MinutosDuracion"].ToString()),
                    };

                    listaLlamadas.Add(llamada);
                }
            }
            return listaLlamadas;
        }

        public List<LlamadaBE> ListarPorAbonado(AbonadoBE abo, DateTime? fDesde, DateTime? fHasta)
        {
            List<LlamadaBE> listaLlamadas = new List<LlamadaBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(AccesoSQL.CrearParametroInt("NroAbonado", abo.NroAbonado));
            if (fDesde.HasValue) { parametros.Add(AccesoSQL.CrearParametroDate("fDesde", fDesde)); }
            else { parametros.Add(AccesoSQL.CrearParametroDate("fDesde", null)); }
            if (fHasta.HasValue) { parametros.Add(AccesoSQL.CrearParametroDate("fHasta", fHasta)); }
            else { parametros.Add(AccesoSQL.CrearParametroDate("fHasta", null)); }
            DataTable tabla = AccesoSQL.Leer("pr_Listar_LlamadasPorAbonado", parametros);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    //Parte destino
                    TipoServicioBE TipoServ = new TipoServicioBE
                    {
                        CodigoTipoServicio = int.Parse(fila["CodigoTipoServicio"].ToString()),
                        DescripcionTipoServicio = fila["DescripcionTipoServicio"].ToString()
                    };

                    PaisBE pais = new PaisBE
                    {
                        CodigoPais = int.Parse(fila["CodigoPais"].ToString()),
                        PaisDescripcion = fila["DescripcionPais"].ToString()
                    };

                    CiudadBE ciudad = new CiudadBE
                    {
                        CodigoCiudad = int.Parse(fila["CodigoCiudad"].ToString()),
                        CiudadDescripcion = fila["DescripcionCiudad"].ToString(),
                        Pais = pais
                    };

                    LineaBE linea = new LineaBE
                    {
                        CodigoLinea = int.Parse(fila["CodigoLinea"].ToString()),
                        NroLinea = fila["NroLinea"].ToString(),
                        Ciudad = ciudad,
                        TipoServicio = TipoServ,
                        PrefijoLinea = fila["PrefijoLinea"].ToString()
                    };

                    //Parte abonado
                    TipoServicioBE TipoServAbonado = new TipoServicioBE
                    {
                        CodigoTipoServicio = int.Parse(fila["CodigoTipoServicioAbonado"].ToString()),
                        DescripcionTipoServicio = fila["DescripcionTipoServicioAbonado"].ToString()
                    };

                    PaisBE paisAbonado = new PaisBE
                    {
                        CodigoPais = int.Parse(fila["CodigoPaisAbonado"].ToString()),
                        PaisDescripcion = fila["DescripcionPaisAbonado"].ToString()
                    };

                    CiudadBE ciudadAbonado = new CiudadBE
                    {
                        CodigoCiudad = int.Parse(fila["CodigoCiudadAbonado"].ToString()),
                        CiudadDescripcion = fila["DescripcionCiudadAbonado"].ToString(),
                        Pais = paisAbonado
                    };

                    LineaBE lineaAbonado = new LineaBE
                    {
                        CodigoLinea = int.Parse(fila["CodigoLineaAbonado"].ToString()),
                        NroLinea = fila["NroLineaAbonado"].ToString(),
                        Ciudad = ciudadAbonado,
                        TipoServicio = TipoServAbonado,
                        PrefijoLinea = fila["PrefijoLineaAbonado"].ToString()
                    };
                    TipoDocumentoBE tipoDoc = new TipoDocumentoBE
                    {
                        CodigoTipoDocumento = int.Parse(fila["CodigoTipoDocumento"].ToString()),
                        DescripcionTipoDocumento = fila["DescripcionTipoDocumento"].ToString()
                    };

                    PersonaBE persona = new PersonaBE()
                    {
                        CodigoPersona = int.Parse(fila["CodigoPersona"].ToString()),
                        Apellido = fila["Apellido"].ToString(),
                        Nombre = fila["Nombre"].ToString(),
                        TipoDocumento = tipoDoc,
                        NroDocumento = fila["NroDocumento"].ToString(),
                    };
                    AbonadoBE abonado = new AbonadoBE
                    {
                        NroAbonado = int.Parse(fila["NroAbonado"].ToString()),
                        Persona = persona,
                        Linea = lineaAbonado
                    };

                    DateTime? fecha = default(DateTime?);
                    if (!string.IsNullOrWhiteSpace(fila["FechaLlamada"].ToString()))
                    {
                        fecha = (DateTime)fila["FechaLlamada"];
                    }
                    LlamadaBE llamada = new LlamadaBE
                    {
                        Abonado = abonado,
                        Linea = linea,
                        FechaLlamada = fecha,
                        MinutosDuracion = short.Parse(fila["MinutosDuracion"].ToString()),
                    };

                    listaLlamadas.Add(llamada);
                }
            }
            return listaLlamadas;
        }
    }
}
