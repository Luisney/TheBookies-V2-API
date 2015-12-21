<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<GamblerViewModel>" %>

<%@ Import Namespace="Gambling.Models" %>
<%@ Import Namespace="Gambling.ViewModels" %>
<%@ Import Namespace="MvcContrib.FluentHtml" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Apostadores - Editar Apostador
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>
    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Editando apostador:
        <%= Html.Encode(Model.Name)%></h2>
    <%= Html.ValidationSummary("Edición fallida. Por favor corrije los errores e intenta de nuevo.") %>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Campos</legend>
        <p>
            <%= this.TextBox( c => c.Name ).Disabled( true ).Label("Nombre:") %>
            <%= this.Hidden( c => c.Name )%>
            <%= this.ValidationMessage(c => c.Name) %>
            <%= this.Hidden( c=>c.Status ) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Address).Label("Dirección:") %>
            <%= this.ValidationMessage(c => c.Address) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Phone).Label("Télefono:") %>
            <%= this.ValidationMessage(c => c.Phone) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Email).Label("Correo electrónico:") %>
            <%= this.ValidationMessage(c => c.Email) %>
        </p>
        <p>
            <%= this.TextBox(c => c.DocumentId).Label("Identificación:") %>
            <%= this.ValidationMessage(c => c.DocumentId) %>
        </p>
        <p>
            <label>
                Fecha de nacimiento:</label>
            <%= this.Select(c=>c.BirthDay).Options(Model.DaysList) %>
            <%= this.Select(c=>c.BirthMonth).Options(Model.MonthsList) %>
            <%= this.Select(c=>c.BirthYear).Options(Model.YearsList) %>
        </p>
        <p>
            <input type="submit" value="Editar" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%= Html.ClientSideValidation<Gambler>() %>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
</asp:Content>
