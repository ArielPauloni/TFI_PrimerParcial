using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;

namespace BLL
{
    public class PersonaBLL
    {
        public int Insertar(PersonaBE persona)
        {
            PersonaMapper m = new PersonaMapper();
            return m.Insertar(persona);
        }

        public List<PersonaBE> Listar()
        {
            PersonaMapper m = new PersonaMapper();
            return m.Listar();
        }
    }
}
