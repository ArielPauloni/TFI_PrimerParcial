using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BE;

namespace BLL
{
    public class TipoServicioBLL
    {
        public List<TipoServicioBE> Listar()
        {
            TipoServicioMapper m = new TipoServicioMapper();
            return m.ListarTipoSerivicios();
        }
    }
}
