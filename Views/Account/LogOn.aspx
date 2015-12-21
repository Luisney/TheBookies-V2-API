<%@ Page Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Ingresar
</asp:Content>
<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Ingresar
    </h2>
    <p>
        <%= Html.Encode("Por favor ingresa tu usuario y tu contraseña. ") %>
    </p>
    <%= Html.ValidationSummary("Ingreso fallido. por favor corrije los errores e intenta de nuevo.") %>
    <% using( Html.BeginForm( ) )
       { %>
    <div>
        <fieldset>
            <legend>
                <%= Html.Encode("Información de la cuenta") %></legend>
            <p>
                <label for="username">
                    Usuario:</label>
                <%= Html.TextBox("username") %>
                <%= Html.ValidationMessage("username") %>
            </p>
            <p>
                <label for="password">
                    <%= Html.Encode( "Contraseña:" ) %></label>
                <%= Html.Password("password") %>
                <%= Html.ValidationMessage("password") %>
            </p>
            <p>
                <%= Html.CheckBox("rememberMe") %>
                <label class="inline" for="rememberMe">
                    Recuerdame en este equipo</label>
            </p>
            <p>
                <input type="submit" value="Ingresar" />
            </p>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
