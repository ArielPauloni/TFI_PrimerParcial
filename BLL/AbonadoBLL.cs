using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;

namespace BLL
{
    public class AbonadoBLL
    {
        public int Insertar(AbonadoBE abonado)
        {
            AbonadoMapper m = new AbonadoMapper();
            return m.Insertar(abonado);
        }

        public List<AbonadoBE> Listar()
        {
            AbonadoMapper m = new AbonadoMapper();
            return m.Listar();
        }

        public AbonadoBE ObtenerAbonado(AbonadoBE abonado)
        {
            AbonadoMapper m = new AbonadoMapper();
            return m.Obtener(abonado);
        }
    }
}
