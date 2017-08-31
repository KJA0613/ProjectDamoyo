type = ['','info','success','warning','danger'];


demo = {
    initPickColor: function(){
        $('.pick-class-label').click(function(){
            var new_class = $(this).attr('new-class');
            var old_class = $('#display-buttons').attr('data-class');
            var display_div = $('#display-buttons');
            if(display_div.length) {
            var display_buttons = display_div.find('.btn');
            display_buttons.removeClass(old_class);
            display_buttons.addClass(new_class);
            display_div.attr('data-class', new_class);
            }
        });
    },

    initFormExtendedDatetimepickers: function(){
        $('.datetimepicker').datetimepicker({
            icons: {
                time: "fa fa-clock-o",
                date: "fa fa-calendar",
                up: "fa fa-chevron-up",
                down: "fa fa-chevron-down",
                previous: 'fa fa-chevron-left',
                next: 'fa fa-chevron-right',
                today: 'fa fa-screenshot',
                clear: 'fa fa-trash',
                close: 'fa fa-remove'
            }
         });
    },

    
    
    // 여기가 소스코드 바꾸는 곳임
    initDashboardPageCharts: function(){

        /* ----------==========     Daily Sales Chart initialization    ==========---------- */
    	
    	var week1 = $('#week1').val(); // 월
    	var week2 = $('#week2').val();
    	var week3 = $('#week3').val();
    	var week4 = $('#week4').val(); //..
    	var week5 = $('#week5').val();
    	var week6 = $('#week6').val();
    	var week7 = $('#week7').val(); // 일
    	
    	var week = [week1, week2, week3, week4, week5, week6, week7];
    	var weekMax = Math.max.apply(null,week);
    	
    	dataDailySalesChart = {
            
    		labels: ['월', '화', '수', '목', '금', '토', '일'],
            series: [
                [week1, week2, week3, week4, week5, week6, week7]
            ]
        };

        
        
        optionsDailySalesChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            low: 0,
            high: weekMax+30, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: { top: 0, right: 0, bottom: 0, left: 0},
        }

        var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

        md.startAnimationForLineChart(dailySalesChart);



        /* ----------==========     Completed Tasks Chart initialization    ==========---------- */
        
        var time00 = $('#time00').val(); 
    	var time02 = $('#time02').val();
    	var time04 = $('#time04').val();
    	var time06 = $('#time06').val(); 
    	var time08 = $('#time08').val();
    	var time10 = $('#time10').val();
    	var time12 = $('#time12').val(); 
    	var time14 = $('#time14').val(); 
    	var time16 = $('#time16').val();
    	var time18 = $('#time18').val();
    	var time20 = $('#time20').val();
    	var time22 = $('#time22').val();
        
    	var time = [time00, time02, time04, time06, time08, time10, time12, time14, time16, time18, time20, time22];
    	var timeMax = Math.max.apply(null, time);
    	
    	
        dataCompletedTasksChart = {
            labels: ['00h', '02h','04h','06h','08h','10h','12h','14h','16h','18h','20h','22h'],
            series: [
                [time00, time02, time04, time06, time08, time10, time12, time14, time16, time18, time20, time22]
            ]
        };

        optionsCompletedTasksChart = {
            lineSmooth: Chartist.Interpolation.cardinal({
                tension: 0
            }),
            low: 0,
            high: timeMax+30, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: { top: 0, right: 0, bottom: 0, left: 0}
        }

        var completedTasksChart = new Chartist.Line('#completedTasksChart', dataCompletedTasksChart, optionsCompletedTasksChart);

        // start animation for the Completed Tasks Chart - Line Chart
        md.startAnimationForLineChart(completedTasksChart);



        /* ----------==========     Emails Subscription Chart initialization    ==========---------- */

        var dataEmailsSubscriptionChart = {
          labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
          series: [
            [542, 443, 320, 780, 553, 453, 326, 434, 568, 610, 756, 895]

          ]
        };
        var optionsEmailsSubscriptionChart = {
            axisX: {
                showGrid: false
            },
            low: 0,
            high: 1000,
            chartPadding: { top: 0, right: 5, bottom: 0, left: 0}
        };
        var responsiveOptions = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var emailsSubscriptionChart = Chartist.Bar('#emailsSubscriptionChart', dataEmailsSubscriptionChart, optionsEmailsSubscriptionChart, responsiveOptions);

        //start animation for the Emails Subscription Chart
        md.startAnimationForBarChart(emailsSubscriptionChart);

    },

   	showNotification: function(from, align){
    	color = Math.floor((Math.random() * 4) + 1);

    	$.notify({
        	icon: "notifications",
        	message: "Welcome to <b>Material Dashboard</b> - a beautiful freebie for every web developer."

        },{
            type: type[color],
            timer: 4000,
            placement: {
                from: from,
                align: align
            }
        });
	}



}
