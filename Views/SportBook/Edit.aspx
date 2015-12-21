<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<SportBook>" %>

<%@ Import Namespace="Gambling.Models" %>

<%@ Import Namespace="Gambling.Helpers" %>
<asp:Content ID="Assets" ContentPlaceHolderID="Assets" runat="server">
    <%= Html.GetPackage( AssetPackage.JqValidate )%>
    <%= Html.GetPackage( AssetPackage.JqCascadeSelect )%>

    <script src="/Content/js/SportBookTicketType/sportbooktickettype.common.js" type="text/javascript"></script>

    <script type="text/javascript">
        var ControllerActions = {
            FilterRouteByCompany: '<%= Url.Action("FilterRouteByCompany", "SportBook") %>/',
            FilterStoringCenterByCompany: '<%= Url.Action("FilterByCompany", "StoringCenter") %>/',
            GetTicketLimitTotalsByDivision: '<%= Url.Action("GetTicketLimitTotalsByDivision", "SportBook") %>/'
        };

        $(document).ready(function() {
            $('#CompanyId').cascade({
                source: ControllerActions.FilterRouteByCompany,
                cascaded: "RouteId",
                dependentNothingFoundLabel: "No hay elementos",
                dependentStartingLabel: "Selecciona una",
                dependentLoadingLabel: "Cargando opciones"
            });
            
            $('#CompanyId').cascade({
                source: ControllerActions.FilterStoringCenterByCompany,
                cascaded: "StoringCenterId",
                dependentNothingFoundLabel: "No hay elementos",
                dependentStartingLabel: "Selecciona una",
                dependentLoadingLabel: "Cargando opciones"
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Bancas - Editar Banca
    <% HtmlNamePrefix = "SportBookToEdit"; %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Editar Banca</h2>
    <%= Html.ValidationSummary("Edición fallida. por favor corrije los errores e intenta de nuevo.")%>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Información General</legend>
        <%= this.Hidden(PageModel => PageModel.Id) %>
        <p>
            <%= this.Select("StatusId").Options((SelectList) ViewData["StatusId"]).Selected(((SelectList) ViewData["StatusId"]).SelectedValue).Label("Estado:") %>
            <%= this.ValidationMessage(PageModel => PageModel.Status ) %>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.SportBookId ).Disabled( true ).Label( "ID:" ) %>
            <%= this.Hidden( PageModel => PageModel.SportBookId ) %>
            <%= this.ValidationMessage( PageModel => PageModel.SportBookId ) %>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.Name ).Label("Nombre:") %>
            <%= this.ValidationMessage( PageModel => PageModel.Name ) %>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.Address ).Label( "Dirección:" )%>
            <%= this.ValidationMessage(PageModel => PageModel.Address) %>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.Phone ).Label( "Teléfono:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.Phone )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.Contact ).Label( "Contacto:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.Contact )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.Email ).Label( "Correo electronico:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.Email )%>
        </p>
        <p>
            <%= this.Select("CommissionProfileId")
                    .Options( ( SelectList ) ViewData [ "CommissionProfileId" ] )
                    .Selected( ( ( SelectList ) ViewData [ "CommissionProfileId" ] ).SelectedValue )
                                    .FirstOption( "null", "-Heredado-" )
                    .Label( "Perfil de comisión:" )%>
            <%= this.ValidationMessage(PageModel => PageModel.CommissionProfile )%>
        </p>
        <p>
            <%= this.Select("ValuePaymentProfileId")
                    .Options( ( SelectList ) ViewData [ "ValuePaymentProfileId" ] )
                    .Selected( ( ( SelectList ) ViewData [ "ValuePaymentProfileId" ] ).SelectedValue )
                                    .FirstOption( "null", "-Heredado-" )
                    .Label( "Perfil de valores a pagar:" )%>
            <%= this.ValidationMessage(PageModel => PageModel.ValuePaymentProfile )%>
        </p>
        <p>
            <%= this.Select( "LimitBetTypeProfileId" )
                                    .Options( ( SelectList ) ViewData [ "LimitBetTypeProfileId" ] )
                                    .Selected( ( ( SelectList ) ViewData [ "LimitBetTypeProfileId" ] ).SelectedValue )
                    .FirstOption( "null", "-Heredado-" )
                    .Label( "Perfil de limites:" )%>
            <%= this.ValidationMessage(PageModel => PageModel.LimitBetTypeProfile )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.Maximum ).Label( "Máximo de ventas Deportivas:" ).Value( Model.Maximum.ToString( "F2" ) )%>
            <%= this.ValidationMessage( PageModel => PageModel.Maximum )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.LottoMaximum ).Label( "Máximo de ventas Loteria:" ).Value( ( Model.LottoMaximum ?? 0 ).ToString( "F2" ) )%>
            <%= this.ValidationMessage( PageModel => PageModel.LottoMaximum )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.LottoExchangeUnit ).Label( "Valor de un chele:" ).Value( Model.LottoExchangeUnit.ToString( "F2" ) )%>
            <%= this.ValidationMessage( PageModel => PageModel.LottoExchangeUnit )%>
        </p>
        <p>
            <%= this.Select( "CompanyId" )
                .Options( ( SelectList ) ViewData [ "CompanyId" ] )
                .Selected( ( ( SelectList ) ViewData [ "CompanyId" ] ).SelectedValue ).Label( "Consorcio:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.Company )%>
        </p>
        <p>
            <%= this.Select("StoringCenterId")
                    .Options( ( SelectList ) ViewData [ "StoringCenterId" ] )
                    .Selected( ( ( SelectList ) ViewData [ "StoringCenterId" ] ).SelectedValue ).Label( "Centro de acopio:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.StoringCenter )%>
        </p>
        <p>
            <%= this.Select( "RouteId" )
                .Options( ( SelectList ) ViewData [ "RouteId" ] )
                .Selected( ( ( SelectList ) ViewData [ "RouteId" ] ).SelectedValue ).Label( "Ruta:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.Route )%>
        </p>
        <%= Html.Hidden("TicketTypes")%>
    </fieldset>
    <h3>
        Límites jugadas para deportivas</h3>
    <table>
        <tr>
            <td>
                Tipo de Ticket:
            </td>
            <td>
                <%= this.Select("TicketType").Options((SelectList)ViewData["TicketType"]).FirstOption("Seleccione un tipo de jugada") %>
            </td>
        </tr>
        <tr>
            <td>
                Venta Mínima:
            </td>
            <td>
                <%= Html.TextBox("minimumLimit")%>
            </td>
        </tr>
        <tr>
            <td>
                Venta Máxima:
            </td>
            <td>
                <%= Html.TextBox("maximumLimit")%>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <a id="AddNumber" class="LinkAdd" href="#">Agregar</a>
            </td>
        </tr>
    </table>
    <br />
    <table class="dataTable" id="TicketTypeLimits">
    </table>
    <p>
        <label>
            &nbsp;</label>
        <input type="submit" value="Guardar" />
    </p>
    <% } %>
    <div>
        <%= Html.ClientSideValidation<SportBook>( HtmlNamePrefix ) %>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
</asp:Content>
