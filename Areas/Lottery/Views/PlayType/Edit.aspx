<%@ Page Title="" Language="C#" MasterPageFile="../Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<TheBookies.Model.BetType>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Tipos Apuesta - Crear Tipos de Apuesta
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% HtmlNamePrefix = "betTypeToEdit"; %>
    <h2>
        Editar Tipos de Apuesta</h2>
    <% using( Html.BeginForm( ) )
       {%>
    <fieldset>
        <legend>Información General</legend>
        <p>
            <%= this.TextBox( PageModel => PageModel.Name ).Disabled( true ).Label( "Nombre:" ) %>
            <%= this.ValidationMessage( PageModel =>  PageModel.Name )%>
            <%= this.Hidden( PageModel =>  PageModel.Name )%>
        </p>
        <p>
            <%= this.CheckBox( PageModel =>  PageModel.ApplyPrize ).Label( "Usar premios de la loteria:" ).Attr( "title", "Activar para apuestas que usan los premios de la loteria ej: Quiniela." ).Attr( "class", "jqtooltipWE" )%>
            <%= this.ValidationMessage( PageModel =>  PageModel.ApplyPrize )%>
        </p>
        <p>
            <%= this.CheckBox( PageModel => PageModel.SortPrizes ).Label( "Gana en cualquier orden" ).Attr( "title", "Activar para apuestas que ganan en cualquier orden (e.g. tripleta)" ).Attr( "class", "jqtooltipWE" )%>
            <%= this.ValidationMessage( PageModel =>  PageModel.SortPrizes )%>
        </p>
        <div id="prize">
            <p>
                <%= this.CheckBox( PageModel =>  PageModel.Winner ).Label( "Ganador:" ).Attr( "title", "Activar si el premio del producto depende del primer número." ).Attr( "class", "jqtooltipWE" )%>
                <%= this.ValidationMessage( PageModel =>  PageModel.Winner )%>
            </p>
            <p>
                <%= this.CheckBox( PageModel =>  PageModel.Second ).Label( "Segundo:" ).Attr( "title", "Activar si el premio del producto depende del segundo número." ).Attr( "class", "jqtooltipWE" )%>
                <%= this.ValidationMessage( PageModel =>  PageModel.Second )%>
            </p>
            <p>
                <%= this.CheckBox( PageModel =>  PageModel.Thrird ).Label( "Tercero:" ).Attr( "title", "Activar si el premio del producto depende del tercer número." ).Attr( "class", "jqtooltipWE" )%>
                <%= this.ValidationMessage( PageModel =>  PageModel.Thrird )%>
            </p>
            <p>
                <%= this.CheckBox( PageModel =>  PageModel.AlterPrize ).Label( "Pata:" ).Attr( "title", "Activar para apuestas que pagan pata (premio de consolación)" ).Attr( "class", "jqtooltipWE" )%>
                <%= this.ValidationMessage( PageModel => PageModel.AlterPrize )%>
            </p>
        </div>
        <div id="bets">
            <p>
                <%= this.CheckBox( PageModel =>  PageModel.Pairs ).Label( "Pares:" ).Attr( "title", "Activar si el premio del producto depende de que el número sea par." ).Attr( "class", "jqtooltipWE" )%>
                <%= this.ValidationMessage( PageModel =>  PageModel.Pairs )%>
            </p>
            <p>
                <%= this.CheckBox( PageModel =>  PageModel.Odds ).Label( "Nones:" ).Attr( "title", "Activar si el premio del producto depende de que el número sea impar." ).Attr( "class", "jqtooltipWE" )%>
                <%= this.ValidationMessage( PageModel =>  PageModel.Odds )%>
            </p>
            <p>
                <%= this.CheckBox( PageModel =>  PageModel.Highs ).Label( "Mayores que 50:" ).Attr( "title", "Activar si el premio del producto depende de que el número sea mayor que 50." ).Attr( "class", "jqtooltipWE" )%>
                <%= this.ValidationMessage( PageModel =>  PageModel.Highs )%>
            </p>
            <p>
                <%= this.CheckBox( PageModel =>  PageModel.Lows ).Label( "Menores o iguales que 50:" ).Attr( "title", "Activar si el premio del producto depende de que el número sea menor o igual que 50." ).Attr( "class", "jqtooltipWE" )%>
                <%= this.ValidationMessage( PageModel =>  PageModel.Lows )%>
            </p>
        </div>
        <p>
            <%= this.CheckBox( PageModel => PageModel.UseExchangeUnit ).Label( "Usar pago por cheles:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.UseExchangeUnit )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.Maximum ).Value( Model.Maximum.ToString( "F2" ) ).Label( "Valor máximo por ticket:" )%>
            <%= this.ValidationMessage( PageModel =>  PageModel.Maximum )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.AccumulatedLimit ).Label( "Limite Maximo de ventas:" )%>
            <%= this.ValidationMessage( PageModel =>  PageModel.AccumulatedLimit )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.AccumulatedTimes ).Label( "Limite de veces jugadas:" )%>
            <%= this.ValidationMessage( PageModel =>  PageModel.AccumulatedTimes )%>
        </p>
        <p>
            <%= this.TextBox( PageModel =>  PageModel.Lottos ).Disabled( true ).Label( "Cantidad de Loterías:" )%>
            <%= this.Hidden( PageModel =>  PageModel.Lottos )%>
            <%= this.ValidationMessage( PageModel =>  PageModel.Lottos )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.DigitNumbers ).Disabled(true).Label("Digitos por premio:") %>
            <%= this.Hidden( PageModel => PageModel.DigitNumbers ) %>
            <%= this.ValidationMessage( PageModel => PageModel.DigitNumbers )%>
        </p>
        <p>
            <%= this.TextBox( PageModel =>  PageModel.BetNumbers ).Label( "Cantidad de Numeros:" )%>
            <%= this.ValidationMessage( PageModel => PageModel.BetNumbers )%>
        </p>
        <p>
            <%= this.TextBox( PageModel =>  PageModel.Shortcut ).Label( "Shortcut:" )%>
            <%= this.ValidationMessage( PageModel =>  PageModel.Shortcut )%>
        </p>
        <p>
            <%= this.CheckBox( PageModel =>  PageModel.ValidOffLine ).Label( "Válido fuera de línea:" ).Attr( "title", "Activar si el producto es válido fuera de la línea." ).Attr( "class", "jqtooltipWE" )%>
            <%= this.ValidationMessage( PageModel =>  PageModel.ValidOffLine )%>
        </p>
        <p>
            <%= this.TextBox( PageModel => PageModel.MaximumOffLine ).Value( Model.MaximumOffLine.Value.ToString( "F2" ) ).Label( "Máximo fuera de línea:" )%>
            <%= this.ValidationMessage( PageModel =>  PageModel.MaximumOffLine )%>
        </p>
        <p>
            <label>
                &nbsp;</label>
            <input type="submit" value="Guardar" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%=Html.ActionLink( "Volver al listado", "Index", new {}, new { @class = "navPrev" } )%>
    </div>
    <%= Html.ClientSideValidation<TheBookies.Model.BetType>(HtmlNamePrefix)%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Assets" runat="server">
    <link href="/Content/CSS/tipsy.css" rel="stylesheet" type="text/css" />

    <script src="/Content/js/jquery.tipsy.js" type="text/javascript"></script>

    <script src="/Content/js/jqtooltip.js" type="text/javascript"></script>

    <script type="text/javascript" src="/Content/js/jquery.validate.js"></script>

    <script type="text/javascript" src="/Content/js/xVal.jquery.validate.js"></script>

</asp:Content>
