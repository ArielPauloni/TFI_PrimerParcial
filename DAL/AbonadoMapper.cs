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
    public class AbonadoMapper
    {
        public int Insertar(AbonadoBE abonado)
        {
            AccesoSQL AccesoSQL = new AccesoSQL();
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(AccesoSQL.CrearParametroInt("CodigoPersona", abonado.Persona.CodigoPersona));
            parametros.Add(AccesoSQL.CrearParametroInt("CodigoLinea", abonado.Linea.CodigoLinea));
            return AccesoSQL.Escribir("pr_Insertar_Abonado", parametros);
        }

        public AbonadoBE Obtener(AbonadoBE abo)
        {
            AccesoSQL AccesoSQL = new AccesoSQL();
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(AccesoSQL.CrearParametroInt("NroAbonado", abo.NroAbonado));
            DataTable tabla = AccesoSQL.Leer("pr_Obtener_Abonado", parametros);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
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
                        Linea = linea
                    };
                    return abonado;
                }
            }
            return null;
        }

        public List<AbonadoBE> Listar()
        {
            List<AbonadoBE> listaAbonados = new List<AbonadoBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            DataTable tabla = AccesoSQL.Leer("pr_Listar_Abonados", null);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
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
                        Linea = linea
                    };

                    listaAbonados.Add(abonado);
                }
            }
            return listaAbonados;
        }
    }
}
