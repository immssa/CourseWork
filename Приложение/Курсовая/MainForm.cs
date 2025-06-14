using System;
using System.Data;
using System.Text;
using System.Windows.Forms;
using Microsoft.Data.SqlClient;
using Microsoft.Identity.Client;

namespace Курсовая
{
    public partial class MainForm : Form
    {
        public string role = "Guest";
        public int user_id;

        public MainForm()
        {
            FormAuthorization formAuthorization = new FormAuthorization(this);
            formAuthorization.ShowDialog();
            InitializeComponent();
            LoadCategories(comboBox1);
            if (role == "Guest")
            {
                label4.Text = "Добро пожаловать гость!";
            }
            else if (role != "Admin")
            {
                label4.Text = $"Добро пожаловать {GetUserDisplayName()}!";
            }
            else
            {
                label4.Text = "";
            }
        }

        public string server = "DESKTOP-6RNO90P\\SQLEXPRESS";
        public string database = "Cw";
        public string userId = "DESKTOP-6RNO90P\\User";
        public string password = "myPassword";
        public bool integratedSecurity = true;
        public bool trustServerCertificate = true;
        public int connectTimeout = 15;

        public string GenerateConnectionString()
        {
            string _connectionString;

            var builder = new SqlConnectionStringBuilder
            {
                DataSource = server,
                InitialCatalog = database,
                IntegratedSecurity = integratedSecurity,
                UserID = userId,
                Password = password,
                TrustServerCertificate = trustServerCertificate,
                ConnectTimeout = connectTimeout
            };

            return _connectionString = builder.ConnectionString;
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            if (role != "Guest")
            {
                FormAdd formAdd = new FormAdd(this, false, 0);
                formAdd.ShowDialog();
            }
            else
            {
                MessageBox.Show("Необходима авторизация!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void buttonEdit_Click(object sender, EventArgs e)
        {
            if (role == "Guest")
            {
                MessageBox.Show("Необходима авторизация!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Пожалуйста, выберите запись в таблице.",
                                "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            int knowledgeId = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells[0].Value);

            const string selectSql = @"SELECT User_ID FROM dbo.Knowledges WHERE Knowledge_ID = @Id;";

            using (var conn = new SqlConnection(GenerateConnectionString()))
            using (var selectCmd = new SqlCommand(selectSql, conn))
            {
                selectCmd.Parameters.Add("@Id", System.Data.SqlDbType.Int).Value = knowledgeId;
                try
                {
                    conn.Open();
                    object ownerObj = selectCmd.ExecuteScalar();
                    if (ownerObj == null)
                    {
                        return;
                    }

                    int ownerId = Convert.ToInt32(ownerObj);
                    if (ownerId != user_id && role != "Admin")
                    {
                        MessageBox.Show("Нельзя редактировать чужую запись!");
                        return;
                    }
                    else
                    {
                        FormAdd formAdd = new FormAdd(this, true, knowledgeId);
                        formAdd.ShowDialog();
                        LoadKnowledges(dataGridView1, comboBox1.SelectedItem.ToString());
                    }
                }
                catch (Exception ex)
                {
                    throw new ApplicationException(
                            $"Ошибка при попытке редактировать Knowledge_ID={knowledgeId}: {ex.Message}", ex);
                }
            }
        }

        private void buttonDel_Click(object sender, EventArgs e)
        {
            if (role == "Guest")
            {
                MessageBox.Show("Необходима авторизация!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Пожалуйста, выберите запись в таблице.",
                                "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            int knowledgeId = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells[0].Value);

            {
                const string selectSql = @"
                    SELECT User_ID
                    FROM dbo.Knowledges
                    WHERE Knowledge_ID = @Id;";

                const string deleteSql = @"
                    DELETE FROM dbo.Knowledges
                    WHERE Knowledge_ID = @Id;";

                using (var conn = new SqlConnection(GenerateConnectionString()))
                using (var selectCmd = new SqlCommand(selectSql, conn))
                using (var deleteCmd = new SqlCommand(deleteSql, conn))
                {
                    selectCmd.Parameters.Add("@Id", System.Data.SqlDbType.Int).Value = knowledgeId;
                    deleteCmd.Parameters.Add("@Id", System.Data.SqlDbType.Int).Value = knowledgeId;

                    try
                    {
                        conn.Open();
                        object ownerObj = selectCmd.ExecuteScalar();
                        if (ownerObj == null)
                        {
                            return;
                        }

                        int ownerId = Convert.ToInt32(ownerObj);
                        if (ownerId != user_id && role != "Admin")
                        {
                            MessageBox.Show("Нельзя удалить чужую запись!");
                            return;
                        }

                        int affected = deleteCmd.ExecuteNonQuery();
                        if (affected != 1)
                        {
                            MessageBox.Show(
                                $"Не удалось удалить запись с ID={knowledgeId}.",
                                "Ошибка",
                                MessageBoxButtons.OK,
                                MessageBoxIcon.Error);
                            return;
                        }
                        dataGridView1.Rows.RemoveAt(dataGridView1.SelectedRows[0].Index);

                        MessageBox.Show("Запись успешно удалена.", "Готово", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (SqlException ex)
                    {
                        throw new ApplicationException(
                            $"Ошибка при удалении Knowledge_ID={knowledgeId}: {ex.Message}", ex);
                    }
                }
            }
        }

        private void buttonGetText_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Пожалуйста, выберите запись в таблице.",
                                "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            int id = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells[0].Value);
            string title = dataGridView1.SelectedRows[0].Cells[2].Value.ToString();
            MessageBox.Show(GetKnowledgeText(id), title);
        }

        private void buttonAddComment_Click(object sender, EventArgs e)
        {
            if (role == "Guest")
            {
                MessageBox.Show("Необходима авторизация!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Пожалуйста, выберите запись в таблице.",
                                "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            int knowledgeId = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells[0].Value);

            FormRate formRate = new FormRate(this, true, knowledgeId);
            formRate.ShowDialog();
        }

        private void buttonAddRate_Click(object sender, EventArgs e)
        {
            if (role == "Guest")
            {
                MessageBox.Show("Необходима авторизация!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Пожалуйста, выберите запись в таблице.",
                                "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            int knowledgeId = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells[0].Value);

            FormRate formRate = new FormRate(this, false, knowledgeId);
            formRate.ShowDialog();
        }

        private void buttonAddCategory_Click(object sender, EventArgs e)
        {
            if (role != "Guest")
            {
                FormCategory formCategory = new FormCategory(this);
                formCategory.ShowDialog();
                LoadCategories(comboBox1);
            }
            else
            {
                MessageBox.Show("Необходима авторизация!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void buttonMoreInfo_Click(object sender, EventArgs e)
        {
            const string sql = @"
                SELECT Description
                FROM dbo.Categories
                WHERE Category_Name = @CategoryName;";

            using (var conn = new SqlConnection(GenerateConnectionString()))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@CategoryName", System.Data.SqlDbType.NVarChar, 100)
                   .Value = comboBox1.Text;

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result == null || result == DBNull.Value)
                        return;
                    if (Convert.ToString(result) != "")
                    {
                        MessageBox.Show(Convert.ToString(result));
                    }
                    else
                    {
                        MessageBox.Show("У данной категории нету описания");
                    }
                }
                catch (SqlException ex)
                {
                    throw new ApplicationException(
                        $"Ошибка при получении описания для категории «{comboBox1.Text}»: {ex.Message}", ex);
                }
            }
        }

        private void labelGetComments_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Пожалуйста, выберите запись в таблице.",
                                "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            int knowledgeId = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells[0].Value);

            const string sql = @"
                SELECT 
                    c.Comment_Text,
                    u.Login,
                    c.Created_At
                FROM dbo.Comments c
                INNER JOIN dbo.Users u ON c.User_ID = u.User_ID
                WHERE c.Knowledge_ID = @KnowledgeId
                ORDER BY c.Created_At;";

            var sb = new StringBuilder();

            using (var conn = new SqlConnection(GenerateConnectionString()))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@KnowledgeId", System.Data.SqlDbType.Int).Value = knowledgeId;

                try
                {
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string text = reader.GetString(0);
                            string login = reader.GetString(1);
                            DateTime created = reader.GetDateTime(2);
                            sb.AppendLine($"{text} - {login} ({created})");
                        }
                    }
                }
                catch (SqlException ex)
                {
                    throw new ApplicationException(
                        $"Ошибка при получении комментариев для Knowledge_ID={knowledgeId}: {ex.Message}", ex);
                }
            }
            if (sb.ToString() != "")
            {
                MessageBox.Show(sb.ToString());
            }
            else
            {
                MessageBox.Show("Комментариев не найдено!");
            }
            return;
        }

        private void labelGetRatings_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Пожалуйста, выберите запись в таблице.",
                                "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            int knowledgeId = Convert.ToInt32(dataGridView1.SelectedRows[0].Cells[0].Value);

            const string sql = @"
            SELECT 
                r.Score,
                u.Login,
                r.Rated_At
            FROM dbo.Ratings r
            INNER JOIN dbo.Users u ON r.User_ID = u.User_ID
            WHERE r.Knowledge_ID = @KnowledgeId
            ORDER BY r.Rated_At;
        ";

            var sb = new StringBuilder();

            using (var conn = new SqlConnection(GenerateConnectionString()))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@KnowledgeId", System.Data.SqlDbType.Int).Value = knowledgeId;

                try
                {
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            double score = reader.GetInt32(0);
                            string login = reader.GetString(1);
                            DateTime created = reader.GetDateTime(2);
                            sb.AppendLine($"{score} - {login} ({created})");
                        }
                    }
                }
                catch (SqlException ex)
                {
                    throw new ApplicationException(
                        $"Ошибка при получении оценок для Knowledge_ID={knowledgeId}: {ex.Message}", ex);
                }
            }
            if (sb.ToString() != "")
            {
                MessageBox.Show(sb.ToString());
            }
            else
            {
                MessageBox.Show("Оценок не найдено!");
            }
            return;
        }

        private void labelLogOut_Click(object sender, EventArgs e)
        {
            FormAuthorization formAuthorization = new FormAuthorization(this);
            formAuthorization.ShowDialog();
            if (role == "Guest")
            {
                label4.Text = "Добро пожаловать гость!";
            }
            else if (role != "Admin")
            {
                label4.Text = $"Добро пожаловать {GetUserDisplayName()}!";
            }
            else
            {
                label4.Text = "";
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadKnowledges(dataGridView1, comboBox1.SelectedItem.ToString());
        }

        public void LoadKnowledges(DataGridView grid, string category)
        {
            grid.Columns.Clear();

            const string sql = @"
            SELECT
                k.Knowledge_ID        AS ID,
                c.Category_Name       AS [Категория],
                k.Title               AS [Тема],
                u.Login               AS [Автор],
                k.Created_At          AS [Дата публикации],
                k.Update_At          AS [Последнее редактирование]
            FROM dbo.Knowledges k
            INNER JOIN dbo.Categories c ON k.Category_ID = c.Category_ID
            INNER JOIN dbo.Users      u ON k.User_ID     = u.User_ID
            WHERE c.Category_Name = @category;";

            grid.AutoGenerateColumns = true;
            grid.DataSource = null;

            try
            {
                using (var conn = new SqlConnection(GenerateConnectionString()))
                using (var adapter = new SqlDataAdapter(sql, conn))
                {
                    adapter.SelectCommand.Parameters.AddWithValue("@category", category);
                    var table = new DataTable();
                    adapter.Fill(table);
                    grid.DataSource = table;
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show(
                    "Не удалось загрузить данные Knowledge:\n" + ex.Message,
                    "Ошибка",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error
                );
            }
        }

        public string GetKnowledgeText(int knowledgeId)
        {
            const string sql = @"
            SELECT [Text]
            FROM dbo.Knowledges
            WHERE Knowledge_ID = @Id;";

            using (var conn = new SqlConnection(GenerateConnectionString()))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@Id", System.Data.SqlDbType.Int).Value = knowledgeId;

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    return (result == null || result == DBNull.Value ? null : Convert.ToString(result));
                }
                catch (SqlException ex)
                {
                    throw new ApplicationException(
                        $"Ошибка при получении текста Knowledge_ID={knowledgeId}: {ex.Message}", ex);
                }
            }
        }

        public void LoadCategories(ComboBox comboBox)
        {
            const string sql = @"
            SELECT Category_Name
            FROM dbo.Categories
            ORDER BY Category_Name;
        ";

            comboBox.Items.Clear();

            using (var conn = new SqlConnection(GenerateConnectionString()))
            using (var cmd = new SqlCommand(sql, conn))
            {
                try
                {
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            comboBox.Items.Add(reader.GetString(0));
                        }
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(
                        "Не удалось загрузить список категорий:\n" + ex.Message,
                        "Ошибка",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Error
                    );
                }
            }
        }

        public string GetUserDisplayName()
        {
            const string sql = @"
            SELECT 
                CASE 
                  WHEN Full_Name IS NOT NULL 
                       AND LTRIM(RTRIM(Full_Name)) <> '' 
                  THEN Full_Name 
                  ELSE Login 
                END
            FROM dbo.Users
            WHERE User_ID = @UserId;
        ";

            using (var conn = new SqlConnection(GenerateConnectionString()))
            using (var cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.Add("@UserId", System.Data.SqlDbType.Int).Value = user_id;

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    return result as string ?? string.Empty;
                }
                catch (SqlException ex)
                {
                    throw new ApplicationException(
                        $"Ошибка при получении имени пользователя User_ID={userId}: {ex.Message}", ex);
                }
            }
        }
    }
}
