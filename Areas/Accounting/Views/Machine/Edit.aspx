<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<TheBookies.Model.Machine>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    M�quinas Traga Moneda - Editar M�quinas Traga Moneda
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "machineToEdit";  %>
    <h2>Editar M�quina Traga Moneda</h2>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Informaci�n General</legend>
        <p>
            <%= this.TextBox(c => c.MachineCode).Label("C�digo:") %>
            <%= this.ValidationMessage(c => c.MachineCode) %>
        </p>
        <p>
            <label>Banca:</label>
            <%= Html.DropDownList("machineToEdit.SportBookId")%>
        </p>
        <p>
            <label>Tipo M�quina:</label>
            <%= Html.DropDownList("machineToEdit.MachineType.Id")%>
        </p>
        <p>
            <%= this.TextBox(c => c.ValueCoins).Value(Model.ValueCoins.ToString("F2")).Label("Valor Moneda:") %>
            <%= this.ValidationMessage(c => c.ValueCoins) %>
        </p>
        <p>
            <%= this.TextBox(c => c.StartControlNumber).Label("N�mero de Inicio:") %>
            <%= this.ValidationMessage(c => c.StartControlNumber) %>
        </p>
        <p>
            <label>&nbsp;</label>
            <input type="submit" value="Guardar" />
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
