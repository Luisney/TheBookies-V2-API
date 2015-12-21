<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<Gambling.Models.ViewModels.Accounting.IncomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Ingresos - Editar Ingreso
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "incomeToEdit";  %>
    <h2>Editar Ingreso</h2>   
    <% using (Html.BeginForm()) {%>
        <fieldset>
            <legend>Información General</legend>
            <p>
                <%= this.TextBox( c => c.Date ).Value(Model.Date.ToShortDateString()).Label("Fecha:") %>
                <%= this.ValidationMessage( c => c.Date ) %>
            </p>
            <p>
                 <label>Banca:</label>
                 <%= Html.DropDownList("incomeToEdit.SportBookId")%>
            </p>
            <p>
                <label>Cuenta:</label>
                <%= Html.DropDownList("incomeToEdit.IncomeCode")%>
            </p>
            <p>
                <%= this.TextBox(c => c.Income.Amount).Value(Model.Income.Amount.ToString("F2")).Label("Monto:")%>
                <%= this.ValidationMessage(c => c.Income.Amount)%>
            </p>            
            <p>
                <input type="submit" value="Guardar" />
            </p>
        </fieldset>
    <% } %>    
    <div>
        <%= Html.ClientSideValidation<TheBookies.Model.IncomeDetail>(HtmlNamePrefix + ".Income")%>
		<%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>    
    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>        
    <script type="text/javascript">        
        $(function() {
            $("#incomeToEdit_Date").datepicker({
                dateFormat: 'dd/mm/yy'
            });            
        });
    </script>
</asp:Content>

