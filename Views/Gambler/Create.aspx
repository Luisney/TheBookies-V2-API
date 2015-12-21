<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<GamblerViewModel>" %>
<%@ Import Namespace="Gambling.Models"%>
<%@ Import Namespace="Gambling.ViewModels" %>
<%@ Import Namespace="MvcContrib.FluentHtml" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Apostadores - Crear Apostador
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>    
    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Crear Apostador
    </h2>
    <%= Html.ValidationSummary( "Creación fallida. Por favor corrije los errores e intenta de nuevo." )%>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Campos</legend>
        <p>
            <%= this.TextBox( C => C.Name ).Label( "Nombre:" )%>
            <%= this.ValidationMessage( C => C.Name )%>
        </p>
        <p>
            <%= this.TextBox(C => C.Address).Label("Direccion:") %>
            <%= this.ValidationMessage(C => C.Address) %>
        </p>
        <p>
            <%= this.TextBox(C => C.Phone).Label("Télefono:") %>
            <%= this.ValidationMessage(C => C.Phone) %>
        </p>
        <p>
            <%= this.TextBox( C => C.Email ).Label( "Correo electrónico:" )%>
            <%= this.ValidationMessage( C => C.Email )%>
        </p>
        <p>
            <%= this.TextBox( C => C.DocumentId ).Label( "Identificación:" )%>
            <%= this.ValidationMessage( C => C.DocumentId )%>
        </p>
        <p>
            <label>
                Fecha de nacimiento:</label>
            <%= this.Select( C => C.BirthDay ).Options( Model.DaysList )%>
            <%= this.Select( C => C.BirthMonth ).Options( Model.MonthsList )%>
            <%= this.Select( C => C.BirthYear ).Options( Model.YearsList )%>
        </p>
        <p>
            <input type="submit" value="Crear" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%= Html.ClientSideValidation<Gambler>() %>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
</asp:Content>
