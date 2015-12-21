<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Gambling.Models.Terminal>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Terminales - Eliminar Terminal
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%if( this.ViewData [ "ErrorMsg" ] == null )
      { %>
    <h2>
        Eliminar Terminal
    </h2>
    <p>
        &iquest;Desea eliminar el registro?
    </p>
    <p>
        C�digo:
        <%= Model.Id%><br />
        Mac:
        <%= Model.Mac%>
    </p>
    <br />
    <% using( Html.BeginForm( ) )
       {
    %>
    <input type="submit" value="Eliminar" />
    <% } %>
    <br />
    <div>
        <%=Html.ActionLink( "Volver al listado", "Index", new { }, new { @class = "navPrev" } )%>
    </div>
    <%
        }
      else
      {
          Response.Write( "<h2>" );
          Response.Write( ViewData [ "ErrorMsg" ] );
          Response.Write( "</h2><br/>" );
          Response.Write( Html.ActionLink( "Volver al listado", "Index", new
          {
          }, new
          {
              @class = "navPrev"
          } ) );
      } %>
</asp:Content>
