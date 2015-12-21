<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Gambling.Helpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reportes - Listado Reportes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Reportes</h2>
    <%= Html.RenderReportsList("Detail","Report") %>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
</asp:Content>
