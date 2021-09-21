using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;

namespace BLL
{
    public class LlamadaBLL
    {
        public int Insertar(LlamadaBE llamada)
        {
            LlamadaMapper m = new LlamadaMapper();
            return m.Insertar(llamada);
        }

        public List<LlamadaBE> Listar()
        {
            LlamadaMapper m = new LlamadaMapper();
            return m.Listar();
        }

        public List<LlamadaBE> ListarPorAbonadoMasFecha(AbonadoBE abonado, DateTime? fDesde, DateTime? fHasta)
        {
            LlamadaMapper m = new LlamadaMapper();
            return m.ListarPorAbonado(abonado, fDesde, fHasta);
        }
    }
}
