<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Gambling.Models.Company>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Consorcios - Eliminar Consorcio
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%if( ViewData [ "ErrorMsg" ] == null )
  { %>
    <h2>
        Eliminar Consorcio
    </h2>
    <p>
        &iquest;Desea eliminar el registro?
    </p>
    <p>
        C�digo:
        <%= Model.Id%><br />
        Nombre:
        <%= Model.Name%>
    </p>
    <% using( Html.BeginForm( ) )
       {
    %>
    <input type="submit" value="Eliminar" />
    <% } %>
    <div>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
<%
    }
    else
    {
        Response.Write( "<h2>" );
        Response.Write( ViewData [ "ErrorMsg" ] );
        Response.Write( "</h2>" );
        Response.Write( Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } ) );
    } %>
</asp:Content>
