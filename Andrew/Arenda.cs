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
    public partial class Arenda : Form
    {
        Fasad fasad;
        MySqlConnection con;
        MySqlCommand command;
        public Arenda(Fasad fas)
        {
            InitializeComponent();

            this.fasad = fas;
            this.con = new MySqlConnection("server=127.0.0.1;username=root;password=root;database=arendah");
            podkl();
        }

        void init_vue()
        {
            this.dataGridView_arenda.Columns.Add("id_arenda", "id_arenda");
            this.dataGridView_arenda.Columns.Add("data_start", "data_start");
            this.dataGridView_arenda.Columns.Add("data_end", "data_end");
            this.dataGridView_arenda.Columns.Add("price", "price");
            this.dataGridView_arenda.Columns.Add("id_client", "id_client");
            this.dataGridView_arenda.Columns.Add("id_house", "id_house");
        }
        void podkl()
        {
            init_vue();
            data_resause();
        }

        void data_resause()
        {
            this.dataGridView_arenda.Rows.Clear();
            List<List<string>> mass_arenda = this.fasad.arenda_List.mass_arenda();
            foreach (List<string> i in mass_arenda)
            {
                dataGridView_arenda.Rows.Add(i[0], i[1], i[2], i[3], i[4], i[5]);
            }

        }

        private void DataGridView_client_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }



        private void Button_becccc_Click(object sender, EventArgs e)
        {
            Form1 dr = new Form1(this.fasad);
            dr.Show();
            Hide();
        }
/*
        private void Button_ins_Click(object sender, EventArgs e)
        {
            int id_arenda = Convert.ToInt32(textBox1.Text);
            string data_start = textBox2.Text;
            string data_end = textBox3.Text;
            int price = Convert.ToInt32(textBox6.Text);
            int id_client = Convert.ToInt32(textBox5.Text);
            int id_house = Convert.ToInt32(textBox4.Text);
            Object[] mass = { id_arenda, data_start, data_end, price, id_client, id_house };
            if (el_is_valid(data_start, data_end) && (!fasad.arenda_List.get_full_id().Contains(id_arenda.ToString())) && (fasad.valid_(mass)))
            {
                fasad.create_arenda_list(mass);
                string insert_query = string.Format("INSERT INTO arenda(id_arenda, data_start, data_end, price, id_client, id_house) VALUES (" + id_arenda + ",\"" + data_start + "\",\"" + data_end + "\",\"" + price + "\",\"" + id_client + "\",\"" + id_house + "\")");
                executeMyQuery(insert_query);

            }
            data_resause();
        }

        private void Btn_up_Click(object sender, EventArgs e)
        {
            int id_arenda = Convert.ToInt32(textBox1.Text);
            string data_start = textBox2.Text;
            string data_end = textBox3.Text;
            int price = Convert.ToInt32(textBox6.Text);
            int id_client = Convert.ToInt32(textBox5.Text);
            int id_house = Convert.ToInt32(textBox4.Text);
            Object[] mass = { id_arenda, data_start, data_end, price, id_client, id_house };
            if (el_is_valid(data_start, data_end) && (fasad.arenda_List.get_full_id().Contains(id_arenda.ToString())) && (fasad.valid_(mass)))
            {
                fasad.update_arenda_list(mass);
                string insert_query = string.Format("UPDATE arenda SET `id_arenda`={0},`data_start`='{1}',`data_end`='{2}',`price`='{3}',`id_client`='{4}' ,`id_house`='{5}' WHERE `id_arenda`={0}", id_arenda.ToString(), data_start, data_end, price, id_client, id_house);
                executeMyQuery(insert_query);
            }
            data_resause();
        }

        private void Btn_del_Click(object sender, EventArgs e)
        {
            fasad.arenda_List.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `arenda` WHERE `id_arenda`={0}", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }
*/

        private bool el_is_valid(string date_start, string data_end)
        {
            string regex = @"(([2]{1}0[0-9]{2})-(0[1-9]{1}|1[0-2]{1})-(0[1-9]{1}|[1-2]{1}[0-9]{1}|3[0-1]{1}))";
            bool c = true;
            if (!Regex.IsMatch(date_start, regex))
            {
                c = false;
            }
            if (!Regex.IsMatch(data_end, regex) && data_end != "3000-01-01")
            {
                c = false;
            }
            return c;

        }

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

        private void Becccc_Click(object sender, EventArgs e)
        {
            Form1 dr = new Form1(this.fasad);
            dr.Show();
            Hide();
        }

        private void Button_ins_Click_1(object sender, EventArgs e)
        {
            int id_arenda = Convert.ToInt32(textBox1.Text);
            string data_start = textBox2.Text;
            string data_end = textBox3.Text;
            int price = Convert.ToInt32(textBox6.Text);
            int id_client = Convert.ToInt32(textBox5.Text);
            int id_house = Convert.ToInt32(textBox4.Text);
            Object[] mass = { id_arenda, data_start, data_end, price, id_client, id_house };
            if (el_is_valid(data_start, data_end) && (!fasad.arenda_List.get_full_id().Contains(id_arenda.ToString())) && (fasad.valid_(mass)))
            {
                fasad.create_arenda_list(mass);
                string insert_query = string.Format("INSERT INTO arenda(id_arenda, data_start, data_end, price, id_client, id_house) VALUES (" + id_arenda + ",\"" + data_start + "\",\"" + data_end + "\",\"" + price + "\",\"" + id_client + "\",\"" + id_house + "\")");
                executeMyQuery(insert_query);

            }
            data_resause();
        }

        private void Btn_up_Click_1(object sender, EventArgs e)
        {
            int id_arenda = Convert.ToInt32(textBox1.Text);
            string data_start = textBox2.Text;
            string data_end = textBox3.Text;
            int price = Convert.ToInt32(textBox6.Text);
            int id_client = Convert.ToInt32(textBox5.Text);
            int id_house = Convert.ToInt32(textBox4.Text);
            Object[] mass = { id_arenda, data_start, data_end, price, id_client, id_house };
            if (el_is_valid(data_start, data_end) && (fasad.arenda_List.get_full_id().Contains(id_arenda.ToString())) && (fasad.valid_(mass)))
            {
                fasad.update_arenda_list(mass);
                string insert_query = string.Format("UPDATE arenda SET `id_arenda`={0},`data_start`='{1}',`data_end`='{2}',`price`='{3}',`id_client`='{4}' ,`id_house`='{5}' WHERE `id_arenda`={0}", id_arenda.ToString(), data_start, data_end, price, id_client, id_house);
                executeMyQuery(insert_query);
            }
            data_resause();
        }

        private void Btn_del_Click_1(object sender, EventArgs e)
        {
            fasad.arenda_List.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `arenda` WHERE `id_arenda`={0}", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }
    }
}
