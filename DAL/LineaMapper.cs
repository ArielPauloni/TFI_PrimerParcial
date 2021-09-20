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
    public class LineaMapper
    {
        public List<LineaBE> Listar()
        {
            List<LineaBE> listaLineas = new List<LineaBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            DataTable tabla = AccesoSQL.Leer("pr_Listar_Lineas", null);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    TipoServicioBE TipoServ = new TipoServicioBE();
                    TipoServ.CodigoTipoServicio = int.Parse(fila["CodigoTipoServicio"].ToString());
                    TipoServ.DescripcionTipoServicio = fila["DescripcionTipoServicio"].ToString();

                    PaisBE pais = new PaisBE();
                    pais.CodigoPais = int.Parse(fila["CodigoPais"].ToString());
                    pais.PaisDescripcion = fila["DescripcionPais"].ToString();

                    CiudadBE ciudad = new CiudadBE();
                    ciudad.CodigoCiudad = int.Parse(fila["CodigoCiudad"].ToString());
                    ciudad.CiudadDescripcion = fila["DescripcionCiudad"].ToString();
                    ciudad.Pais = pais;

                    LineaBE linea = new LineaBE();
                    linea.CodigoLinea = int.Parse(fila["CodigoLinea"].ToString());
                    linea.NroLinea = fila["NroLinea"].ToString();
                    linea.Ciudad = ciudad;
                    linea.TipoServicio = TipoServ;
                    linea.PrefijoLinea = fila["PrefijoLinea"].ToString();

                    listaLineas.Add(linea);
                }
            }
            return listaLineas;
        }

        public int Actualizar(LineaBE linea)
        {
            AccesoSQL AccesoSQL = new AccesoSQL();
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(AccesoSQL.CrearParametroInt("CodigoLinea", linea.CodigoLinea));
            parametros.Add(AccesoSQL.CrearParametroStr("NroLinea", linea.NroLinea));
            parametros.Add(AccesoSQL.CrearParametroInt("TipoServicio", linea.TipoServicio.CodigoTipoServicio));
            parametros.Add(AccesoSQL.CrearParametroInt("Ciudad", linea.Ciudad.CodigoCiudad));
            return AccesoSQL.Escribir("pr_Actualizar_Linea", parametros);
        }

        public int Insertar(LineaBE linea)
        {
            AccesoSQL AccesoSQL = new AccesoSQL();
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(AccesoSQL.CrearParametroStr("NroLinea", linea.NroLinea));
            parametros.Add(AccesoSQL.CrearParametroInt("TipoServicio", linea.TipoServicio.CodigoTipoServicio));
            parametros.Add(AccesoSQL.CrearParametroInt("Ciudad", linea.Ciudad.CodigoCiudad));
            return AccesoSQL.Escribir("pr_Insertar_Linea", parametros);
        }
    }
}
