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
using System.Text.RegularExpressions;

namespace Andrew
{
    public partial class Client : Form
    {
        Fasad fasad;
        MySqlConnection con;
        MySqlCommand command;
        public Client(Fasad fas)
        {
            InitializeComponent();

            this.fasad = fas;
            this.con = new MySqlConnection("server=127.0.0.1;username=root;password=root;database=arendah");
            podkl();

        }

        void podkl()
        {
            init_vue();
            data_resause();
        }

        void init_vue()
        {
            this.dataGridView_client.Columns.Add("id_client", "id_client");
            this.dataGridView_client.Columns.Add("name", "name");
            this.dataGridView_client.Columns.Add("first_name", "first_name");
            this.dataGridView_client.Columns.Add("last_name", "last_name");
            this.dataGridView_client.Columns.Add("passport", "passport");
            this.dataGridView_client.Columns.Add("phone", "phone");
        }
        void data_resause()
        {
            this.dataGridView_client.Rows.Clear();
            List<List<string>> mass_client = this.fasad.client_List.mass_client();
            foreach (List<string> i in mass_client)
            {
                dataGridView_client.Rows.Add(i[0], i[1], i[2], i[3], i[4], i[5]);
            }

        }

        private void DataGridView_client_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Button_back_Click(object sender, EventArgs e)
        {
            Form1 dr = new Form1(this.fasad);
            dr.Show();
            Hide();
        }
/*
        private void Button_ins_Click(object sender, EventArgs e)
        {
            int id_client = Convert.ToInt32(textBox1.Text);
            string name = textBox2.Text;
            string first_name = textBox3.Text;
            string last_name = textBox6.Text;
            string passport = textBox5.Text;
            string phone = textBox4.Text;
            if (el_is_valid(name, first_name, last_name, phone) && (!fasad.client_List.get_full_id().Contains(id_client.ToString())))
            {
                Object[] mass = { id_client, name, first_name, last_name, passport, phone };
                fasad.create_client_list(mass);
                string insert_query = string.Format("INSERT INTO client(id_client,name,first_name,last_name,stag,phone) VALUES (" + id_client + ",\"" + name + "\",\"" + first_name + "\",\"" + last_name + "\",\"" + passport + "\",\"" + phone + "\")");
                executeMyQuery(insert_query);

            }
            data_resause();

        }
*/
        private bool el_is_valid(string name, string first_name, string last_name, string number)
        {
            bool c = true;
            string regex = @"[0-9]{11}";
            if (!Regex.IsMatch(number, regex))
            {
                c = false;
            }
            if (name == "" || first_name == "" || last_name == "")
            {
                c = false;
            }
            return c;

        }
/*
        private void Btn_del_Click(object sender, EventArgs e)
        {
            fasad.client_List.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `client` WHERE `id_client`={0}", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }

        private void Btn_up_Click(object sender, EventArgs e)
        {
            int id_client = Convert.ToInt32(textBox1.Text);
            string name = textBox2.Text;
            string first_name = textBox3.Text;
            string last_name = textBox6.Text;
            int passport = Convert.ToInt32(textBox5.Text);
            string phone = textBox4.Text;
            if (el_is_valid(name, first_name, last_name, phone) && (fasad.client_List.get_full_id().Contains(id_client.ToString())))
            {
                Object[] mass = { id_client, name, first_name, last_name, passport, phone };
                fasad.update_client_list(mass);
                string insert_query = string.Format("UPDATE client SET `id_client`={0},`name`='{1}',`first_name`='{2}',`last_name`='{3}',`stag`='{4}',`phone`='{5}' WHERE `id_client`={0}", id_client.ToString(), name, first_name, last_name, passport, phone);
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

        private void Button_ins_Click_1(object sender, EventArgs e)
        {
            int id_client = Convert.ToInt32(textBox1.Text);
            string name = textBox2.Text;
            string first_name = textBox3.Text;
            string last_name = textBox6.Text;
            string passport = textBox5.Text;
            string phone = textBox4.Text;
            if (el_is_valid(name, first_name, last_name, phone) && (!fasad.client_List.get_full_id().Contains(id_client.ToString())))
            {
                Object[] mass = { id_client, name, first_name, last_name, passport, phone };
                fasad.create_client_list(mass);
                string insert_query = string.Format("INSERT INTO client(id_client,name,first_name,last_name,stag,phone) VALUES (" + id_client + ",\"" + name + "\",\"" + first_name + "\",\"" + last_name + "\",\"" + passport + "\",\"" + phone + "\")");
                executeMyQuery(insert_query);

            }
            data_resause();
        }

        private void Btn_del_Click_1(object sender, EventArgs e)
        {
            fasad.client_List.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `client` WHERE `id_client`={0}", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }

        private void Btn_up_Click_1(object sender, EventArgs e)
        {
            int id_client = Convert.ToInt32(textBox1.Text);
            string name = textBox2.Text;
            string first_name = textBox3.Text;
            string last_name = textBox6.Text;
            int passport = Convert.ToInt32(textBox5.Text);
            string phone = textBox4.Text;
            if (el_is_valid(name, first_name, last_name, phone) && (fasad.client_List.get_full_id().Contains(id_client.ToString())))
            {
                Object[] mass = { id_client, name, first_name, last_name, passport, phone };
                fasad.update_client_list(mass);
                string insert_query = string.Format("UPDATE client SET `id_client`={0},`name`='{1}',`first_name`='{2}',`last_name`='{3}',`passport`='{4}',`phone`='{5}' WHERE `id_client`={0}", id_client.ToString(), name, first_name, last_name, passport, phone);
                executeMyQuery(insert_query);

            }
            data_resause();
        }
    }
}
