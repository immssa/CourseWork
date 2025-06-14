using System.Data;
using Microsoft.Data.SqlClient;

namespace Курсовая
{
    public partial class FormCategory : Form
    {
        private MainForm _parent;
        public FormCategory(MainForm parent)
        {
            InitializeComponent();
            _parent = parent;
        }


        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text != "")
            {
                const string checkSql = @"SELECT COUNT(1) FROM dbo.Categories WHERE Category_Name = @CategoryName;";

                const string insertSql = @"INSERT INTO dbo.Categories (Category_Name, Description) VALUES (@CategoryName, @Description);";

                using (var connection = new SqlConnection(_parent.GenerateConnectionString()))
                using (var checkCmd = new SqlCommand(checkSql, connection))
                using (var insertCmd = new SqlCommand(insertSql, connection))
                {
                    checkCmd.Parameters.Add("@CategoryName", SqlDbType.NVarChar, 100)
                    .Value = textBox1.Text;

                    insertCmd.Parameters.Add("@CategoryName", SqlDbType.NVarChar, 100)
                            .Value = textBox1.Text;
                    insertCmd.Parameters.Add("@Description", SqlDbType.NVarChar, 500)
                            .Value = textBox2.Text;

                    try
                    {
                        connection.Open();

                        int exists = (int)checkCmd.ExecuteScalar();
                        if (exists > 0)
                        {
                            MessageBox.Show($"Категория «{textBox1.Text}» уже существует.");
                            return;
                        }

                        int rowsAffected = insertCmd.ExecuteNonQuery();
                        if (rowsAffected == 1)
                        {
                            MessageBox.Show("Категория успешно добавлена.");
                            this.Close();
                        }
                        else
                        {
                            MessageBox.Show("Не удалось добавить категорию.");
                        }
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show($"Ошибка при добавлении категории: {ex.Message}");
                    }
                }
            }
            else
            {
                MessageBox.Show("Заполнитье название категории!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
    }
}
