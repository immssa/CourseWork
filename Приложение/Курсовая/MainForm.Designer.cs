namespace Курсовая
{
    partial class MainForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            buttonAdd = new Button();
            buttonDel = new Button();
            buttonGetText = new Button();
            dataGridView1 = new DataGridView();
            IDColumn = new DataGridViewTextBoxColumn();
            TColumn = new DataGridViewTextBoxColumn();
            HColumn = new DataGridViewTextBoxColumn();
            AColumn = new DataGridViewTextBoxColumn();
            DColumn = new DataGridViewTextBoxColumn();
            buttonAddComment = new Button();
            buttonAddRate = new Button();
            buttonEdit = new Button();
            labelGetComments = new Label();
            labelGetRatings = new Label();
            buttonAddCategory = new Button();
            labelLogOut = new Label();
            comboBox1 = new ComboBox();
            buttonMoreInfo = new Button();
            label4 = new Label();
            label1 = new Label();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // buttonAdd
            // 
            buttonAdd.Location = new Point(12, 83);
            buttonAdd.Name = "buttonAdd";
            buttonAdd.Size = new Size(167, 23);
            buttonAdd.TabIndex = 0;
            buttonAdd.Text = "Добавить статью";
            buttonAdd.UseVisualStyleBackColor = true;
            buttonAdd.Click += buttonAdd_Click;
            // 
            // buttonDel
            // 
            buttonDel.Location = new Point(12, 141);
            buttonDel.Name = "buttonDel";
            buttonDel.Size = new Size(167, 23);
            buttonDel.TabIndex = 1;
            buttonDel.Text = "Удалить";
            buttonDel.UseVisualStyleBackColor = true;
            buttonDel.Click += buttonDel_Click;
            // 
            // buttonGetText
            // 
            buttonGetText.Location = new Point(12, 170);
            buttonGetText.Name = "buttonGetText";
            buttonGetText.Size = new Size(167, 23);
            buttonGetText.TabIndex = 2;
            buttonGetText.Text = "Получить содержимое";
            buttonGetText.UseVisualStyleBackColor = true;
            buttonGetText.Click += buttonGetText_Click;
            // 
            // dataGridView1
            // 
            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Columns.AddRange(new DataGridViewColumn[] { IDColumn, TColumn, HColumn, AColumn, DColumn });
            dataGridView1.Location = new Point(185, 83);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.ReadOnly = true;
            dataGridView1.Size = new Size(551, 262);
            dataGridView1.TabIndex = 4;
            // 
            // IDColumn
            // 
            IDColumn.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            IDColumn.DataPropertyName = "ID";
            IDColumn.HeaderText = "ID";
            IDColumn.Name = "IDColumn";
            IDColumn.ReadOnly = true;
            IDColumn.Width = 43;
            // 
            // TColumn
            // 
            TColumn.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            TColumn.DataPropertyName = "Тема";
            TColumn.HeaderText = "Тема";
            TColumn.Name = "TColumn";
            TColumn.ReadOnly = true;
            TColumn.Width = 60;
            // 
            // HColumn
            // 
            HColumn.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            HColumn.DataPropertyName = "Название";
            HColumn.HeaderText = "Навзвание";
            HColumn.Name = "HColumn";
            HColumn.ReadOnly = true;
            HColumn.Width = 90;
            // 
            // AColumn
            // 
            AColumn.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            AColumn.DataPropertyName = "Автор";
            AColumn.HeaderText = "Автор";
            AColumn.Name = "AColumn";
            AColumn.ReadOnly = true;
            AColumn.Width = 65;
            // 
            // DColumn
            // 
            DColumn.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            DColumn.DataPropertyName = "Дата";
            DColumn.HeaderText = "Дата";
            DColumn.Name = "DColumn";
            DColumn.ReadOnly = true;
            // 
            // buttonAddComment
            // 
            buttonAddComment.Location = new Point(12, 199);
            buttonAddComment.Name = "buttonAddComment";
            buttonAddComment.Size = new Size(167, 23);
            buttonAddComment.TabIndex = 2;
            buttonAddComment.Text = "Прокомменетировать";
            buttonAddComment.UseVisualStyleBackColor = true;
            buttonAddComment.Click += buttonAddComment_Click;
            // 
            // buttonAddRate
            // 
            buttonAddRate.Location = new Point(12, 228);
            buttonAddRate.Name = "buttonAddRate";
            buttonAddRate.Size = new Size(167, 23);
            buttonAddRate.TabIndex = 2;
            buttonAddRate.Text = "Оценить";
            buttonAddRate.UseVisualStyleBackColor = true;
            buttonAddRate.Click += buttonAddRate_Click;
            // 
            // buttonEdit
            // 
            buttonEdit.Location = new Point(12, 112);
            buttonEdit.Name = "buttonEdit";
            buttonEdit.Size = new Size(167, 23);
            buttonEdit.TabIndex = 2;
            buttonEdit.Text = "Редактировать";
            buttonEdit.UseVisualStyleBackColor = true;
            buttonEdit.Click += buttonEdit_Click;
            // 
            // labelGetComments
            // 
            labelGetComments.AutoSize = true;
            labelGetComments.Location = new Point(597, 348);
            labelGetComments.Name = "labelGetComments";
            labelGetComments.Size = new Size(84, 15);
            labelGetComments.TabIndex = 5;
            labelGetComments.Text = "Комментарии";
            labelGetComments.Click += labelGetComments_Click;
            // 
            // labelGetRatings
            // 
            labelGetRatings.AutoSize = true;
            labelGetRatings.Location = new Point(687, 348);
            labelGetRatings.Name = "labelGetRatings";
            labelGetRatings.Size = new Size(49, 15);
            labelGetRatings.TabIndex = 6;
            labelGetRatings.Text = "Оценки";
            labelGetRatings.Click += labelGetRatings_Click;
            // 
            // buttonAddCategory
            // 
            buttonAddCategory.Location = new Point(12, 322);
            buttonAddCategory.Name = "buttonAddCategory";
            buttonAddCategory.Size = new Size(167, 23);
            buttonAddCategory.TabIndex = 0;
            buttonAddCategory.Text = "Добавить категроию";
            buttonAddCategory.UseVisualStyleBackColor = true;
            buttonAddCategory.Click += buttonAddCategory_Click;
            // 
            // labelLogOut
            // 
            labelLogOut.AutoSize = true;
            labelLogOut.Location = new Point(12, 426);
            labelLogOut.Name = "labelLogOut";
            labelLogOut.Size = new Size(42, 15);
            labelLogOut.TabIndex = 7;
            labelLogOut.Text = "Выйти";
            labelLogOut.Click += labelLogOut_Click;
            // 
            // comboBox1
            // 
            comboBox1.FormattingEnabled = true;
            comboBox1.Location = new Point(615, 32);
            comboBox1.Name = "comboBox1";
            comboBox1.Size = new Size(121, 23);
            comboBox1.TabIndex = 8;
            comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            // 
            // buttonMoreInfo
            // 
            buttonMoreInfo.Location = new Point(515, 31);
            buttonMoreInfo.Name = "buttonMoreInfo";
            buttonMoreInfo.Size = new Size(94, 23);
            buttonMoreInfo.TabIndex = 9;
            buttonMoreInfo.Text = "Подробнее";
            buttonMoreInfo.UseVisualStyleBackColor = true;
            buttonMoreInfo.Click += buttonMoreInfo_Click;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(12, 9);
            label4.Name = "label4";
            label4.Size = new Size(38, 15);
            label4.TabIndex = 10;
            label4.Text = "label4";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(615, 14);
            label1.Name = "label1";
            label1.Size = new Size(66, 15);
            label1.TabIndex = 11;
            label1.Text = "Категория:";
            // 
            // MainForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(label1);
            Controls.Add(label4);
            Controls.Add(buttonMoreInfo);
            Controls.Add(comboBox1);
            Controls.Add(labelLogOut);
            Controls.Add(labelGetRatings);
            Controls.Add(labelGetComments);
            Controls.Add(dataGridView1);
            Controls.Add(buttonEdit);
            Controls.Add(buttonAddRate);
            Controls.Add(buttonAddComment);
            Controls.Add(buttonGetText);
            Controls.Add(buttonDel);
            Controls.Add(buttonAddCategory);
            Controls.Add(buttonAdd);
            Name = "MainForm";
            Text = "Главная форма";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button buttonAdd;
        private Button buttonDel;
        private Button buttonGetText;
        private DataGridView dataGridView1;
        private DataGridViewTextBoxColumn IDColumn;
        private DataGridViewTextBoxColumn TColumn;
        private DataGridViewTextBoxColumn HColumn;
        private DataGridViewTextBoxColumn AColumn;
        private DataGridViewTextBoxColumn DColumn;
        private Button buttonAddComment;
        private Button buttonAddRate;
        private Button buttonEdit;
        private Label labelGetComments;
        private Label labelGetRatings;
        private Button buttonAddCategory;
        private Label labelLogOut;
        private ComboBox comboBox1;
        private Button buttonMoreInfo;
        private Label label4;
        private Label label1;
    }
}
