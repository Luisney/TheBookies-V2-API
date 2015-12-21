<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<TheBookies.Model.Surplus>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Botes - Crear Bote
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "surplusToCreate"; %>
    <h2>Crear Bote</h2>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <legend>Informaci�n General</legend>
        <p>
            <%= this.TextBox(model => model.LottoDate).Value(DateTime.Now.ToShortDateString()).Label("Fecha:") %>
            <%= this.ValidationMessage(model => model.LottoDate) %>
        </p>
        <p>
            <label>Consorcio:</label>
            <%= Html.DropDownList("surplusToCreate.PartnershipId")%>
        </p>
        <p>
            <%= this.TextBox(model => model.Order).Label("Orden:") %>
            <%= this.ValidationMessage(model => model.Order) %>
        </p>
        <p>
            <%= this.TextBox(model => model.Maximum.ToString("F2")).Label("Monto M�ximo:")%>
            <%= this.ValidationMessage(model => model.Maximum) %>
        </p>
        <p>
            <label>&nbsp;</label>
            <input type="submit" value="Crear" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%=Html.ClientSideValidation<TheBookies.Model.Surplus>(HtmlNamePrefix)%>
        <%=Html.ActionLink("Volver al listado", "Index", new {}, new { @class = "navPrev" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <script type="text/javascript" src="/Content/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/Content/js/xVal.jquery.validate.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#surplusToCreate_LottoDate").datepicker({
                dateFormat: 'dd/mm/yy'
            });
        });
    </script>
</asp:Content>
