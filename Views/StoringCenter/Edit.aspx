<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<StoringCenter>" %>

<%@ Import Namespace="Gambling.Models" %>
<%@ Import Namespace="Gambling.Helpers" %>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">

    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>

    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            LoadCloseTime();
        });

        function LoadCloseTime() {
            SetTime("OpenTime", '<%= Model.OpenTime %>');
            SetTime("CloseTime", '<%= Model.CloseTime %>');
        }

        function SetTime(day, time) {
            var closeTime = time;
            var timeArray = closeTime.split(':');
            if (timeArray.length == 3) {
                //Evaluating time
                var meridian = (timeArray[0] > 12) ? 'PM' : 'AM';
                var hour = (timeArray[0] > 12) ? '0' + (timeArray[0] - 12) : (timeArray[0] == '00') ? 12 : timeArray[0];
                var minutes = timeArray[1];

                //Seleting the current close time for the lotto                
                $("select[name='" + day + "_Hours']").val(hour);
                $("select[name='" + day + "_Minutes']").val(minutes);
                $("select[name='" + day + "_Meridian']").val(meridian);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Centros de Acopio
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Editar Centro de Acopio
    </h2>
    <%= Html.ValidationSummary("Edición fallida. por favor corrije los errores e intenta de nuevo.")%>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Información General</legend>
        <%= this.Hidden( model => model.Id ) %>
        <%= this.Hidden( model => model.Status ) %>
        <p>
            <label for="ID">
                ID:</label>
            <%= Html.TextBox( "StoringCenterId", Model.StoringCenterId, new Dictionary<string, object> { { "disabled", "disabled" } } )%>
            <%= Html.Hidden("StoringCenterId") %>
            <%= Html.ValidationMessage( "StoringCenterId", "*" )%>
        </p>
        <p>
            <label for="Name">
                Nombre:</label>
            <%= Html.TextBox( "Name", Model.Name, new Dictionary<string, object> { { "disabled", "disabled" } } )%>
            <%= Html.Hidden("Name") %>
            <%= Html.ValidationMessage("Name", "*") %>
        </p>
        <p>
            <label for="Address">
                <%= Html.Encode("Dirección:") %></label>
            <%= Html.TextBox("Address", Model.Address) %>
            <%= Html.ValidationMessage("Address", "*") %>
        </p>
        <p>
            <label for="Phone">
                <%= Html.Encode("Teléfono:") %></label>
            <%= Html.TextBox("Phone", Model.Phone) %>
            <%= Html.ValidationMessage("Phone", "*") %>
        </p>
        <p>
            <label for="Contact">
                Contacto:</label>
            <%= Html.TextBox("Contact", Model.Contact) %>
            <%= Html.ValidationMessage("Contact", "*") %>
        </p>
        <p>
            <label for="Email">
                Correo electronico:</label>
            <%= Html.TextBox("Email", Model.Email) %>
            <%= Html.ValidationMessage("Email", "*") %>
        </p>
        <p>
            <label for="OpenTime">
                Hora de apertura:</label>
            <%= Html.TimeSelector("OpenTime") %>
            <%= Html.ValidationMessage("OpenTime", "*") %>
        </p>
        <p>
            <label for="CloseTime">
                Hora de cierre:</label>
            <%= Html.TimeSelector("CloseTime")%>
            <%= Html.ValidationMessage("CloseTime", "*") %>
        </p>
        <p>
            <label for="CommissionProfile">
                Perfil de comisión:</label>
            <%= Html.DropDownList("CommissionProfileId") %>
            <%= Html.ValidationMessage( "CommissionProfileId", "*" )%>
        </p>
        <p>
            <label for="ValuePaymentProfile">
                Perfil de valores a pagar:</label>
            <%= Html.DropDownList("ValuePaymentProfileId") %>
            <%= Html.ValidationMessage( "ValuePaymentProfileId", "*" )%>
        </p>
        <p>
            <label for="LimitBetTypeProfile">Perfil de limites:</label>
            <%= Html.DropDownList( "LimitBetTypeProfileId" )%>
            <%= Html.ValidationMessage( "LimitBetTypeProfileId", "*" )%>
        </p>
        <p>
            <label for="Company">
                Consorcio:</label>
            <%= Html.DropDownList("CompanyId") %>
            <%= Html.ValidationMessage("CompanyId", "*")%>
        </p>
        <p>
            <label>
                &nbsp;</label>
            <input type="submit" value="Guardar" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%= Html.ClientSideValidation<StoringCenter>( )%>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
</asp:Content>
