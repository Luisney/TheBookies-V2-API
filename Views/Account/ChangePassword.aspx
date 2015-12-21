<%@ Page Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Usuarios -
    <%= Html.Encode( "Cambiar contraseña" ) %>
</asp:Content>
<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Html.Encode( "Cambiar contraseña" ) %>
    </h2>
    <p>
        <%= Html.Encode("Usa el siguiente formulario para cambiar su contraseña")%>
    </p>
    <p>
        <%= Html.Encode("La nueva contraseña debe tener un minimo de ") + Html.Encode(ViewData["PasswordLength"]) + Html.Encode(" caracteres de longitud") %>
    </p>
    <%= Html.ValidationSummary("Cambio de contraseña fallido, por favor corrije los errores y vuelve a intentar")%>
    <% using( Html.BeginForm( ) )
       { %>
    <div>
        <fieldset>
            <legend>
                <%= Html.Encode("Información de la cuenta") %></legend>
            <p>
                <label for="currentPassword">
                    <%= Html.Encode("Contraseña actual:") %></label>
                <%= Html.Password("currentPassword") %>
                <%= Html.ValidationMessage("currentPassword") %>
            </p>
            <p>
                <label for="newPassword">
                    <%= Html.Encode("Nueva contraseña:") %></label>
                <%= Html.Password("newPassword") %>
                <%= Html.ValidationMessage("newPassword") %>
            </p>
            <p>
                <label for="confirmPassword">
                    <%= Html.Encode("Confirmar nueva contraseña:") %></label>
                <%= Html.Password("confirmPassword") %>
                <%= Html.ValidationMessage("confirmPassword") %>
            </p>
            <p>
                <input type="submit" value="<%= Html.Encode("Cambiar contraseña") %>" />
            </p>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
