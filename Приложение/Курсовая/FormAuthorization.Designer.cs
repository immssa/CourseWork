﻿namespace Курсовая
{
    partial class FormAuthorization
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
            textBox1 = new TextBox();
            textBox2 = new TextBox();
            label1 = new Label();
            label2 = new Label();
            button1 = new Button();
            label3 = new Label();
            label4 = new Label();
            textBox3 = new TextBox();
            SuspendLayout();
            // 
            // textBox1
            // 
            textBox1.Location = new Point(55, 48);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(157, 23);
            textBox1.TabIndex = 0;
            // 
            // textBox2
            // 
            textBox2.Location = new Point(55, 98);
            textBox2.Name = "textBox2";
            textBox2.Size = new Size(157, 23);
            textBox2.TabIndex = 1;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 12F);
            label1.Location = new Point(55, 24);
            label1.Name = "label1";
            label1.Size = new Size(57, 21);
            label1.TabIndex = 2;
            label1.Text = "Логин:";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI", 12F);
            label2.Location = new Point(55, 74);
            label2.Name = "label2";
            label2.Size = new Size(66, 21);
            label2.TabIndex = 3;
            label2.Text = "Пароль:";
            // 
            // button1
            // 
            button1.Location = new Point(55, 141);
            button1.Name = "button1";
            button1.Size = new Size(157, 23);
            button1.TabIndex = 4;
            button1.Text = "Войти";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Font = new Font("Segoe UI", 12F);
            label3.Location = new Point(55, 167);
            label3.Name = "label3";
            label3.Size = new Size(122, 21);
            label3.TabIndex = 5;
            label3.Text = "Войти как гость";
            label3.Click += label3_Click;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Font = new Font("Segoe UI", 12F);
            label4.Location = new Point(55, 188);
            label4.Name = "label4";
            label4.Size = new Size(155, 21);
            label4.TabIndex = 6;
            label4.Text = "Зарегистрироваться";
            label4.Click += label4_Click;
            // 
            // textBox3
            // 
            textBox3.Location = new Point(55, 217);
            textBox3.Name = "textBox3";
            textBox3.Size = new Size(157, 23);
            textBox3.TabIndex = 7;
            textBox3.Visible = false;
            // 
            // FormAuthorization
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(269, 252);
            Controls.Add(textBox3);
            Controls.Add(label4);
            Controls.Add(label3);
            Controls.Add(button1);
            Controls.Add(label2);
            Controls.Add(label1);
            Controls.Add(textBox2);
            Controls.Add(textBox1);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            Name = "FormAuthorization";
            Text = "Авторизация";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox textBox1;
        private TextBox textBox2;
        private Label label1;
        private Label label2;
        private Button button1;
        private Label label3;
        private Label label4;
        private TextBox textBox3;
    }
}