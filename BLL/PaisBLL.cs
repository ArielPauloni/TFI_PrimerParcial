using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BE;

namespace BLL
{
    public class PaisBLL
    {
        public List<PaisBE> Listar()
        {
            PaisMapper m = new PaisMapper();
            return m.ListarPaises();
        }
    }
}
