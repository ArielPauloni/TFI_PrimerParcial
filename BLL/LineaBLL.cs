using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;

namespace BLL
{
    public class LineaBLL
    {
        public int Insertar(LineaBE linea)
        {
            LineaMapper m = new LineaMapper();
            return m.Insertar(linea);
        }

        public List<LineaBE> Listar()
        {
            LineaMapper m = new LineaMapper();
            return m.Listar();
        }

        public List<LineaBE> ListarSinTitular()
        {
            LineaMapper m = new LineaMapper();
            return m.ListarSinTitular();
        }

        public int ActualizarLinea(LineaBE linea)
        {
            LineaMapper m = new LineaMapper();
            return m.Actualizar(linea);
        }
    }
}
