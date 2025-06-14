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

namespace Курсовая
{
    public partial class FormRate : Form
    {
        private bool isComment;
        private MainForm _parent;
        private int knowledgeId;
        public FormRate(MainForm parent, bool flag, int id)
        {
            InitializeComponent();
            _parent = parent;
            isComment = flag;
            knowledgeId = id;
            if (!isComment)
            {
                textBox1.Visible = false;
                numericUpDown1.Visible = true;
                button1.Location = new Point(12, 57);
                button2.Location = new Point(131, 57);
                label1.Text = "Оценка:";
                this.Size = new Size(259, 132);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            {
                string sql;
                SqlParameter[] parameters;

                if (isComment)
                {
                    if (textBox1.Text != "")
                    {
                        sql = @"
                    INSERT INTO dbo.Comments
                        (User_ID, Knowledge_ID, Comment_Text, Created_At)
                    VALUES
                        (@UserId, @KnowledgeId, @CommentText, @CreatedAt);
                ";
                        parameters = new[]
                        {
                    new SqlParameter("@UserId",      System.Data.SqlDbType.Int)       { Value = _parent.user_id },
                    new SqlParameter("@KnowledgeId", System.Data.SqlDbType.Int)       { Value = knowledgeId },
                    new SqlParameter("@CommentText", System.Data.SqlDbType.NVarChar, -1) { Value = textBox1.Text },
                    new SqlParameter("@CreatedAt",   System.Data.SqlDbType.DateTime2) { Value = DateTime.Now }
                        };
                    }
                    else
                    {
                        MessageBox.Show("Напишите коментарий!");
                        return;
                    }
                }
                else
                {
                    sql = @"
                INSERT INTO dbo.Ratings
                    (User_ID, Knowledge_ID, Score, Rated_At)
                VALUES
                    (@UserId, @KnowledgeId, @Score, @RatedAt);
            ";
                    parameters = new[]
                    {
                new SqlParameter("@UserId",      System.Data.SqlDbType.Int)       { Value = _parent.user_id },
                new SqlParameter("@KnowledgeId", System.Data.SqlDbType.Int)       { Value = knowledgeId },
                new SqlParameter("@Score",       System.Data.SqlDbType.Int)       { Value = numericUpDown1.Value},
                new SqlParameter("@RatedAt",     System.Data.SqlDbType.DateTime2) { Value = DateTime.Now }
            };
                }

                try
                {
                    using (var conn = new SqlConnection(_parent.GenerateConnectionString()))
                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddRange(parameters);
                        conn.Open();
                        int affected = cmd.ExecuteNonQuery();
                        if (affected == 1)
                        {
                            if (isComment)
                            {
                                MessageBox.Show("Коментарйи успешно добавлен");
                            }
                            else
                            {
                                MessageBox.Show("Оценка успешно добавлена");
                            }
                            this.Close();
                        }
                        else
                        {
                            MessageBox.Show(
                                "Не удалось сохранить данные.",
                                "Ошибка",
                                MessageBoxButtons.OK,
                                MessageBoxIcon.Warning);
                        }
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(
                        "Ошибка при сохранении в БД:\n" + ex.Message,
                        "Ошибка",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Error);
                }
            }
        }
    }
}
