<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<TheBookies.Model.RestrictedNumber>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <% HtmlNamePrefix = "RestrictedNumberToEdit"; %>
    <link href="/Content/CSS/table.css" rel="stylesheet" type="text/css" />

    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/RestrictedNumber/restrictednumber.common.js" type="text/javascript"></script>

    <script type="text/javascript">
        var ControllerActions = {
            FilterSportBooksByStoringCenter: '<%= Url.Action("GetSportBooksByStoringCenter", "SportBook", new { @area = "root" }, null) %>/',
            FilterTerminalsBySportBook: '<%= Url.Action("GetTerminalsBySportBook", "Terminal", new { @area = "root" }, null ) %>/'
        };
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Números Restringidos - Editar Número Restringido
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Editar Número Restringido</h2>
    <% using( Html.BeginForm( ) )
       {%>
    <h3>
        Información General</h3>
    <fieldset>
        <%= this.Hidden(PageModel => PageModel.Id) %>
        <%= this.Hidden(PageModel => PageModel.Status) %>
        <p>
            <%= this.TextBox(PageModel => PageModel.Date.ToShortDateString()).Label("Fecha inicial:").Attr("class", "calendar") %>
            <%= this.ValidationMessage(PageModel => PageModel.Date) %>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.FinalDate.ToShortDateString( ) ).Label( "Fecha final:" ).Attr( "class", "calendar" )%>
            <%= this.ValidationMessage(PageModel => PageModel.FinalDate) %>
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
            <%= this.ValidationMessage(PageModel => PageModel.Numbers) %>
        </p>
        <p>
            <%= this.CheckBox(PageModel => PageModel.ActionToTake).Label("Limita Apuestas:") %>
            <%= this.ValidationMessage(PageModel => PageModel.ActionToTake) %>
        </p>
        <%= Html.Hidden("numbers") %>
    </fieldset>
    <br />
    <h3>
        <%= Html.Encode("Este número restringido aplica a las siguientes loterias:") %> </h3>
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
                <%= this.Select( "TerminalId" ).Options( new Dictionary<string, string> { { "0", "Todas las terminales" } } )%>
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
        <input type="submit" value="Guardar" />
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
