<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<TheBookies.Model.IncomeCode>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cuentas Ingresos - Crear Cuenta Ingreso
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "incomeCodeToCreate";  %>
    <h2>Crear Cuenta Ingreso</h2>   
    <% using (Html.BeginForm()) {%>
        <fieldset>
            <legend>Información General</legend>            
            <p>
                <%= this.TextBox( c => c.Detail ).Label("Nombre:") %>
                <%= this.ValidationMessage( c => c.Detail ) %>
            </p>
            <p>
                <label>&nbsp;</label>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>
    <% } %>
    <div>
		<%= Html.ClientSideValidation<TheBookies.Model.IncomeCode>( HtmlNamePrefix )%>
		<%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>
    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>
</asp:Content>

