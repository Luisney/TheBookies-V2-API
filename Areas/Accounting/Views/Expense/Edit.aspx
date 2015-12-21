<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<Gambling.Models.ViewModels.Accounting.ExpenseViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gastos - Editar Gasto
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "expenseToEdit";  %>
    <h2>Editar Gasto</h2>    
    <% using (Html.BeginForm()) {%>
        <fieldset>
            <legend>Información General</legend>
            <p>
                <%= this.TextBox( c => c.Date ).Value(Model.Date.ToShortDateString()).Label("Fecha:") %>
                <%= this.ValidationMessage( c => c.Date ) %>
            </p>
            <p>
                 <label>Banca:</label>
                 <%= Html.DropDownList("expenseToEdit.SportBookId")%>
            </p>
            <p>
                <label>Cuentas:</label>
                <%= Html.DropDownList("expenseToEdit.ExpenseCode")%>
            </p>
            <p>
                <%= this.TextBox(c => c.Expense.Amount).Value(Model.Expense.Amount.ToString("F2")).Label("Monto:") %>
                <%= this.ValidationMessage(c => c.Expense.Amount) %>
            </p>
            <p>
                <%= this.TextArea(c => c.Expense.Detail).Label("Detalle:")%>
                <%= this.ValidationMessage(c => c.Expense.Detail) %>
            </p>
            <p>
                <label>Gasto Común:</label>
                <%= this.CheckBox(c => c.Expense.IsCommon) %>
            </p>
            <p>
                <label>Recurrente:</label>
                <%= this.CheckBox(c => c.Expense.IsAppellants) %>
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
    <%= Html.ClientSideValidation<TheBookies.Model.ExpenseDetail>(HtmlNamePrefix + ".Expense")%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>
    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $("#expenseToEdit_Date").datepicker({
                dateFormat: 'dd/mm/yy'
            });
        });
    </script>
</asp:Content>

