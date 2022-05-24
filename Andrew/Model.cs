using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Andrew
{
    public class Fasad
    {
        public Client_list client_List;
        public House_list house_List;
        public Arenda_list arenda_List;


        public Fasad()
        {
            this.client_List = Client_list.get_instanse();
            this.house_List = House_list.get_instanse();
            this.arenda_List = Arenda_list.get_instanse();
        }

        public void create_client_list(Object[] obj)
        {
            client_List.add_el(new client(Convert.ToInt32(obj[0]), obj[1].ToString(), obj[2].ToString(), obj[3].ToString(), obj[4].ToString(), obj[5].ToString()));
        }
        public void update_client_list(Object[] obj)
        {
            client_List.add_el(new client(Convert.ToInt32(obj[0]), obj[1].ToString(), obj[2].ToString(), obj[3].ToString(), obj[4].ToString(), obj[5].ToString()));
        }

        public void create_house_list(Object[] obj)
        {
            house_List.add_el(new house(Convert.ToInt32(obj[0]), Convert.ToInt32(obj[1]), Convert.ToInt32(obj[2]), Convert.ToInt32(obj[3]), obj[4].ToString()));
        }
        public void update_house_list(Object[] obj)
        {
            house_List.add_el(new house(Convert.ToInt32(obj[0]), Convert.ToInt32(obj[1]), Convert.ToInt32(obj[2]), Convert.ToInt32(obj[3]), obj[4].ToString()));
        }

        public void create_arenda_list(Object[] obj)
        {
            arenda_List.add_el(new arenda_(Convert.ToInt32(obj[0]), obj[1].ToString(), obj[2].ToString(), Convert.ToInt32(obj[3]), Convert.ToInt32(obj[4]), Convert.ToInt32(obj[5])));
        }
        public void update_arenda_list(Object[] obj)
        {
            arenda_List.add_el(new arenda_(Convert.ToInt32(obj[0]), obj[1].ToString(), obj[2].ToString(), Convert.ToInt32(obj[3]), Convert.ToInt32(obj[4]), Convert.ToInt32(obj[5])));
        }

        public class client : Id
        {
            public int id_client { get; set; }
            public string name { get; set; }
            public string first_name { get; set; }
            public string last_name { get; set; }
            public string passport { get; set; }
            public string phone { get; set; }

            public client(int Id_client, string Name, string First_name, string Last_name, string Passport, string Phone)
            {
                id_client = Id_client;
                name = Name;
                first_name = First_name;
                last_name = Last_name;
                passport = Passport;
                phone = Phone;
            }
            public int id()
            {
                return id_client;
            }

            public List<String> mass_s()
            {
                List<String> array = new List<String>();
                array.Add(id_client.ToString());
                array.Add(name);
                array.Add(first_name);
                array.Add(last_name);
                array.Add(passport);
                array.Add(phone);
                return array;
            }
        }

        public class house : Id
        {
            public int id_house { get; set; }
            public int count_comnat { get; set; }
            public int ploshad { get; set; }
            public int count_pers { get; set; }
            public string class_ { get; set; }

            public house(int Id_house, int Count_comnat, int Ploshad, int Count_pers, string Class_)
            {
                id_house = Id_house;
                count_comnat = Count_comnat;
                ploshad = Ploshad;
                count_pers = Count_pers;
                class_ = Class_;
            }
            public int id()
            {
                return id_house;
            }

            public List<String> mass_s()
            {
                List<String> array = new List<String>();
                array.Add(id_house.ToString());
                array.Add(count_comnat.ToString());
                array.Add(ploshad.ToString());
                array.Add(count_pers.ToString());
                array.Add(class_);
                return array;
            }
        }

        public class arenda_ : Id
        {
            public int id_arenda { get; set; }
            public string data_start { get; set; }
            public string data_end { get; set; }
            public int price { get; set; }
            public int id_client { get; set; }
            public int id_house { get; set; }

            public arenda_(int Id_arenda, string Data_start, string Data_end, int Price, int Id_client, int Id_house)
            {
                id_arenda = Id_arenda;
                data_start = Data_start;
                data_end = Data_end;
                price = Price;
                id_client = Id_client;
                id_house = Id_house;
            }

            public int id()
            {
                return id_arenda;
            }

            public List<String> mass_s()
            {
                List<String> array = new List<String>();
                array.Add(id_arenda.ToString());
                array.Add(data_start);
                array.Add(data_end);
                array.Add(price.ToString());
                array.Add(id_client.ToString());
                array.Add(id_house.ToString());
                return array;
            }
        }

        interface Id
        {
            int id();
        }

        interface InList<T>
        {
            void add_el(T obj);
            void delete_el(int id);
            void update_el(T obj);
            Object select_el(T obj);
        }

        public class Client_list : InList<client>
        {
            private List<client> client_list;
            private static Client_list one;
            private Client_list()
            {
                client_list = new List<client>();
            }
            public static Client_list get_instanse()
            {
                if (one == null)
                {
                    one = new Client_list();
                }
                return one;
            }
            public void add_el(client client)
            {
                this.client_list.Add(client);
            }
            public void delete_el(int id)
            {
                this.client_list.RemoveAll(client => client.id() == id);
            }
            public void update_el(client id)
            {
                client old_client = this.client_list.Find(client => client.id() == id.id());
                old_client.id_client = id.id_client;
                old_client.name = id.name;
                old_client.first_name = id.first_name;
                old_client.last_name = id.last_name;
                old_client.passport = id.passport;
                old_client.phone = id.phone;
            }
            public Object select_el(client obj)
            {
                return 1;
            }
            public List<List<string>> mass_client()
            {
                List<List<string>> mass = new List<List<string>>();
                foreach (client i in this.client_list)
                {
                    mass.Add(i.mass_s());
                }
                return mass;
            }
            public List<string> get_full_id()
            {
                List<string> ids = new List<string>();
                foreach (client i in client_list)
                {
                    ids.Add(i.id().ToString());

                }
                return ids;
            }

        }

        public class House_list : InList<house>
        {
            private List<house> house_list;
            private static House_list one;
            private House_list()
            {
                house_list = new List<house>();
            }
            public static House_list get_instanse()
            {
                if (one == null)
                {
                    one = new House_list();
                }
                return one;
            }
            public void add_el(house house)
            {
                this.house_list.Add(house);
            }
            public void delete_el(int id)
            {
                this.house_list.RemoveAll(house => house.id() == id);
            }
            public void update_el(house id)
            {
                house old_car = this.house_list.Find(house => house.id() == id.id());
                old_car.id_house = id.id_house;
                old_car.count_comnat = id.count_comnat;
                old_car.ploshad= id.ploshad;
                old_car.count_pers = id.count_pers;
                old_car.class_ = id.class_;
            }
            public Object select_el(house obj)
            {
                return 1;
            }
            public List<List<string>> mass_house()
            {
                List<List<string>> mass = new List<List<string>>();
                foreach (house i in this.house_list)
                {
                    mass.Add(i.mass_s());
                }
                return mass;
            }
            public List<string> get_full_id()
            {
                List<string> ids = new List<string>();
                foreach (house i in house_list)
                {
                    ids.Add(i.id().ToString());

                }
                return ids;
            }

        }

        public class Arenda_list : InList<arenda_>
        {
            private List<arenda_> arenda_list;
            private static Arenda_list one;
            private Arenda_list()
            {
                arenda_list = new List<arenda_>();
            }
            public static Arenda_list get_instanse()
            {
                if (one == null)
                {
                    one = new Arenda_list();
                }
                return one;
            }
            public void add_el(arenda_ arenda)
            {
                this.arenda_list.Add(arenda);
            }
            public void delete_el(int id)
            {
                this.arenda_list.RemoveAll(arenda => arenda.id() == id);
            }
            public void update_el(arenda_ id)
            {
                arenda_ old_car = this.arenda_list.Find(arenda => arenda.id() == id.id());
                old_car.id_arenda = id.id_arenda;
                old_car.data_start = id.data_start;
                old_car.data_end = id.data_end;
                old_car.price = id.price;
                old_car.id_client = id.id_client;
                old_car.id_house = id.id_house;
            }
            public Object select_el(arenda_ obj)
            {
                return 1;
            }
            public List<List<string>> mass_arenda()
            {
                List<List<string>> mass = new List<List<string>>();
                foreach (arenda_ i in this.arenda_list)
                {
                    mass.Add(i.mass_s());
                }
                return mass;
            }
            public List<string> get_full_id()
            {
                List<string> ids = new List<string>();
                foreach (arenda_ i in arenda_list)
                {
                    ids.Add(i.id().ToString());

                }
                return ids;
            }

        }

        public bool valid_(Object[] obj)
        {
            bool c = true;
            if (this.client_List.get_full_id().Contains(obj[4]))
                c = false;
            if (this.house_List.get_full_id().Contains(obj[5]))
                c = false;
            return c;
        }
    }
}
