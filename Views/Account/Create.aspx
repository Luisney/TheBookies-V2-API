﻿<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<Gambling.ViewModels.AccountViewModel>" %>

<%@ Import Namespace="Gambling.Models" %>
<asp:Content ContentPlaceHolderID="Assets" ID="Content3" runat="server">
    <script src="/Content/js/jquery.validate.js" type="text/javascript"></script>
    <script src="/Content/js/xVal.jquery.validate.js" type="text/javascript"></script>
    <script src="/Content/js/jquery.cascade-select.0.8.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#tabs').tabs();

            $('#AccountViewModel_CompanyId').change(function () {
                // Deselect if 'none'
                if ($(this).val() == '0') {
                    $('#AccountViewModel_StoringCenterId').empty();
                    $('#AccountViewModel_StoringCenterId').append('<option value="0">Todos</option>');
                    $('#AccountViewModel_SportBookId').empty();
                    $('#AccountViewModel_SportBookId').append('<option value="0">Todas</option>');
                    $('#AccountViewModel_TerminalId').empty();
                    $('#AccountViewModel_TerminalId').append('<option value="0">Todas</option>');

                    return;
                }

                $('#AccountViewModel_StoringCenterId').empty();
                $('#AccountViewModel_StoringCenterId').append('<option value="0">Cargando...</option>');
                $('#AccountViewModel_SportBookId').empty();
                $('#AccountViewModel_SportBookId').append('<option value="0">Todas</option>');
                $('#AccountViewModel_TerminalId').empty();
                $('#AccountViewModel_TerminalId').append('<option value="0">Todas</option>');

                $.getJSON('<%=Url.Action("FilterByCompany", "StoringCenter", new { @area = "root" }, null)%>',
                    { selected: $('#AccountViewModel_CompanyId').val() },
                    function (data) {
                        $('#AccountViewModel_StoringCenterId').empty();
                        $('#AccountViewModel_StoringCenterId').append('<option value="0">Todos</option>');
                        if (data.length > 0) {
                            $.each(data, function (i, item) {
                                $('#AccountViewModel_StoringCenterId').append('<option value="' + item.value + '">' + item.label + '</option>');
                            });
                        }
                    }
                );
            });

            $('#AccountViewModel_StoringCenterId').change(function () {
                // Deselect if 'none'
                if ($(this).val() == '0') {
                    $('#AccountViewModel_SportBookId').empty();
                    $('#AccountViewModel_SportBookId').append('<option value="0">Todas</option>');
                    $('#AccountViewModel_TerminalId').empty();
                    $('#AccountViewModel_TerminalId').append('<option value="0">Todas</option>');

                    return;
                }

                $('#AccountViewModel_SportBookId').empty();
                $('#AccountViewModel_SportBookId').append('<option value="0">Cargando...</option>');
                $('#AccountViewModel_TerminalId').empty();
                $('#AccountViewModel_TerminalId').append('<option value="0">Todas</option>');

                $.getJSON('<%=Url.Action("GetSportBooksByStoringCenter", "SportBook", new { @area = "root" }, null)%>',
                    { StoringCenterId: $('#AccountViewModel_StoringCenterId').val() },
                    function (data) {
                        $('#AccountViewModel_SportBookId').empty();
                        $('#AccountViewModel_SportBookId').append('<option value="0">Todas</option>');
                        if (data.length > 0) {
                            $.each(data, function (i, item) {
                                $('#AccountViewModel_SportBookId').append('<option value="' + item.value + '">' + item.label + '</option>');
                            });
                        }
                    }
                );
            });

            $('#AccountViewModel_SportBookId').change(function () {
                // Deselect if 'none'
                if ($(this).val() == '0') {
                    $('#AccountViewModel_TerminalId').empty();
                    $('#AccountViewModel_TerminalId').append('<option value="0">Todas</option>');

                    return;
                }
                $('#AccountViewModel_TerminalId').empty();
                $('#AccountViewModel_TerminalId').append('<option value="0">Cargando...</option>');

                $.getJSON(
                    '<%=Url.Action("GetTerminalsBySportBook", "Terminal", new { @area = "root" }, null)%>',
                    { SportBookId: $('#AccountViewModel_SportBookId').val() },
                    function (data) {
                        $('#AccountViewModel_TerminalId').empty();
                        $('#AccountViewModel_TerminalId').append('<option value="0">Todas</option>');
                        if (data.length > 0) {
                            $.each(data, function (i, item) {
                                $('#AccountViewModel_TerminalId').append('<option value="' + item.value + '">' + item.label + '</option>');
                            });
                        }
                    }
                );
            });
        });
    </script>
