<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<script type="text/javascript">
    google.load("visualization", "1", { packages: ["piechart"], language: 'es' });

    $(function() {
        loadChartLotteryBets();
        $('#chart_LotteryBetsSearch').click(loadChartLotteryBets);

        // Date pickers
        $(".datePicker").datepicker({
            dateFormat: 'dd/mm/yy'
        });
    });

    loadChartLotteryBets = function() {
        $('#chart_LotteryBets')
        .theBookiesChart(
            'PieChart',
            {
                url: '<%= Url.Action("GetLotteryBetShares","Chart",new { @area = "root"})%>',
                chartParams:
                {
                    is3D: true,
                    width: 445,
                    height: 215
                },
                params:
                {
                    StartDate: $('#chart_LotteryBetsStartDate').val(),
                    EndDate: $('#chart_LotteryBetsEndDate').val()
                }
            });
    }
</script>

<div class="statistics-Box noMarginRight">
    <h4>
        Jugadas loter�as</h4>
    <label title="Desde">
        Desde:</label>
    <input id="chart_LotteryBetsStartDate" type="text" class="datePicker" value="<%= DateTime.Now.AddDays( -30 ).ToShortDateString( ) %>" />
    <label title="Hasta">
        Hasta:</label>
    <input id="chart_LotteryBetsEndDate" type="text" class="datePicker" value="<%= DateTime.Now.ToShortDateString( ) %>" />
    <button id="chart_LotteryBetsSearch">
        Refrescar</button>
    <div id="chart_LotteryBets">
    </div>
</div>
