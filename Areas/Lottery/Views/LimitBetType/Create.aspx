<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<Gambling.Models.ViewModels.Lottery.LimitBetTypeProfileCreateViewModel>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">

    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= Html.Encode( "Perfil de Limites - Crear Perfil" )%>
    <% htmlNamePrefix = "LimitBetTypeProfile"; %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Html.Encode( "Perfil de Limites - Crear Perfil" )%>
    </h2>
    <%= Html.ValidationSummary("Creación fallida. por favor corrije los errores e intenta de nuevo") %>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Campos</legend>
        <p>
            <%= this.TextBox( model => model.Profile ).Label( "Nombre:" ) %>
            <%= this.ValidationMessage(model => model.Profile) %>
        </p>
        <p>
            <input type="submit" value="Crear" />
        </p>
    </fieldset>
    <% } %>
    <%= Html.ClientSideValidation<TheBookies.Model.LimitBetTypeProfile>( htmlNamePrefix )%>
    <div>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
</asp:Content>
