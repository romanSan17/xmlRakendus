<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="xmlRakendus.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <h1>XMLminu</h1>

        <div>
            <asp:Xml runat="server"
                DocumentSource="~/MinuSugupuu.xml"
                TransformSource="~/MinuParing.xslt">
            </asp:Xml>
        </div>

    </main>

</asp:Content>