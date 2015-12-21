<%@  Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Usuarios -
    <%= Html.Encode( "Tu contraseña ha sido cambiada exitosamente" ) %>
</asp:Content>
<asp:Content ID="changePasswordSuccessContent" ContentPlaceHolderID="MainContent"
    runat="server">
    <h2>
        <%= Html.Encode( "Cambiar contraseña" ) %>
    </h2>
    <p>
        <%= Html.Encode( "Tu contraseña ha sido cambiada exitosamente" ) %>
    </p>
</asp:Content>
