using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Data.SqlClient;
using Microsoft.VisualBasic.ApplicationServices;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Курсовая
{
    public partial class FormAuthorization : Form
    {
        private MainForm _parent;
        public FormAuthorization(MainForm parent)
        {
            InitializeComponent();
            _parent = parent;
        }

        private bool flagAuthorization = true;

        private void label4_Click(object sender, EventArgs e)
        {
            if (flagAuthorization)
            {
                button1.Text = "Зарегистрироваться";
                button1.Location = new Point(55, 177);
                label3.Text = "Полное имя:";
                label3.Location = new Point(55, 124);
                label4.Text = "Назад";
                label4.Location = new Point(55, 203);
                textBox3.Visible = true;
                textBox3.Location = new Point(55, 148);
                flagAuthorization = false;
                textBox1.Text = "";
                textBox2.Text = "";
            }
            else
            {
                button1.Text = "Войти";
                button1.Location = new Point(55, 141);
                label3.Text = "Войти как гость";
                label3.Location = new Point(55, 166);
                label4.Text = "Зарегистрироваться";
                label4.Location = new Point(55, 187);
                textBox3.Visible = false;
                textBox3.Location = new Point(55, 217);
                flagAuthorization = true;
                textBox1.Text = "";
                textBox2.Text = "";
                textBox3.Text = "";
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string login = textBox1.Text;
            string password = textBox2.Text;
            if (password.Replace(" ", "") != password)
            {
                MessageBox.Show("Введите пароль без пробелов!");
                return;
            }

            using (var conn = new SqlConnection(_parent.GenerateConnectionString()))
            {


                if (flagAuthorization)
                {

                    if ((login == "admin") || (password == "admin"))
                    {
                        _parent.role = "Admin";
                        _parent.user_id = 6;
                        this.Close();
                        return;
                    }

                    conn.Open();

                    using (var cmd = new SqlCommand(
                        "SELECT USER_ID, Password FROM dbo.Users WHERE Login = @login", conn))
                    {
                        cmd.Parameters.AddWithValue("@login", login);

                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                int userId = reader.GetInt32(0);
                                string storedPassword = reader.GetString(1).Replace(" ", "");


                                if (password == storedPassword)
                                {
                                    _parent.role = "User";
                                    _parent.user_id = userId;

                                    this.Close();
                                    return;
                                }
                            }
                        }
                    }

                    MessageBox.Show("Неправильный логин или пароль.", "Ошибка авторизации",
                        MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {

                    conn.Open();

                    string fullName = textBox3.Text.Trim();
                    DateTime registeredAt = DateTime.Now;

                    using (var cmd = new SqlCommand(
                        "INSERT INTO dbo.Users (Login, Password, Full_Name, Registered_At) VALUES (@login, @password, @fullName, @registeredAt)", conn))
                    {
                        cmd.Parameters.AddWithValue("@login", login);
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@fullName", fullName);
                        cmd.Parameters.AddWithValue("@registeredAt", registeredAt);
                        try
                        {
                            int rows = cmd.ExecuteNonQuery();

                            if (rows > 0)
                            {
                                MessageBox.Show("Регистрация прошла успешно!", "Успешно",
                                    MessageBoxButtons.OK, MessageBoxIcon.Information);
                                textBox1.Text = "";
                                textBox2.Text = "";
                                textBox3.Text = "";
                            }
                            else
                            {
                                MessageBox.Show("Ошибка регистрации.", "Ошибка",
                                    MessageBoxButtons.OK, MessageBoxIcon.Error);
                            }
                        }
                        catch
                        {
                            MessageBox.Show("Пользователь с таким логином уже существует");
                        }




                    }
                }
            }
        }

        private void label3_Click(object sender, EventArgs e)
        {
            if (flagAuthorization)
            {
                _parent.role = "Guest";
                this.Close();
            }
        }
    }
}
