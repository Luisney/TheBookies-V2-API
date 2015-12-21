<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<CompanyViewModel>" %>

<%@ Import Namespace="Gambling.Models" %>
<%@ Import Namespace="Gambling.ViewModels" %>
<%@ Import Namespace="xVal.Html" %>
<%@ Import Namespace="MvcContrib.FluentHtml" %>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">

    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= Html.Encode( "Consorcios - Crear Consorcio" )%>
    <%
        this.htmlNamePrefix = "company"; %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Html.Encode( "Crear Consorcio" )%>
    </h2>
    <%= Html.ValidationSummary("Creación fallida. por favor corrije los errores e intenta de nuevo") %>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Campos</legend>
        <p>
            <%= this.TextBox(c => c.Name).Label("Nombre:") %>
            <%= this.ValidationMessage(c => c.Name) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Address).Label("Dirección:") %>
            <%= this.ValidationMessage(c => c.Address) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Phone).Label("Teléfono") %>
            <%= this.ValidationMessage(c => c.Phone) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Email).Label("Correo electronico:") %>
            <%= this.ValidationMessage(c => c.Email) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Rnc).Label("RNC:") %>
            <%= this.ValidationMessage(c => c.Rnc) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Manager).Label("Gerente:") %>
            <%= this.ValidationMessage(c => c.Manager) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Ceo).Label("Presidente:") %>
            <%= this.ValidationMessage(c => c.Ceo) %>
        </p>
        <p>
            <%= this.TextBox(c => c.Maximum).Label("Máximo de ventas deportivas:") %>
            <%= this.ValidationMessage(c => c.Maximum) %>
        </p>
        <p>
            <%= this.TextBox(c => c.LottoMaximum).Label("Máximo de ventas loteria:") %>
            <%= this.ValidationMessage( c => c.LottoMaximum )%>
        </p>
        <p>
            <%= this.TextBox(c => c.Surplus).Label("Loteria bote máximo:") %>
            <%= this.ValidationMessage(c => c.Surplus) %>
        </p>
        <p>
            <input type="submit" value="Crear" />
        </p>
    </fieldset>
    <% } %>
    <%= Html.ClientSideValidation<Company>( this.htmlNamePrefix )%>
    <div>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
</asp:Content>
