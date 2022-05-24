using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Andrew
{
    public partial class House : Form
    {
        Fasad fasad;
        MySqlConnection con;
        MySqlCommand command;
        public House(Fasad fas)
        {
            InitializeComponent();

            this.fasad = fas;
            this.con = new MySqlConnection("server=127.0.0.1;username=root;password=root;database=arendah");
            podkl();
        }

        void init_vue()
        {
            this.dataGridView_house.Columns.Add("id_house", "id_cрщгыу");
            this.dataGridView_house.Columns.Add("count_comnat", "count_comnat");
            this.dataGridView_house.Columns.Add("ploshad", "ploshad");
            this.dataGridView_house.Columns.Add("count_pers", "count_pers");
            this.dataGridView_house.Columns.Add("class", "class");
        }
        void podkl()
        {
            init_vue();
            data_resause();
        }

        void data_resause()
        {
            this.dataGridView_house.Rows.Clear();
            List<List<string>> mass_house = this.fasad.house_List.mass_house();
            foreach (List<string> i in mass_house)
            {
                dataGridView_house.Rows.Add(i[0], i[1], i[2], i[3], i[4]);
            }

        }

        private void DataGridView_client_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }


        /*
        private void Button_ins_Click(object sender, EventArgs e)
        {
            int id_house = Convert.ToInt32(textBox1.Text);
            int count_comnat = Convert.ToInt32(textBox2.Text);
            int ploshad = Convert.ToInt32(textBox3.Text);
            int count_pers = Convert.ToInt32(textBox6.Text);
            string class_ = textBox5.Text;
            if (el_is_valid(class_) && (!fasad.house_List.get_full_id().Contains(id_house.ToString())))
            {
                Object[] mass = { id_house, count_comnat, ploshad, count_pers, class_ };
                fasad.create_house_list(mass);
                string insert_query = string.Format("INSERT INTO house(id_house,count_comnat,ploshad,count_pers,class) VALUES (" + id_house + ",\"" + count_comnat + "\",\"" + ploshad + "\",\"" + count_pers + "\",\"" + class_ + "\")");
                executeMyQuery(insert_query);

            }
            data_resause();
        }
        */

        private bool el_is_valid(string class_)
        {
            bool c = true;
            if (class_ == "")
            {
                c = false;
            }
            return c;
        }
        /*
        private void Btn_del_Click(object sender, EventArgs e)
        {
            fasad.house_List.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `house` WHERE `id_house`={0}", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }
        */
        private void Car_Load(object sender, EventArgs e)
        {

        }
/*
        private void Btn_up_Click(object sender, EventArgs e)
        {
            int id_house = Convert.ToInt32(textBox1.Text);
            int count_comnat = Convert.ToInt32(textBox2.Text);
            int ploshad = Convert.ToInt32(textBox3.Text);
            int count_pers = Convert.ToInt32(textBox6.Text);
            string class_ = textBox5.Text;
            if (el_is_valid(class_) && (fasad.house_List.get_full_id().Contains(id_house.ToString())))
            {
                Object[] mass = { id_house, count_comnat, ploshad, count_pers, class_ };
                fasad.update_house_list(mass);
                string insert_query = string.Format("UPDATE car SET `id_car`={0},`brend`='{1}',`marka`='{2}',`brobeg`='{3}',`class`='{4}' WHERE `id_client`={0}", id_house.ToString(), count_comnat, ploshad, count_pers, class_);
                executeMyQuery(insert_query);

            }
            data_resause();
        }
*/
        public void executeMyQuery(string query)
        {
            try
            {
                openConnection();
                command = new MySqlCommand(query, con);
                if (command.ExecuteNonQuery() == 1)
                {
                    MessageBox.Show("Выполннено");

                }
                else
                {
                    MessageBox.Show("Не выполненно");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                closeConnection();
            }
        }
        public void openConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        public void closeConnection()
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }


        private void Btn_rep_Click(object sender, EventArgs e)
        {
            Form1 dr = new Form1(this.fasad);
            dr.Show();
            Hide();
        }

        private void Button_ins_Click_1(object sender, EventArgs e)
        {
            int id_house = Convert.ToInt32(textBox1.Text);
            int count_comnat = Convert.ToInt32(textBox2.Text);
            int ploshad = Convert.ToInt32(textBox3.Text);
            int count_pers = Convert.ToInt32(textBox6.Text);
            string class_ = textBox5.Text;
            if (el_is_valid(class_) && (!fasad.house_List.get_full_id().Contains(id_house.ToString())))
            {
                Object[] mass = { id_house, count_comnat, ploshad, count_pers, class_ };
                fasad.create_house_list(mass);
                string insert_query = string.Format("INSERT INTO house(id_house,count_comnat,ploshad,count_pers,class) VALUES (" + id_house + ",\"" + count_comnat + "\",\"" + ploshad + "\",\"" + count_pers + "\",\"" + class_ + "\")");
                executeMyQuery(insert_query);

            }
            data_resause();
        }

        private void Btn_up_Click_1(object sender, EventArgs e)
        {
            int id_house = Convert.ToInt32(textBox1.Text);
            int count_comnat = Convert.ToInt32(textBox2.Text);
            int ploshad = Convert.ToInt32(textBox3.Text);
            int count_pers = Convert.ToInt32(textBox6.Text);
            string class_ = textBox5.Text;
            if (el_is_valid(class_) && (fasad.house_List.get_full_id().Contains(id_house.ToString())))
            {
                Object[] mass = { id_house, count_comnat, ploshad, count_pers, class_ };
                fasad.update_house_list(mass);
                string insert_query = string.Format("UPDATE car SET `id_car`={0},`brend`='{1}',`marka`='{2}',`brobeg`='{3}',`class`='{4}' WHERE `id_client`={0}", id_house.ToString(), count_comnat, ploshad, count_pers, class_);
                executeMyQuery(insert_query);

            }
            data_resause();
        }

        private void Btn_del_Click_1(object sender, EventArgs e)
        {
            fasad.house_List.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `house` WHERE `id_house`={0}", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }
    }
}
