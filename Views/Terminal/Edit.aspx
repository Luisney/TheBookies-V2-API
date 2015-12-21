<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<Gambling.ViewModels.TerminalViewModel>" %>

<%@ Import Namespace="Gambling.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Terminales - Editar Terminal
    <%  HtmlNamePrefix = "TerminalViewModel"; %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">

    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/jquery.cascade-select.0.8.js" type="text/javascript"></script>

    <script type="text/javascript">
        var ControllerActions = {
            JsonSearch: '<%= Url.Action("JsonSearch") %>/',
            JsonDelete: '<%= Url.Action("JsonDelete") %>/',
            Edit: '<%= Url.Action("Edit") %>/',
            FilterSportBooksByCompany: '<%= Url.Action("FilterByCompany", "SportBook") %>',
            FilterStoringCenterByCompany: '<%= Url.Action("FilterByCompany", "StoringCenter") %>/',
            FilterTerminalModelByMaker: '<%= Url.Action("FilterModelByMaker", "Terminal") %>/'
        }
    </script>

    <script type="text/javascript" language="javascript">
        $(document).ready(function() {
            var companyIdSelector = '#<%= this.IdFor( PageModel => PageModel.CompanyId ) %>';
            var sportBookId = '<%= this.IdFor( PageModel => PageModel.SportBookId ) %>';
            var storingCenterId = '<%= this.IdFor( PageModel => PageModel.StoringCenterId ) %>';
            var terminalMakerIdSelector = '#<%= this.IdFor( PageModel => PageModel.TerminalMakerId ) %>';
            var terminalModelId = '<%= this.IdFor( PageModel => PageModel.TerminalModelId ) %>';

            $(companyIdSelector).cascade({
                source: ControllerActions.FilterSportBooksByCompany,
                cascaded: sportBookId,
                dependentNothingFoundLabel: "No hay elementos",
                dependentStartingLabel: "Selecciona una",
                dependentLoadingLabel: "Cargando opciones"
            });

            $(companyIdSelector).cascade({
                source: ControllerActions.FilterStoringCenterByCompany,
                cascaded: storingCenterId,
                dependentNothingFoundLabel: "No hay elementos",
                dependentStartingLabel: "Selecciona una",
                dependentLoadingLabel: "Cargando opciones"
            });

            $(terminalMakerIdSelector).cascade({
                source: ControllerActions.FilterTerminalModelByMaker,
                cascaded: terminalModelId,
                dependentNothingFoundLabel: "No hay elementos",
                dependentStartingLabel: "Selecciona una",
                dependentLoadingLabel: "Cargando opciones"
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Editar Terminal
    </h2>
    <%= Html.ValidationSummary("Edición fallida. por favor corrije los errores e intenta de nuevo") %>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Campos</legend>
        <p>
            <%= this.Select( PageModel => PageModel.Status ).Options( Model.TerminalStatusList ).Label( "Estado:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.Status )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.TerminalId ).Disabled( true ).Label( "Terminal ID:" )%>
            <%= this.Hidden( PageModel => PageModel.TerminalId )%>
            <%= this.ValidationMessage( PageModel => PageModel.TerminalId )%>
        </p>
        <p>
            <%= this.TextBox(PageModel => PageModel.Mac).Label("Coban:") %>
            <%= this.ValidationMessage(PageModel => PageModel.Mac) %>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.Serial ).Disabled( true ).Label( "Serial:" )%>
            <%= this.Hidden( PageModel => PageModel.Serial )%>
            <%= this.ValidationMessage(PageModel => PageModel.Serial) %>
        </p>
        <p>
            <%= this.Select( PageModel => PageModel.CompanyId ).Options( Model.CompanyList ).Label( "Consorcio:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.CompanyId )%>
        </p>
        <p>
            <%= this.Select( PageModel => PageModel.SportBookId ).Options( Model.SportBookList ).Label( "Banca:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.SportBookId )%>
        </p>
        <p>
            <%= this.Select( PageModel => PageModel.StoringCenterId ).Options( Model.StoringCenterList ).Label( "Centro de acopio:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.StoringCenterId )%>
        </p>
        <p>
            <%= this.Select( PageModel => PageModel.TerminalMakerId ).Options( Model.TerminalMakerList ).Label( "Fabricante:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.TerminalMakerId )%>
        </p>
        <p>
            <%= this.Select( PageModel => PageModel.TerminalModelId ).Options( Model.TerminalModelList ).Label( "Modelo:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.TerminalModelId )%>
        </p>
        <p>
            <%= this.Select( PageModel => PageModel.CommissionProfileId ).Options( Model.CommissionProfileList ).Label( "Perfil de comisiones:" ).FirstOption( "", "-Heredado-" )%>
            <%= this.ValidationMessage( PageModel => PageModel.CommissionProfileId )%>
        </p>
        <p>
            <%= this.Select( PageModel => PageModel.ValuePaymentProfileId ).Options( Model.ValuePaymentProfileList ).Label( "Perfil de valores a pagar:" ).FirstOption( "", "-Heredado-" )%>
            <%= this.ValidationMessage( PageModel => PageModel.ValuePaymentProfileId )%>
        </p>
         <p>
            <%= this.Select( PageModel => PageModel.LimitBetTypeProfileId ).Options( Model.LimitBetTypeProfileList ).Label( "Perfil de limites:" ).FirstOption( "", "-Heredado-" )%>
            <%= this.ValidationMessage( PageModel => PageModel.LimitBetTypeProfileId )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.Maximum ).Label( "Máximo de ventas deportivas:" )%>
            <%= this.ValidationMessage(PageModel => PageModel.Maximum) %>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.LottoMaximum ).Label( "Máximo de ventas loteria:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.LottoMaximum )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.LottoMaximumOffLine ).Label( "Máximo loteria fuera de linea:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.LottoMaximumOffLine )%>
        </p>
        <p>
            <%= this.CheckBox( PageModel => PageModel.UseDetailedReport ).Label( "Usar reportes detallados:" ).Attr( "title", "Activar para utilizar reportes mas detallados (se consume más papel)" ).Attr( "class", "jqtooltipWE" )%>
            <%= this.ValidationMessage( PageModel => PageModel.UseDetailedReport )%>
        </p>
        <p>
            <%= this.CheckBox( PageModel => PageModel.IsIndependent ).Label( "Esta terminal pertenece a un rifero:" ).Attr( "title", "Activar para mostrar la informacion del rifero en la terminal en lugar de la del consorcio" ).Attr( "class", "jqtooltipWE" )%>
            <%= this.ValidationMessage( PageModel => PageModel.IsIndependent )%>
        </p>
        <p>
            <%= this.CheckBox( PageModel => PageModel.ShowReceiptLogo ).Label( "Mostrar logo:" ).Attr( "title", "Activar para mostrar el logo del consorcio en el recibo" ).Attr( "class", "jqtooltipWE" )%>
            <%= this.ValidationMessage( PageModel => PageModel.ShowReceiptLogo )%>
        </p>
        <p>
            <input type="submit" value="Guardar" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%= Html.ClientSideValidation<Terminal>( HtmlNamePrefix )%>
        <%=Html.ActionLink("Volver al listado", "Index", new {}, new { @class = "navPrev" } ) %>
    </div>
</asp:Content>
