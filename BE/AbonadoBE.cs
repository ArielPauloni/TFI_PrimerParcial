using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class AbonadoBE
    {
        private int nroAbonado;

        public int NroAbonado
        {
            get { return nroAbonado; }
            set { nroAbonado = value; }
        }

        private PersonaBE persona;

        public PersonaBE Persona
        {
            get { return persona; }
            set { persona = value; }
        }
        
        private DateTime? fechaAlta;

        public DateTime? FechaAlta
        {
            get { return fechaAlta; }
            set { fechaAlta = value; }
        }

        private bool inactivo;

        public bool Inactivo
        {
            get { return inactivo; }
            set { inactivo = value; }
        }

        private LineaBE linea;

        public LineaBE Linea
        {
            get { return linea; }
            set { linea = value; }
        }
    }
}
