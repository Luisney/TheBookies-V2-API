<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<Gambling.Models.Route>" %>

<%@ Import Namespace="xVal.Html" %>
<%@ Import Namespace="Gambling.Models" %>
<%@ Import Namespace="MvcContrib.FluentHtml" %>
<asp:Content ID="Assets" ContentPlaceHolderID="Assets" runat="server">

    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Rutas - Crear Ruta
    <%
        HtmlNamePrefix = "RouteToAdd";
    %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Crear Ruta
    </h2>
    <%= Html.ValidationSummary("Creación fallida. por favor corrije los errores e intenta de nuevo") %>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Campos</legend>
        <p>
            <%= this.TextBox( R => R.Name ).Label("Nombre:") %>
            <%= this.ValidationMessage( R => R.Name )%>
        </p>
        <p>
            <%= this.TextBox( R => R.Person1 ).Label( "Primer encargado:" )%>
            <%= this.ValidationMessage( R => R.Person1 )%>
        </p>
        <p>
            <%= this.TextBox( R => R.Person2 ).Label( "Segundo encargado:" )%>
            <%= this.ValidationMessage( R => R.Person2 )%>
        </p>
        <p>
            <%= this.Select( "CompanyId" )
                .Options( ( SelectList ) ViewData [ "CompanyId" ] )
                                            .Selected( ( ( SelectList ) ViewData [ "CompanyId" ] ).SelectedValue ).Label( "Consorcio:" )%>
            <%= this.ValidationMessage( R => R.Company )%>
        </p>
        <p>
            <input type="submit" value="Crear" />
        </p>
    </fieldset>
    <% } %>
    <p>
        <%= Html.ClientSideValidation<Gambling.Models.Route>( HtmlNamePrefix ) %>
        <%= Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </p>
</asp:Content>
