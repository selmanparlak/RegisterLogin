using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Selmanparlak_ip2
{
   
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           


        }
        protected void form_onload(object sender,EventArgs e)
        {
           
        }

        protected void giris_Click(object sender, EventArgs e)
        {

            DataView dView = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dView.Count == 1)
            {
                if(usernamebtn.Text!=string.Empty && passbtn.Text!=string.Empty && passgainbtn.Text==string.Empty && agebtn.Text==string.Empty && genderbtn.Text==string.Empty)
                {
                    Session.Add("username", usernamebtn.Text);
                    Response.Redirect("welcomepage.aspx");
                }
                
            }
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            SqlDataSource1.InsertParameters["username"].DefaultValue = usernamebtn.Text.ToString();
            SqlDataSource1.InsertParameters["password"].DefaultValue = passbtn.Text.ToString();
            SqlDataSource1.InsertParameters["passwordconf"].DefaultValue = passgainbtn.Text.ToString();
            SqlDataSource1.InsertParameters["age"].DefaultValue = agebtn.Text.ToString();
            SqlDataSource1.InsertParameters["gender"].DefaultValue = genderbtn.Text.ToString();
            SqlDataSource1.Insert();
            lbls.Text = "Kayıt Başarıyla yapılmıştır.Giriş Yapınız";
            if(usernamebtn.Text!=string.Empty && passbtn.Text!=string.Empty && passgainbtn.Text!=string.Empty && agebtn.Text!=string.Empty && genderbtn.Text!=string.Empty)
                {
                usernamebtn.Text = "";
                passbtn.Text = "";
                passgainbtn.Text = "";
                agebtn.Text = "";
                genderbtn.SelectedItem.Selected = false;
                }
        }

       
    }
}