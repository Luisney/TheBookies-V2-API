<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<TheBookies.Model.MachineType>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tipo Máquinas - Crear Tipo Máquina
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "machineTypeToCreate";  %>
    <h2>Crear Tipo Máquina</h2>    
    <% using (Html.BeginForm()) {%>
        <fieldset>
            <legend>Información General</legend>
            <p>
                <%= this.TextBox( model => model.Name ).Label("Nombre:") %>
                <%= this.ValidationMessage( model => model.Name ) %>
            </p>
            <p>
                <%= this.CheckBox( model => model.JackPot ).Label("JackPot:") %>
                <%= this.ValidationMessage( model => model.JackPot ) %>
            </p>            
            <p>
                <label>&nbsp;</label>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>
    <% } %>
    <div>
		<%=Html.ClientSideValidation<TheBookies.Model.MachineType>(HtmlNamePrefix)%>
		<%=Html.ActionLink("Volver al listado", "Index", new {}, new { @class = "navPrev" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>
    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>
</asp:Content>

