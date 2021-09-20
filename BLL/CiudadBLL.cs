using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BE;

namespace BLL
{
    public class CiudadBLL
    {
        public List<CiudadBE> ListarCiudadesPorPais(PaisBE pais)
        {
            CiudadMapper m = new CiudadMapper();
            return m.ListarCiudades(pais);
        }
    }
}
