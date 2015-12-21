<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Gambling.Models.Company>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= Html.Encode( "Consorcios - Detalles de Consorcio" )%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Html.Encode( "Detalles de Consorcio" )%>
    </h2>
    <fieldset>
        <legend>Campos</legend>
        <p>
            Nombre:
            <%= Html.Encode(Model.Name) %>
        </p>
        <p>
            <%= Html.Encode( "Dirección:" ) + Html.Encode(Model.Address) %>
        </p>
        <p>
            <%= Html.Encode("Teléfono:") + Html.Encode(Model.Phone) %>
        </p>
        <p>
            Correo electronico:
            <%= Html.Encode(Model.Email) %>
        </p>
        <p>
            Rnc:
            <%= Html.Encode(Model.Rnc) %>
        </p>
        <p>
            Gerente:
            <%= Html.Encode(Model.Manager) %>
        </p>
        <p>
            Presidente:
            <%= Html.Encode(Model.Ceo) %>
        </p>
        <p>
            <%= Html.Encode( "Máximo disponible:" ) + Html.Encode(String.Format("{0:F}", Model.Maximum)) %>
        </p>
        <p>
            Porcentaje:
            <%= Html.Encode(String.Format("{0:F}", Model.Percentage)) %>
        </p>
    </fieldset>
    <p>
        <%=Html.ActionLink( "Editar", "Edit", new { Code = Model.Id } )%>
        |
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </p>
</asp:Content>
