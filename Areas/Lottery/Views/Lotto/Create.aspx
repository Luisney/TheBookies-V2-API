<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<TheBookies.Model.Lottery>" %>

<%@ Import Namespace="Gambling.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Loterías - Crear Lotería
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "lottoToCreate";  %>
    <h2>
        Crear Lotería</h2>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Información General</legend>
        <p>
            <label for="uploadify">
                Logo:</label>
            <%= Html.Hidden("LogoURL") %>
            <img width="103" height="90" alt="Logo Lotería" src="" id="logo-img" />
            <input id="fileInput" name="fileInput" type="file" />
        </p>
        <div id="fileQueue">
        </div>
        <p>
            <%= this.TextBox(c => c.Name).Label("Nombre:") %>
            &nbsp;<%= this.ValidationMessage(c => c.Name) %>
        </p>
        <p>
            <%= this.TextBox(c => c.PrintName).Label("Desplegado en ticket:") %>
            &nbsp;<%= this.ValidationMessage(c => c.PrintName) %>
        </p>
        <p>
            <%= this.TextBox(c => c.DisplayName).Label("Desplegado en pantalla:") %>
            &nbsp;<%= this.ValidationMessage(c => c.DisplayName) %>
        </p>
        <p>
            <%= this.TextBox(PageModel => PageModel.DigitsPerPrize).Label("Digitos por premio:") %>
            <%= this.ValidationMessage( PageModel => PageModel.DigitsPerPrize )%>
        </p>
        <p>
            <%= this.TextBox(PageModel => PageModel.PrizesNumber).Label("Numero de premios:") %>
            <%= this.ValidationMessage( PageModel => PageModel.PrizesNumber )%>
        </p>
    </fieldset>
    <fieldset>
        <legend>Horas de Cierre</legend>
        <p>
            <%= this.CheckBox(c => c.Sun).Label("Domingo:") %>
            <%= Html.TimeSelector("Sunday") %>
            <%= this.ValidationMessage(c => c.Sun) %>
        </p>
        <p>
            <%= this.CheckBox(c => c.Mon).Label("Lunes:") %>
            <%= Html.TimeSelector("Monday") %>
            <%= this.ValidationMessage(c => c.Mon) %>
        </p>
        <p>
            <%= this.CheckBox(c => c.Tue).Label("Martes:") %>
            <%= Html.TimeSelector("Tuesday") %>
            <%= this.ValidationMessage(c => c.Tue) %>
        </p>
        <p>
            <%= this.CheckBox(c => c.Wed).Label("Miércoles:")%>
            <%= Html.TimeSelector("Wednesday") %>
            <%= this.ValidationMessage(c => c.Wed) %>
        </p>
        <p>
            <%= this.CheckBox(c => c.Thu).Label("Jueves:") %>
            <%= Html.TimeSelector("Thursday") %>
            <%= this.ValidationMessage(c => c.Thu) %>
        </p>
        <p>
            <%= this.CheckBox(c => c.Fri).Label("Viernes:") %>
            <%= Html.TimeSelector("Friday") %>
            <%= this.ValidationMessage(c => c.Fri) %>
        </p>
        <p>
            <%= this.CheckBox(c => c.Sat).Label("Sábado:")%>
            <%= Html.TimeSelector("Saturday") %>
            <%= this.ValidationMessage(c => c.Sat) %>
        </p>
    </fieldset>
    <p>
        <label>
            &nbsp;</label>
        <input type="submit" value="Crear" />
    </p>
    <% } %>
    <div>
        <a class="navPrev" href="<%= Url.Action("Index") %>">Volver al listado</a>
    </div>
    <%= Html.ClientSideValidation<TheBookies.Model.Lottery>(HtmlNamePrefix) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <link rel="Stylesheet" type="text/css" href="/Content/CSS/uploadify.css" />
    <link rel="Stylesheet" type="text/css" href="/Content/CSS/token-input.css" />

    <script type="text/javascript" src="/Content/js/swfobject.js"></script>

    <script type="text/javascript" src="/Content/js/jquery.uploadify.v2.1.0.min.js"></script>

    <script type="text/javascript" src="/Content/js/utils.upload.js"></script>

    <script type="text/javascript" src="/Content/js/jquery.validate.js"></script>

    <script type="text/javascript" src="/Content/js/xVal.jquery.validate.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            InitUploadUtil('#fileInput', '#LogoURL', '#logo-img');
        });
    </script>

</asp:Content>
