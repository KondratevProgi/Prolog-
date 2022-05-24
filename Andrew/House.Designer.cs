namespace Andrew
{
    partial class House
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView_house = new System.Windows.Forms.DataGridView();
            this.btn_rep = new System.Windows.Forms.Button();
            this.btn_up = new System.Windows.Forms.Button();
            this.btn_del = new System.Windows.Forms.Button();
            this.button_ins = new System.Windows.Forms.Button();
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.textBox6 = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_house)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView_house
            // 
            this.dataGridView_house.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView_house.Location = new System.Drawing.Point(29, 29);
            this.dataGridView_house.Name = "dataGridView_house";
            this.dataGridView_house.Size = new System.Drawing.Size(347, 293);
            this.dataGridView_house.TabIndex = 0;
            // 
            // btn_rep
            // 
            this.btn_rep.Location = new System.Drawing.Point(673, 404);
            this.btn_rep.Name = "btn_rep";
            this.btn_rep.Size = new System.Drawing.Size(75, 23);
            this.btn_rep.TabIndex = 1;
            this.btn_rep.Text = "Вернуться";
            this.btn_rep.UseVisualStyleBackColor = true;
            this.btn_rep.Click += new System.EventHandler(this.Btn_rep_Click);
            // 
            // btn_up
            // 
            this.btn_up.Location = new System.Drawing.Point(535, 321);
            this.btn_up.Name = "btn_up";
            this.btn_up.Size = new System.Drawing.Size(75, 23);
            this.btn_up.TabIndex = 46;
            this.btn_up.Text = "Обновить";
            this.btn_up.UseVisualStyleBackColor = true;
            this.btn_up.Click += new System.EventHandler(this.Btn_up_Click_1);
            // 
            // btn_del
            // 
            this.btn_del.Location = new System.Drawing.Point(616, 264);
            this.btn_del.Name = "btn_del";
            this.btn_del.Size = new System.Drawing.Size(75, 23);
            this.btn_del.TabIndex = 45;
            this.btn_del.Text = "Удалить";
            this.btn_del.UseVisualStyleBackColor = true;
            this.btn_del.Click += new System.EventHandler(this.Btn_del_Click_1);
            // 
            // button_ins
            // 
            this.button_ins.Location = new System.Drawing.Point(452, 264);
            this.button_ins.Name = "button_ins";
            this.button_ins.Size = new System.Drawing.Size(75, 23);
            this.button_ins.TabIndex = 44;
            this.button_ins.Text = "Добавить";
            this.button_ins.UseVisualStyleBackColor = true;
            this.button_ins.Click += new System.EventHandler(this.Button_ins_Click_1);
            // 
            // textBox5
            // 
            this.textBox5.Location = new System.Drawing.Point(604, 142);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(100, 20);
            this.textBox5.TabIndex = 41;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(637, 116);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(38, 13);
            this.label5.TabIndex = 40;
            this.label5.Text = "Класс";
            // 
            // textBox6
            // 
            this.textBox6.Location = new System.Drawing.Point(604, 68);
            this.textBox6.Name = "textBox6";
            this.textBox6.Size = new System.Drawing.Size(100, 20);
            this.textBox6.TabIndex = 39;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(628, 43);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(53, 13);
            this.label6.TabIndex = 38;
            this.label6.Text = "Персоны";
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(440, 207);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(100, 20);
            this.textBox3.TabIndex = 37;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(473, 181);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(54, 13);
            this.label3.TabIndex = 36;
            this.label3.Text = "Площадь";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(440, 142);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 20);
            this.textBox2.TabIndex = 35;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(473, 116);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(53, 13);
            this.label2.TabIndex = 34;
            this.label2.Text = "Команты";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(440, 68);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 20);
            this.textBox1.TabIndex = 33;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(473, 43);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(16, 13);
            this.label1.TabIndex = 32;
            this.label1.Text = "Id";
            // 
            // House
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btn_up);
            this.Controls.Add(this.btn_del);
            this.Controls.Add(this.button_ins);
            this.Controls.Add(this.textBox5);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.textBox6);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btn_rep);
            this.Controls.Add(this.dataGridView_house);
            this.Name = "House";
            this.Text = "House";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_house)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView_house;
        private System.Windows.Forms.Button btn_rep;
        private System.Windows.Forms.Button btn_up;
        private System.Windows.Forms.Button btn_del;
        private System.Windows.Forms.Button button_ins;
        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox textBox6;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label1;
    }
}