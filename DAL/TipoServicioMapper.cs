using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class TipoServicioMapper
    {
        public List<TipoServicioBE> ListarTipoSerivicios()
        {
            List<TipoServicioBE> listaTipoDocumentos = new List<TipoServicioBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            DataTable tabla = AccesoSQL.Leer("pr_Listar_TipoServicio", null);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    TipoServicioBE tipoServicio = new TipoServicioBE();
                    tipoServicio.CodigoTipoServicio = int.Parse(fila["CodigoTipoServicio"].ToString());
                    tipoServicio.DescripcionTipoServicio = fila["DescripcionTipoServicio"].ToString();
                    listaTipoDocumentos.Add(tipoServicio);
                }
            }
            return listaTipoDocumentos;
        }
    }
}
