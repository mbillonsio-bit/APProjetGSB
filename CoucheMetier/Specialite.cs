using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoucheMetier
{
    public class Specialite
    {
        private string id;
        private string libSpecialite;

        public Specialite(string id, string libSpecialite)
        {
            this.id = id;
            this.libSpecialite = libSpecialite;
        }

        public string Id { get => id; set => id = value; }
        public string LibSpecialite { get => libSpecialite; set => libSpecialite = value; }
    }
}
