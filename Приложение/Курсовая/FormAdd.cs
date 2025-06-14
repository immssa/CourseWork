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
using static System.Net.Mime.MediaTypeNames;

namespace Курсовая
{
    public partial class FormAdd : Form
    {
        private MainForm _parent;
        private bool isEdit;
        private int knowledgeId;
        public FormAdd(MainForm parent, bool Edit, int id)
        {
            InitializeComponent();
            _parent = parent;
            isEdit = Edit;
            knowledgeId = id;
            _parent.LoadCategories(comboBox1);
            if (isEdit)
            {
                button1.Text = "Исправить";
                LoadKnowledge(comboBox1, textBox1, textBox2);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
                if (comboBox1.Text != "" && textBox1.Text != "" && textBox2.Text != "")
                {
                    if(!isEdit)
                    {
                        const string selectCategorySql = @"SELECT Category_ID FROM dbo.Categories WHERE Category_Name = @CategoryName;";

                        const string insertKnowledgeSql = @"INSERT INTO dbo.Knowledges (Title, Text, User_ID, Category_ID, Created_At, Update_At) VALUES (@Title, @Text, @UserId, @CategoryId, @CreatedAt, @UpdatedAt);";

                        using (var connection = new SqlConnection(_parent.GenerateConnectionString()))
                        using (var selectCmd = new SqlCommand(selectCategorySql, connection))
                        using (var insertCmd = new SqlCommand(insertKnowledgeSql, connection))
                        {
                            selectCmd.Parameters.Add("@CategoryName", System.Data.SqlDbType.NVarChar, 100)
                                     .Value = comboBox1.Text;

                            insertCmd.Parameters.Add("@Title", System.Data.SqlDbType.NVarChar, 200).Value = textBox1.Text;
                            insertCmd.Parameters.Add("@Text", System.Data.SqlDbType.NVarChar, -1).Value = textBox2.Text;
                            insertCmd.Parameters.Add("@UserId", System.Data.SqlDbType.Int).Value = _parent.user_id;
                            insertCmd.Parameters.Add("@CategoryId", System.Data.SqlDbType.Int).Value = 0;
                            insertCmd.Parameters.Add("@CreatedAt", System.Data.SqlDbType.DateTime2).Value = DateTime.Now;
                            insertCmd.Parameters.Add("@UpdatedAt", System.Data.SqlDbType.DateTime2).Value = DateTime.Now;

                            try
                            {
                                connection.Open();
                                object result = selectCmd.ExecuteScalar();
                                if (result == null)
                                {
                                    MessageBox.Show($"Категория «{comboBox1.Text}» не найдена.");
                                    return;
                                }

                                int categoryId = Convert.ToInt32(result);
                                insertCmd.Parameters["@CategoryId"].Value = categoryId;

                                int rows = insertCmd.ExecuteNonQuery();
                                if (rows == 1)
                                {
                                    MessageBox.Show("Запись успешно добавлена в Knowledge.");
                                    this.Close();
                                }
                                else
                                { MessageBox.Show("Не удалось добавить запись в Knowledge."); }
                            }
                            catch (SqlException ex)
                            {
                                Console.Error.WriteLine($"Ошибка при работе с БД: {ex.Message}");
                                throw;
                            }

                        }
                    }
                    else
                    {
                        const string sql = @"
                UPDATE k
                SET 
                    k.Title       = @Title,
                    k.Text        = @Text,
                    k.Category_ID = c.Category_ID,
                    k.Update_At  = @UpdatedAt
                FROM dbo.Knowledges AS k
                INNER JOIN dbo.Categories AS c
                    ON c.Category_Name = @CategoryName
                WHERE k.Knowledge_ID = @Id;
            ";

                        using (var conn = new SqlConnection(_parent.GenerateConnectionString()))
                        using (var cmd = new SqlCommand(sql, conn))
                        {
                            cmd.Parameters.Add("@Title", System.Data.SqlDbType.NVarChar, 200).Value = textBox1.Text;
                            cmd.Parameters.Add("@Text", System.Data.SqlDbType.NVarChar, -1).Value = textBox2.Text;
                            cmd.Parameters.Add("@CategoryName", System.Data.SqlDbType.NVarChar, 100).Value = comboBox1.Text;
                            cmd.Parameters.Add("@UpdatedAt", System.Data.SqlDbType.DateTime2).Value = DateTime.Now;
                            cmd.Parameters.Add("@Id", System.Data.SqlDbType.Int).Value = knowledgeId;

                            try
                            {
                                conn.Open();
                                int rows = cmd.ExecuteNonQuery();
                                if (rows == 1)
                                {
                                    MessageBox.Show(
                                        "Запись успешно обновлена.",
                                        "Успех",
                                        MessageBoxButtons.OK,
                                        MessageBoxIcon.Information);
                                    this.Close();
                                }
                                else if (rows == 0)
                                {
                                    MessageBox.Show(
                                        $"Запись с ID = {knowledgeId} не найдена или категория «{comboBox1.Text}» отсутствует.",
                                        "Необновлено",
                                        MessageBoxButtons.OK,
                                        MessageBoxIcon.Warning);
                                }
                            }
                            catch (SqlException ex)
                            {
                                MessageBox.Show(
                                    "Ошибка при сохранении изменений:\n" + ex.Message,
                                    "Ошибка",
                                    MessageBoxButtons.OK,
                                    MessageBoxIcon.Error);
                            }
                        }
                    }
            }
                else
                {
                    MessageBox.Show("Заполните все поля!");
                }
        }

        private void LoadKnowledge(ComboBox comboBox, TextBox titleBox, TextBox textBox)
        {
            {
                const string sql = @"
            SELECT 
                k.Title,
                k.Text,
                c.Category_Name
            FROM dbo.Knowledges k
            INNER JOIN dbo.Categories c 
                ON k.Category_ID = c.Category_ID
            WHERE k.Knowledge_ID = @Id;
        ";

                using (var conn = new SqlConnection(_parent.GenerateConnectionString()))
                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.Add("@Id", System.Data.SqlDbType.Int).Value = knowledgeId;

                    try
                    {
                        conn.Open();
                        using (var reader = cmd.ExecuteReader())
                        {
                            if (!reader.Read())
                            {
                                MessageBox.Show(
                                    $"Запись с ID = {knowledgeId} не найдена.",
                                    "Ошибка загрузки",
                                    MessageBoxButtons.OK,
                                    MessageBoxIcon.Warning);
                                return;
                            }

                            titleBox.Text = reader.GetString(0);
                            textBox.Text = reader.GetString(1);
                            comboBox.Text = reader.GetString(2);
                        }
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show(
                            "Ошибка при загрузке данных:\n" + ex.Message,
                            "Ошибка",
                            MessageBoxButtons.OK,
                            MessageBoxIcon.Error);
                    }
                }
            }
        }
    }
}
