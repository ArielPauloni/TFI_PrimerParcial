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
    public class CostoMapper
    {
        public List<CostoBE> Listar()
        {
            List<CostoBE> listaCostos = new List<CostoBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            DataTable tabla = AccesoSQL.Leer("pr_Listar_Costos", null);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    TipoServicioBE TipoServOrigen = new TipoServicioBE
                    {
                        CodigoTipoServicio = int.Parse(fila["TipoServicioOrigen"].ToString()),
                        DescripcionTipoServicio = fila["DescripcionServicioOrigen"].ToString()
                    };

                    TipoServicioBE TipoServDestino = new TipoServicioBE
                    {
                        CodigoTipoServicio = int.Parse(fila["TipoServicioDestino"].ToString()),
                        DescripcionTipoServicio = fila["DescripcionServicioDestino"].ToString()
                    };

                    CostoBE costo = new CostoBE
                    {
                        ServicioOrigen = TipoServOrigen,
                        ServicioDestino = TipoServDestino,
                        CodigoCosto = int.Parse(fila["CodigoCosto"].ToString()),
                        MismaEmpresa = (Boolean)(fila["MismaEmpresa"]),
                        EsNacional = (Boolean)(fila["EsNacional"]),
                        IncluyeRoaming = (Boolean)(fila["IncluyeRoaming"]),
                        Costo = double.Parse(fila["Costo"].ToString())
                    };

                    listaCostos.Add(costo);
                }
            }
            return listaCostos;
        }

        public int Actualizar(CostoBE costo)
        {
            AccesoSQL AccesoSQL = new AccesoSQL();
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(AccesoSQL.CrearParametroInt("CodigoCosto", costo.CodigoCosto));
            parametros.Add(AccesoSQL.CrearParametroDecimal("Costo", costo.Costo));
            return AccesoSQL.Escribir("pr_Actualizar_Costo", parametros);
        }
    }
}
