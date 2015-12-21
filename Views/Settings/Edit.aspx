<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<Gambling.Models.ViewModels.General.SettingsViewModel>" %>

<%@ Import Namespace="TheBookies.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Configuración general
    <%  HtmlNamePrefix = "SettingsViewModel"; %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">

    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Configuración general
    </h2>
    <%= Html.ValidationSummary("Edición fallida. por favor corrije los errores e intenta de nuevo") %>
    <% using( Html.BeginForm( ) )
       {%>

    <% if( ViewData.Contains( "StatusMessage" ) )
        {%>
    <div class="ui-state-highlight ui-corner-all">
        <p class="statusMessage"><%=ViewData["StatusMessage"]%></p>
    </div>
    <br/>
    <%  }%>

    <fieldset>
        <%= this.Hidden( PageModel => PageModel.Id ) %>
        <p>
            <%= this.TextBox( PageModel => PageModel.LotteryVoidMinutesThreshold ).Label( "Permitir anular hasta " ).LabelAfter( " minutos despues de la venta." ).Class("short")%>
            <%= this.ValidationMessage( PageModel => PageModel.LotteryVoidMinutesThreshold )%>
        </p>
        <p>
            <%= this.CheckBox( PageModel => PageModel.BlockTxnTraffic ).Label( "Bloquear todas las transacciones?" )%>
            <%= this.ValidationMessage( PageModel => PageModel.BlockTxnTraffic )%>
        </p>
        <p>
            <input type="submit" value="Guardar" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%= Html.ClientSideValidation<Settings>( HtmlNamePrefix )%>
    </div>
</asp:Content>
