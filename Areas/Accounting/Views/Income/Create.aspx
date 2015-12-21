<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<Gambling.Models.ViewModels.Accounting.IncomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ingresos - Crear Ingreso
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "incomeToCreate";  %>
    <h2>Crear Ingreso</h2>    
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Información General</legend>
        <p>
            <%= this.TextBox( c => c.Date ).Value(DateTime.Now.ToShortDateString()).Label("Fecha:") %>
            <%= this.ValidationMessage( c => c.Date ) %>
        </p>
        <p>
            <label>Banca:</label>
            <%= Html.DropDownList("incomeToCreate.SportBookId")%>
        </p>
        <p>
            <label>Cuenta:</label>
            <%= Html.DropDownList("incomeToCreate.IncomeCode")%>
        </p>
        <p>
            <%= this.TextBox( c => c.Income.Amount ).Label("Monto:") %>
            <%= this.ValidationMessage(c => c.Income.Amount)%>
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
    <%= Html.ClientSideValidation<TheBookies.Model.IncomeDetail>(HtmlNamePrefix + ".Income")%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>
    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $("#incomeToCreate_Date").datepicker({
                dateFormat: 'dd/mm/yy'
            });
        });
    </script>
</asp:Content>
