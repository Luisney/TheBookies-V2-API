<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<TheBookies.Model.Machine>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Máquinas Traga Moneda - Crear Máquinas Traga Moneda
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "machineToCreate";  %>
    <h2>Crear Máquina Traga Moneda</h2>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Información General</legend>
        <p>
            <%= this.TextBox(c => c.MachineCode).Label("Código:") %>
            <%= this.ValidationMessage(c => c.MachineCode) %>
        </p>
        <p>
            <label>Banca:</label>
            <%= Html.DropDownList("machineToCreate.SportBookId")%>
        </p>
        <p>
            <label>Tipo Máquina:</label>
            <%= Html.DropDownList("machineToCreate.MachineType.Id")%>
        </p>
        <p>
            <%= this.TextBox(c => c.ValueCoins).Label("Valor Moneda:") %>
            <%= this.ValidationMessage(c => c.ValueCoins) %>
        </p>
        <p>
            <%= this.TextBox(c => c.StartControlNumber).Label("Número de Inicio:") %>
            <%= this.ValidationMessage(c => c.StartControlNumber) %>
        </p>
        <p>
            <label>&nbsp;</label>
            <input type="submit" value="Crear" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
    <%= Html.ClientSideValidation<TheBookies.Model.Machine>(HtmlNamePrefix)%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script type="text/javascript" src="/Content/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/Content/js/xVal.jquery.validate.js"></script>
</asp:Content>
