using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Email
{
    class Program
    {
        static void Main(string[] args)
        {

            /******************************************************************************************************************/

            bool DEBUG_MODE = false; //set to true if you don't want emails to actually be sent out (useful for testing purposes)

            /******************************************************************************************************************/



            while (true) //Constantly running
            {
                DateTime t = DateTime.Now;

                if (t.Hour == 18 && t.Minute == 0) //at 6:00PM start sending the emails
                {
                    string EmployeeName = string.Empty;
                    string ManagerEmail = string.Empty;
                    string SubmittedDate = string.Empty;
                    string RequestStatus = string.Empty;

                    bool expired = false;

                    for (int i = 0; i < 1000; i++) //you can scale this up a lot more if you know that your system has a TON of requests
                    {
                        Console.WriteLine("\n\n\n");
                        EmployeeName = grabRequest(0, i);
                        ManagerEmail = grabRequest(1, i);
                        SubmittedDate = grabRequest(2, i);
                        RequestStatus = grabRequest(3, i);

                        try
                        {
                            DateTime SubDate = DateTime.Parse(SubmittedDate);
                            DateTime notifDate = SubDate.AddDays(3);
                            Console.WriteLine("Notifications start date: " + Convert.ToString(notifDate));
                            Console.WriteLine("Submission Date: " + SubmittedDate + "\n" + RequestStatus + "\n" + "Managers Email: " + ManagerEmail + "\n" + EmployeeName);
                            expired = DateTime.Now >= notifDate;
                            Console.WriteLine("Should I send out a notification email? " + expired);
                            if (RequestStatus == "Pending")
                            {
                                if (DateTime.Now >= notifDate)
                                    sendNotification(ManagerEmail, EmployeeName, i, DEBUG_MODE);
                            }
                            else
                            {
                                Console.WriteLine("Not a pending request. No email will be sent!");
                            }
                        }
                        catch
                        {
                            Console.WriteLine("Couldn't send email for: RequestID " + i);
                        }
                    }
                    Console.WriteLine("\nSleeping for 60 Seconds\n");
                    System.Threading.Thread.Sleep(60000); //We have sent out the emails, rest for 60 seconds so we don't repeat the emails
                }

            }

        }



        static public void sendNotification(string Email, string Employee,int requestID, bool DEBUG)
        {
            try
            {
                if (DEBUG == false) //Check if we are debugging
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                    mail.From = new MailAddress("dontreplysrsmail@gmail.com");
                    mail.To.Add(Email);
                    mail.Subject = "RequestID: " + requestID + " Automatic Notification";
                    mail.IsBodyHtml = true;
                    string body1 = String.Format("This is an automatic notifcation: " + Employee + "'s request, has been awaiting review for more than 3 days.\nPlease sign-in on the SRS Badge Request page and review his or her request.\nThanks.");
                    mail.Body = body1;

                    SmtpServer.Port = 587;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("dontreplysrsmail@gmail.com", "Password!1");
                    SmtpServer.EnableSsl = true;

                    SmtpServer.Send(mail);
                }



                Console.WriteLine("Email sent out for the manager of : " + Employee);

            }
            catch (Exception ex)
            {
                Console.WriteLine("Email failure for the manager of " + Employee);
            }


        }

        static public string grabRequest(int info, int requestid)
        {
            string toReturn = string.Empty;
            switch (info)
            {
                case 0: //Employee name
                    using (SqlConnection Connection = new SqlConnection("Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;User ID=pwndatnerd;Password=AaronDavidRandall!3"))
                    {
                        try
                        {
                            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Requests WHERE RequestID=@RequestID", Connection);
                            cmd.Parameters.AddWithValue("@RequestID", requestid);
                            Connection.Open();

                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    toReturn = reader["Employee"].ToString();

                                }
                                Connection.Close();
                            }
                        }
                        catch
                        {
                            toReturn = "NULL"; //request doesnt exist
                            Console.WriteLine("RequestID: " + requestid + ". Couldn't grab employee name");
                        }

                    }

                    break;



                case 1: //Manager email
                    using (SqlConnection Connection = new SqlConnection("Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;User ID=pwndatnerd;Password=AaronDavidRandall!3"))
                    {
                        try
                        {
                            SqlCommand cmd = new SqlCommand(@"Select Email FROM Credentials WHERE UserID =
                                            (Select UserID FROM Employees WHERE ([First Name] + ' ' + [Middle Name]  + ' ' + [Last Name]) =
                                             (Select [Manager Name] FROM Employees WHERE ([First Name] + ' ' + [Middle Name]  + ' ' + [Last Name]) = 
                                                (Select Employee FROM Requests WHERE [RequestID]=@reqid)))", Connection);
                            cmd.Parameters.AddWithValue("@reqid", requestid);
                            Connection.Open();
                            toReturn = (string)cmd.ExecuteScalar();

                            Connection.Close();
                        }
                        catch
                        {
                            toReturn = "NULL"; //request doesnt exist
                            Console.WriteLine("RequestID: " + requestid + ". Couldn't grab manager email");
                        }

                    }
                    break;



                case 2: //date request was submitted
                    using (SqlConnection Connection = new SqlConnection("Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;User ID=pwndatnerd;Password=AaronDavidRandall!3"))
                    {
                        try
                        {
                            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Requests WHERE RequestID=@RequestID", Connection);
                            cmd.Parameters.AddWithValue("@RequestID", requestid);
                            Connection.Open();

                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    toReturn = reader["CurrentDate"].ToString();

                                }
                                Connection.Close();
                            }
                        }
                        catch
                        {
                            toReturn = "NULL"; //request doesnt exist
                            Console.WriteLine("RequestID: " + requestid + ". Couldn't grab date submitted.");
                        }

                    }
                    break;



                case 3: //request state
                    using (SqlConnection Connection = new SqlConnection("Data Source=badgerequest.cthyx0iu4w46.us-east-2.rds.amazonaws.com;Initial Catalog=badge_request;User ID=pwndatnerd;Password=AaronDavidRandall!3"))
                    {
                        try
                        {
                            SqlCommand cmd = new SqlCommand(@"SELECT * FROM Requests WHERE RequestID=@RequestID", Connection);
                            cmd.Parameters.AddWithValue("@RequestID", requestid);
                            Connection.Open();

                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    toReturn = reader["RequestState"].ToString();

                                }
                                Connection.Close();
                            }
                        }
                        catch
                        {
                            toReturn = "NULL"; //request doesnt exist
                            Console.WriteLine("RequestID: " + requestid + ". Couldn't grab request state");
                        }

                    }
                    break;
            }

            return toReturn;
        }
    }
}
