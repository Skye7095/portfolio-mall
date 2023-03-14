<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석체크</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/buyerstyle.css" type="text/css">

<!-- 출석체크를 위한 캘린더 라이브러리 -->
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.4/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.4/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.4/index.global.min.js'></script>
<script src='fullcalendar/core/locales/ko.js'></script>


</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/common/smallheader.jsp"/>
		<section class="buyerAttendence-section my-5">
			<div class="container d-flex justify-content-center align-items-start">
				
				<article class="container attendence-content d-flex justify-content-around align-items center">
					<img width="50%" src="https://cdn.bullsonemall.com/dataroom/promotion/1617/roulette_20211129_274428_9V.png">
					
					<div class="attendence-event">
						<!-- 캘린더 -->
						<div class="container calendar-container">
							<div class="calendar-header bg-primary">
								<h4 class="text-white">이번달 나의 출석일수&nbsp; &nbsp;?일</h4>
							</div>
							<div id='calendar'>
							
							</div>
						</div>
					</div>
					
				</article>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/common/footer.jsp" />
	</div>
	
	<script>

	    

	
		$(document).ready(function(){
			
			var calendarEl = document.getElementById('calendar');
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		    	initialView: 'dayGridMonth',
		    	locale: 'ko',
		    	selectable: true,
		    	
		    	dateClick: function() {
		    	    alert('출석 성공!');
		    	}
		    });
		    calendar.render();
		   
		})
	</script>
</body>
</html>