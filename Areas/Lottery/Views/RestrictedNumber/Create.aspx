<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<TheBookies.Model.RestrictedNumber>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <% HtmlNamePrefix = "RestrictedNumberToCreate"; %>
    <link href="/Content/CSS/table.css" rel="stylesheet" type="text/css" />

    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/RestrictedNumber/restrictednumber.common.js" type="text/javascript"></script>

    <script type="text/javascript">
        var ControllerActions = {
            FilterSportBooksByStoringCenter: '<%= Url.Action("GetSportBooksByStoringCenter", "SportBook", new { @area = "root" }, null) %>/',
            FilterTerminalsBySportBook: '<%= Url.Action("GetTerminalsBySportBook", "Terminal", new { @area = "root" }, null) %>/'
        };
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Números Restringidos - Crear Número Restringido
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Crear Número Restringido</h2>
    <% using( Html.BeginForm( ) )
       {%>
    <h3>
        Información General</h3>
    <fieldset>
        <p>
            <%= this.TextBox(c => c.Date).Value(DateTime.Now.ToShortDateString()).Label("Fecha inicial:").Attr("class", "calendar")%>
            <%= this.ValidationMessage(c => c.Date) %>
        </p>
        <p>
            <%= this.TextBox(c => c.FinalDate).Value(DateTime.Now.ToShortDateString()).Label("Fecha final:").Attr("class", "calendar")%>
            <%= this.ValidationMessage( c => c.FinalDate )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.MaxAmount ).Format("0.00").Label( "Monto máximo:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.MaxAmount )%>
        </p>
        <p>
            <label>
                Tipo de Apuesta:</label>
            <%= Html.DropDownList("BetTypeId") %>
        </p>
        <p>
            <label>
                Número:</label>
            <%= this.TextBox( PageModel => PageModel.Numbers ) %>
            <%= this.ValidationMessage(c => c.Numbers) %>
        </p>
        <p>
            <%= this.CheckBox(PageModel => PageModel.ActionToTake).Label("Limita Apuestas:") %>
            <%= this.ValidationMessage(c => c.ActionToTake) %>
        </p>
    </fieldset>
    <br />
    <h3>
        <%= Html.Encode( "Este número restringido aplica a las siguientes loterias:" )%>
    </h3>
    <%= this.Hidden("numbers")%>
    <table>
        <tr>
            <td>
                <%= Html.DropDownList("LottoId") %>
            </td>
            <td>
                <a id="AddNumber" class="LinkAdd" href="#">Agregar</a>
            </td>
        </tr>
    </table>
    <%= this.ValidationMessage( PageModel => PageModel.LottoId )%>
    <br />
    <table class="dataTable" id="RestrictedNumbers">
    </table>
    <br />
    <br />
    <h3>
        Este numero restringido aplica a:</h3>
    <%= this.Hidden( "associations" )%>
    <table>
        <tr>
            <td>
                <%= this.Select( "StoringCenterId" ).Options( ( Dictionary<string,string> ) ViewData["StoringCenterId"] ).FirstOption("0", "Todos los centros de acopio")%>
            </td>
            <td>
                <%= this.Select( "SportBookId" ).Options( new Dictionary<string,string>{ { "0", "Todas las bancas" } } )%>
            </td>
            <td>
                <%= this.Select( "TerminalId" ).Options( new Dictionary<string, string> { { "0", "Todas las bancas" } } )%>
            </td>
            <td>
                <a id="AddEntityRelationship" class="LinkAdd" href="#">Agregar</a>
            </td>
        </tr>
    </table>
    <br />
    <table class="dataTable" id="EntityAssociations">
    </table>
    <br />
    <p>
        <input type="submit" value="Crear" />
    </p>
    <% } %>
    <br />
    <br />
    <div>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
    <%= Html.ClientSideValidation<TheBookies.Model.RestrictedNumber>(HtmlNamePrefix)%>
    <div id="infoDialog" title="Info">
        <br />
        <p id="infoDialogMessage">
        </p>
    </div>
</asp:Content>
