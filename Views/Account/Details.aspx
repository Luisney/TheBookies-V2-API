<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AccountViewModel>" %>

<%@ Import Namespace="Gambling.ViewModels" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Usuarios - Detalles del Usuario
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Detalles del Usuario
    </h2>
    <fieldset>
        <p>
            <label>
                Usuario:</label>
            <%= Html.Encode(Model.UserName) %>
        </p>
        <p>
            <label>
                <%= Html.Encode( "Fecha de creación: " ) %></label>
            <%= Html.Encode(Model.CreationDate) %>
        </p>
        <p>
            <label>
                Correo electronico:</label>
            <%= Html.Encode( Model.Email ) %>
        </p>
        <p>
            <label>
                Ultima actividad:</label>
            <%= Html.Encode( Model.LastActivityDate ) %>
        </p>
        <p>
            <label>
                Ultimo ingreso:</label>
            <%= Html.Encode( Model.LastLoginDate ) %>
        </p>
        <p>
            <label>
                <%= Html.Encode("Está en linea: ")%></label>
            <%= string.Format("<img src='{0}' />", Model.IsOnline? "/Content/images/true.png": "/Content/images/false.png" ) %>
        </p>
        <p>
            <label>
                <%= Html.Encode("Roles: ")%></label>
                
                <%if( Model.SelectedRoles.Count() > 0 )
                    foreach( String CurrentRole in Model.SelectedRoles )
                  {%>
                    <br/>  <%= CurrentRole  %>
                <%}else
                { %>
                    Ninguno
                <%} %>
        </p>
    </fieldset>
    <br />
    <br />
    <fieldset>
    <legend>Código Login Fuera de Línea</legend>

    <p>
    <input type="button" value="Generar Código Fuera de Línea" onclick="generar()" />
    </p>
<br />
<p id="generatedCode"></p>
    </fieldset>

    <p>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </p>

         <div id="generateCodeDialog" title="Generar Código Fuera de Línea">
        <p id="generateCodeDialogMessage">
        </p>
        <br />
        <form onsubmit="return false">
        <fieldset>
            <p>
                <label>
                    Usuario Administrativo:</label>
                <input id="adminUser" name="adminUser" type="text" value="" />
            </p>
            <p>
                <label>
                    Contraseña de autorización:</label>
                <input id="authPassword" name="authPassword" type="password" value="" />
            </p>
        </fieldset> 
        </form>
    </div>

        <script type="text/javascript">

            function generar() {
                $('#generateCodeDialog').dialog('open');
                $('#generateCodeDialogMessage').text('Desea generar un Código Login Fuera de Línea para este usuario ?');

            }
            $('#generateCodeDialog').dialog({
                bgiframe: true,
                modal: true,
                autoOpen: false,
                width: 400,
                buttons: {
                    "Generar": function () {
                        $.getJSON("/Account/CLFL",
						{
						    userName: "<%=Model.UserName %>",
						    adminUser: $('#generateCodeDialog input[name=adminUser]').val(),
						    authPassword: $('#generateCodeDialog input[name=authPassword]').val()
						},
						function (data) {
						    if (data == null) {
						        alert("Error inesperado.");
						        return;
						    }
						    var datos = data.split(",");
						    if (datos[0] != "OK") {
						        alert(data);
						        return;
						    }
						    $("#generatedCode").html("El código generado es: " + datos[1]);


						    $('#generateCodeDialog').dialog('close');
						    // Info message
						    //$('#infoDialog').dialog('open');
						    //$('#infoDialogMessage').text(data);
						});
                    },
                    "Cancelar": function () {
                        $("#generateCodeDialog").dialog('close');
                    }
                }
            });


    </script>
</asp:Content>
