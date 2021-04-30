<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Selmanparlak_ip2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     
    <style type="text/css">
        .auto-style1 {
            height: 34px;
        }
        .button {
            margin-bottom:10px;
        }
        .messageInfo{
        color:red;
        margin-left: 10px;
        }  
        .multipleMessageInfo{
        color:red;
        position:absolute;
         margin-left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table>
        <div id="user"
            <tr>
                <td class="auto-style1">
                   <asp:Label ID="userlbl" runat="server" Text="Kullanıcı Adı:" Width="100px" ></asp:Label>
                    <asp:TextBox ID="usernamebtn" runat="server" Text="" Width="200px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req1" runat="server" CssClass="messageInfo" ValidationGroup="kaydol" ErrorMessage="Kullanıcı Adı Boş Olamaz!" ControlToValidate="usernamebtn" ></asp:RequiredFieldValidator>
                </td>

            </tr>
            <div id="pass"
                <tr>
                <td class="auto-style1" >
                    <asp:Label ID="passlbl" runat="server" Text="Şifre:" Width="100px" ></asp:Label> 
                    <asp:TextBox ID="passbtn" runat="server" Text="" Width="200px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req2" runat="server" CssClass="messageInfo" ValidationGroup="kaydol" ErrorMessage="Şifre Boş Olamaz!" ControlToValidate="passbtn" ></asp:RequiredFieldValidator>
                </td>
               </tr>
            </div>
            <div id="passagain" 
                <tr>
                
                <td class="auto-style1" >
                    <asp:Label ID="passagainlbl" runat="server" Text="Şifre Tekrar:" Width="100px" ></asp:Label>
                        <asp:TextBox ID="passgainbtn" runat="server" Text="" Width="200px" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="Req3" runat="server" CssClass="multipleMessageInfo" ValidationGroup="kaydol" ErrorMessage="Şifre Tekrar Boş Olamaz!" ControlToValidate="passgainbtn" ></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="passmatch" runat="server" CssClass="multipleMessageInfo" ValidationGroup="kaydol" ErrorMessage="Şifre-Şifre Tekrar Aynı Olmalı!" ControlToCompare="passbtn" ControlToValidate="passgainbtn" ></asp:CompareValidator>
                </td>
                </tr>

            </div>
            <div id="age" 
                <tr>
                    <td class="auto-style1" >
                        <asp:Label ID="agelbl" runat="server" Text="Yaş:" Width="100px" ></asp:Label>
                        <asp:TextBox ID="agebtn" runat="server" Text="" TextMode="Number"  Width="200px"  ></asp:TextBox>
      
                        <asp:RequiredFieldValidator ID="Req4"  runat="server" CssClass="multipleMessageInfo" ValidationGroup="kaydol"   ErrorMessage="Yaş Boş Olamaz!" ControlToValidate="agebtn" ></asp:RequiredFieldValidator> 
                        <asp:RangeValidator  ID="rangeval" CssClass="multipleMessageInfo"  ValidationGroup="kaydol"  ErrorMessage="Yaş 18-55 arasında olmalı !"   runat="server" MinimumValue="18" MaximumValue="55" Type="Integer" ControlToValidate="agebtn" ></asp:RangeValidator>


                    </td>


                </tr>
                </div>
            <div id="gender"
                <tr>
                    <td>
                        <asp:Label ID="genderlbl" runat="server" Text="Cinsiyet:" Width="100px" ></asp:Label>
                         <asp:RadioButtonList id="genderbtn" runat="server" >
                            <asp:ListItem Text="Erkek" />
                             <asp:ListItem Text="Kadın"/>
                          </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="Req5" runat="server" CssClass="messageInfo" ValidationGroup="kaydol" ErrorMessage="Cinsiyet Seçiniz!" ControlToValidate="genderbtn" ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                </div>
            <div id="button"
                <tr>
                    <td>
                    <asp:Button ID="giris" CssClass="button" runat="server" Text="Giriş Yap" OnClick="giris_Click"  /> <br />
                    <asp:Button ID="Button1" CssClass="button" runat="server" Text="Kayıt Ol" ValidationGroup="kaydol" OnClick="Button1_Click"  /> <br />
                    </td>

                </tr>
                </div>
        </div>
     </table>
        <asp:Label runat="server" ID="lbls" Text="" ForeColor="Blue" ></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Table] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Table] ([username], [password], [passwordconf], [age], [gender]) VALUES (@username, @password, @passwordconf, @age, @gender)" SelectCommand="SELECT * FROM [Table] WHERE (([username] = @username) AND ([password] = @password))" UpdateCommand="UPDATE [Table] SET [username] = @username, [password] = @password, [passwordconf] = @passwordconf, [age] = @age, [gender] = @gender WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="passwordconf" Type="String" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="gender" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="usernamebtn" Name="username" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="passbtn" Name="password" PropertyName="Text" Type="String" />
                
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="passwordconf" Type="String" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
