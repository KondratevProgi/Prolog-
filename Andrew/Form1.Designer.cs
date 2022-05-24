namespace Andrew
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.button_cl = new System.Windows.Forms.Button();
            this.btn_house = new System.Windows.Forms.Button();
            this.button_arenda = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(306, 113);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(142, 31);
            this.label1.TabIndex = 0;
            this.label1.Text = "Выбор БД";
            // 
            // button_cl
            // 
            this.button_cl.Location = new System.Drawing.Point(111, 237);
            this.button_cl.Name = "button_cl";
            this.button_cl.Size = new System.Drawing.Size(75, 23);
            this.button_cl.TabIndex = 1;
            this.button_cl.Text = "Client";
            this.button_cl.UseVisualStyleBackColor = true;
            this.button_cl.Click += new System.EventHandler(this.Button_cl_Click);
            // 
            // btn_house
            // 
            this.btn_house.Location = new System.Drawing.Point(338, 237);
            this.btn_house.Name = "btn_house";
            this.btn_house.Size = new System.Drawing.Size(75, 23);
            this.btn_house.TabIndex = 2;
            this.btn_house.Text = "House";
            this.btn_house.UseVisualStyleBackColor = true;
            this.btn_house.Click += new System.EventHandler(this.Btn_house_Click);
            // 
            // button_arenda
            // 
            this.button_arenda.Location = new System.Drawing.Point(608, 236);
            this.button_arenda.Name = "button_arenda";
            this.button_arenda.Size = new System.Drawing.Size(75, 23);
            this.button_arenda.TabIndex = 3;
            this.button_arenda.Text = "Arenda";
            this.button_arenda.UseVisualStyleBackColor = true;
            this.button_arenda.Click += new System.EventHandler(this.Button_arenda_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button_arenda);
            this.Controls.Add(this.btn_house);
            this.Controls.Add(this.button_cl);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button_cl;
        private System.Windows.Forms.Button btn_house;
        private System.Windows.Forms.Button button_arenda;
    }
}

