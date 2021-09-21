using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;

namespace BLL
{
    public class CostoBLL
    {
        public List<CostoBE> Listar()
        {
            CostoMapper m = new CostoMapper();
            return m.Listar();
        }

        public int Actualizar(CostoBE costo)
        {
            CostoMapper m = new CostoMapper();
            return m.Actualizar(costo);
        }
    }
}
