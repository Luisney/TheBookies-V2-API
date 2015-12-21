<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<StoringCenter>" %>
<%@ Import Namespace="Gambling.Models" %>
<%@ Import Namespace="Gambling.Helpers" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>
    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Centros de Acopio
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Crear Centro de Acopio</h2>
    <%= Html.ValidationSummary("Creación fallida. por favor corrije los errores e intenta de nuevo") %>
    <% using( Html.BeginForm())
       {%>
    <fieldset>
        <legend>Campos</legend>
        <p>
            <label for="ID">ID:</label>
            <%= Html.TextBox("StoringCenterId") %>
            <%= Html.ValidationMessage( "StoringCenterId", "*" )%>
        </p>
        <p>
            <label for="Name">Nombre:</label>
            <%= Html.TextBox("Name") %>
            <%= Html.ValidationMessage("Name", "*") %>
        </p>
        <p>
            <label for="Address"><%= Html.Encode("Dirección:")%></label>
            <%= Html.TextBox("Address") %>
            <%= Html.ValidationMessage("Address", "*") %>
        </p>
        <p>
            <label for="Phone"><%= Html.Encode("Teléfono:")%></label>
            <%= Html.TextBox("Phone") %>
            <%= Html.ValidationMessage("Phone", "*") %>
        </p>
        <p>
            <label for="Contact">Contacto:</label>
            <%= Html.TextBox("Contact") %>
            <%= Html.ValidationMessage("Contact", "*") %>
        </p>
        <p>
            <label for="Email">Correo electronico:</label>
            <%= Html.TextBox("Email") %>
            <%= Html.ValidationMessage("Email", "*") %>
        </p>
        <p>
            <label for="OpenTime">Hora de apertura:</label>            
            <%= Html.TimeSelector("OpenTime") %>
            <%= Html.ValidationMessage("OpenTime", "*") %>
        </p>
        <p>
            <label for="CloseTime">Hora de cierre:</label>            
            <%= Html.TimeSelector("CloseTime")%>
            <%= Html.ValidationMessage("CloseTime", "*") %>
        </p>
        <p>
            <label for="CommissionProfile">Perfil de comisión:</label>
            <%= Html.DropDownList("CommissionProfileId") %>
            <%= Html.ValidationMessage( "CommissionProfileId", "*" )%>
        </p>
        <p>
            <label for="ValuePaymentProfile">Perfil de valores a pagar:</label>
            <%= Html.DropDownList("ValuePaymentProfileId") %>
            <%= Html.ValidationMessage( "ValuePaymentProfileId", "*" )%>
        </p>
        <p>
            <label for="LimitBetTypeProfile">Perfil de limites:</label>
            <%= Html.DropDownList( "LimitBetTypeProfileId" )%>
            <%= Html.ValidationMessage( "LimitBetTypeProfileId", "*" )%>
        </p>
        <p>
            <label for="Company">Consorcio:</label>
            <%= Html.DropDownList("CompanyId") %>
            <%= Html.ValidationMessage("CompanyId", "*")%>
        </p>
        <p>
            <label>&nbsp;</label>
            <input type="submit" value="Crear" />
        </p>
    </fieldset>
    <% } %>
    <p>
        <%= Html.ClientSideValidation<StoringCenter>()%>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </p>
</asp:Content>
