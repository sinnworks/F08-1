using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web;

namespace F08_1.Models.Infra
{
    public class EmailHelper
    {
        private string senderEmail = "iwork0915@gmail.com"; // 寄件者
        private string password = "btwu oias lryk lxve";

        private string smtpHost = "smtp.gmail.com";
        private int smtpPort = 587;
        private bool enableSsl = true;

        public void SendForgetPasswordEmail(string url, string name, string email)
        {
            var subject = "[重設密碼通知]";
            var body = $@"Hello,  Dear {name},
<br />
請點擊此連結 [<a href='{url}' target='_blank'>我要重設密碼</a>], 以進行重設密碼, 如果您沒有提出申請, 請忽略本信, 謝謝";

            var from = senderEmail;
            var to = email;

            SendEmail(from, password, to, subject, body);
        }

        public void SendConfirmRegisterEmail(string url, string name, string email)
        {
            var subject = "[新會員確認信]";
            var body = $@"Hello, Dear {name},
<br />
請點擊此連結 [<a href='{url}' target='_blank'>的確是我申請會員</a>], 如果您沒有提出申請, 請忽略本信, 謝謝";

            var from = senderEmail;
            var to = email;

            SendViaGoogle(from, to, subject, body);
        }

        public virtual void SendViaGoogle(string from, string to, string subject, string body)
        {
            // todo 以下是開發時,測試之用, 只是建立text file, 不真的寄出信
            var path = HttpContext.Current.Server.MapPath("~/files/");
            CreateTextFile(path, from, to, subject, body);
            return;
        }

        private void CreateTextFile(string path, string from, string to, string subject, string body)
        {
            var fileName = $"{to.Replace("@", "_")} {DateTime.Now.ToString("yyyyMMdd_HHmmss")}.txt";

            // 文字檔案的完整路徑
            var fullPath = Path.Combine(path, fileName);

            // 檔案內容
            var contents = $@"from:{from}
to:{to}
subject:{subject}

{body}";

            // 建立文字檔案, 採用UTF8編碼
            File.WriteAllText(fullPath, contents, Encoding.UTF8);
        }


        private void SendEmail(string fromEmail, string fromPassword, string toEmail, string subject, string body)
        {
            try
            {
                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587, // google smpt port
                    Credentials = new NetworkCredential(fromEmail, fromPassword),
                    EnableSsl = true, // Depending on your SMTP server's requirement
                };

                var mailMessage = new MailMessage
                {
                    From = new MailAddress(fromEmail),
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true, // Set this to true if the body content is HTML
                };

                mailMessage.To.Add(toEmail);

                smtpClient.Send(mailMessage);
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
