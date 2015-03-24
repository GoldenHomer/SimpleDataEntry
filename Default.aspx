<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple Data Entry</title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.1.3.min.js"></script>
    <script src="Scripts/jquery-ui-1.11.4.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#TextBox3").mouseover(function () {
                $("#calend").slideDown(500);
            });

            $("#Button1").click(function () {
                $("#calend").slideDown(500);
            });
        });
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div id="main">
        <asp:UpdatePanel ID="boxes" runat="server">
            <ContentTemplate>
                <div id="boxdiv">
                Enter Name:
                <asp:TextBox ID="TextBox1" CssClass="boxes" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Must Enter Name" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                <br />
                Enter Email:
                <asp:TextBox ID="TextBox2" CssClass="boxes" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Must Enter Email" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Must be in email format" ControlToValidate="TextBox2" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                Enter Date:
                <asp:TextBox ID="TextBox3" CssClass="boxes" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Must enter date" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                <br />

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <div id="calend" style="display:none;">
            <asp:UpdatePanel ID="calendholder" runat="server">
                <ContentTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        
        <br />
        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
        <br />
        <br />

            <asp:UpdatePanel ID="gridholder" runat="server" >
                <ContentTemplate>
                      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" />
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="dateadded" HeaderText="dateadded" SortExpression="dateadded" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
					</asp:GridView>
					
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sampConnectionString %>" DeleteCommand="DELETE FROM [dataentry] WHERE [Id] = @Id" InsertCommand="INSERT INTO [dataentry] ([name], [email], [dateadded]) VALUES (@name, @email, @dateadded)" SelectCommand="SELECT [Id], [name], [email], [dateadded] FROM [dataentry]" UpdateCommand="UPDATE [dataentry] SET [name] = @name, [email] = @email, [dateadded] = @dateadded WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter DbType="Date" Name="dateadded" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter DbType="Date" Name="dateadded" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