</asp:Content>
<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <% HtmlNamePrefix = "AccountViewModel"; %>
    Usuarios - Crear Usuario
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Crear Usuario
    </h2>
    <%= Html.ValidationSummary("Creación fallida, por favor corrije lo errores y vuelve a intentar.") %>
    <% using( Html.BeginForm( ) )
       { %>
    <div id="tabs">
        <ul>
            <li><a href="#user-data">Datos</a></li>
            <li><a href="#user-retentions">Retenciones</a></li>
        </ul>
        <div id="user-data">
            <fieldset>
                <legend>
                    <%= Html.Encode("Información de la cuenta") %></legend>
                <p>
                    <%= this.TextBox( U => U.UserName ).Label("Usuario:") %>
                    <%= this.ValidationMessage( U => U.UserName )%>
                </p>
                <p>
                    <%= this.TextBox( U => U.Email ).Label( "Correo Electronico:" )%>
                    <%= this.ValidationMessage( U => U.Email )%>
                </p>
                <p>
                    <%= this.Password( U => U.Password ).Label("Contraseña:") %>
                    <%= this.ValidationMessage( U => U.Password )%>
                </p>
                <p>
                    <%= this.Password( U => U.ConfirmPassword ).Label( "Confirmar Contraseña:" )%>
                    <%= this.ValidationMessage( U => U.ConfirmPassword )%>
                </p>
                <p>
                    <%= this.Password( U => U.TokenPin ).Label("Contraseña de autorización:") %>
                    <%= this.ValidationMessage( U => U.TokenPin )%>
                </p>
                <p>
                    <%= this.Password( U => U.ConfirmTokenPin ).Label( "Confirmar Contraseña de autorización:" )%>
                    <%= this.ValidationMessage( U => U.ConfirmTokenPin )%>
                </p>
                <p>
                    <%= this.CheckBox( U => U.ForceOTP ).Label("Usa generador de tokens:") %>
                    <%= this.ValidationMessage( U => U.ForceOTP )%>
                </p>
                <p>
                    <%= this.TextBox( U => U.Name ).Label( "Nombre:" )%>
                    <%= this.ValidationMessage( U => U.Name )%>
                </p>
                <p>
                    <%= this.CheckBox( U => U.ForeignSaler ).Label( "Vendedor extranjero:" )%>
                    <%= this.ValidationMessage( U => U.ForeignSaler )%>
                </p>
                <p>
                    <%= this.Select( U => U.CommissionProfileId ).Label( "Perfil de comisión:" ).Options( Model.CommissionProfileList ).FirstOption( "", "-Heredado-" )%>
                    <%= this.ValidationMessage( U => U.CommissionProfileId )%>
                </p>
                <p>
                    <%= this.Select( U => U.ValuePaymentProfileId ).Label( "Perfil de valores a pagar:" ).Options( Model.ValuePaymentProfileList ).FirstOption( "", "-Heredado-" )%>
                    <%= this.ValidationMessage( U => U.ValuePaymentProfileId )%>
                </p>
                <p>
                    <%= this.Select( U => U.LimitBetTypeProfileId ).Label( "Perfil de limites:" ).Options( Model.LimitBetTypeProfileList ).FirstOption( "", "-Heredado-" )%>
                    <%= this.ValidationMessage( U => U.LimitBetTypeProfileId )%>
                </p>
                <p>
                    <%= this.TextBox( U => U.MaximumSales ).Label( "Maximo de ventas deportivas:" )%>
                    <%= this.ValidationMessage( U => U.MaximumSales )%>
                </p>
                <p>
                    <%= this.TextBox( U => U.LottoMaximum ).Label( "Maximo de ventas loteria:" )%>
                    <%= this.ValidationMessage( U => U.LottoMaximum )%>
                </p>
                <p>
                    <%= this.Select( U => U.CompanyId ).Label( "Consorcio:" ).Options( Model.CompaniesList ).FirstOption( "0", "Todas" )%>
                    <%= this.ValidationMessage( U => U.CompanyId )%>
                </p>
                <p>
                    <%= this.Select( U => U.StoringCenterId ).Label( "Centro de acopio:" ).Options( Model.StoringCenterList ).FirstOption( "0", "Todos" )%>
                    <%= this.ValidationMessage( U => U.StoringCenterId )%>
                </p>
                <p>
                    <%= this.Select( U => U.SportBookId ).Label( "Banca:" ).Options( Model.SportBooksList ).FirstOption( "0", "Todas" )%>
                    <%= this.ValidationMessage( U => U.SportBookId )%>
                </p>
                <p>
                    <%= this.Select( U => U.TerminalId ).Label( "Terminal:" ).Options( Model.TerminalsList ).FirstOption( "0", "Todas" )%>
                    <%= this.ValidationMessage( U => U.TerminalId )%>
                </p>
                <label for="roles">
                    Roles</label>
                <div class="rolesContainer">
                    <% foreach( String CurrentRole in Model.AvalaibleRoles )
                       { %>
                    <input type="checkbox" <%= ( Model.SelectedRoles.Contains( CurrentRole ) )? "checked=\"checked\"" : "" %>
                        value="<%=CurrentRole%>" name="<%= ( this.HtmlNamePrefix != null )? this.HtmlNamePrefix + ".": ""  %>SelectedRoles">
                        <%= CurrentRole%>
                    </input>
                    <br />
                    <%} %>
                    <%= Html.ValidationMessage("SelectedRoles") %>
                </div>
            </fieldset>
        </div>
        <div id="user-retentions">
            <fieldset>
                <legend>
                    <%= Html.Encode("Retención por tipo de apuesta") %></legend>
                <%
                    var CurrentRetentionIndex = 0;
                    foreach( var Retention in Model.Retentions.OrderBy( Retention => Retention.BetTypeId ) )
                    {%>
                <p>
                    <label>
                        <%= Retention.BetTypeName %></label>
                    <%= Html.Hidden( string.Format( "AccountViewModel.Retentions[{0}].BetTypeId", CurrentRetentionIndex ),
                        Retention.BetTypeId )%>
                    <%= Html.TextBox( string.Format( "AccountViewModel.Retentions[{0}].Percentage", CurrentRetentionIndex ),
                        Retention.Percentage.ToString( "F2" ),
                        new { @class = "short" } )%><%= Html.Encode("%") %>
                </p>
                <%      CurrentRetentionIndex++;
                    }%>
            </fieldset>
        </div>
    </div>
    <br />
    <p>
        <input type="submit" value="Registrar" />
    </p>
    <% } %>
    <%= Html.ClientSideValidation<User>( HtmlNamePrefix )%>
    <div>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
</asp:Content>
