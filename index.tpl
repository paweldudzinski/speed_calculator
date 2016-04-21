<!doctype html>
	<html lang="en">
		<head>
			<meta charset="utf-8" />
			<title>Triathlon pace and speed calculator. Ironman calculator.</title>
			<link href='http://fonts.googleapis.com/css?family=Oswald:400,300&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
			<link rel="stylesheet" href="/static/style.css" />
			<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
			<!--[if IE]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
			<![endif]-->
		</head>
		<body>
		<div class="container">
			<a class="main" id="swim-btn" href="#"><img src="/static/swim.png" style="height:160px; display:inline;" /></a>
			<a class="main" id="bike-btn" href="#"><img src="/static/bike.png" style="height:160px; display:inline; margin:0px 10px 0px 10px;" /></a>
			<a class="main" id="run-btn" href="#"><img src="/static/run.png" style="height:160px; display:inline;" /></a>
			<div class="forms">
				<div class="swim">
					<form action="" method="GET">
						<span class="caption">I want to swim</span>
						<div class="select-style">
						<select id="swim-distance" name="distance">
							<option value="750">750 m (Sprint)</option>
							<option value="1500">1500 m (Olympic)</option>
							<option value="1900">1900 m (70.2)</option>
							<option value="3800">3800 m (IronMan)</option>
						</select>
						</div>
						<span class="caption">in</span>
						<table class="duration">
							<tr>
								<td>
									<input type="text" name="hours" id="swim-hours" value="0" style="width:50px;" />
								</td>
								<td>
									<input type="text" name="minutes" id="swim-minutes" value="0" style="width:50px;" />
								</td>
								<td>
									<input type="text" name="seconds" id="swim-seconds" value="0" style="width:50px;" />
								</td>
							</tr>
							<tr>
								<td>hours</td><td>minutes</td><td>seconds</td>
							</tr>
						</table>
						<input class="sbmt swim-sbmt" type="submit" value="Calculate how fast should i swim" />
					</form>
	    		</div>
				<div class="bike">
					<form action="" method="GET">
						<span class="caption">I want to cycle</span>
						<div class="select-style">
						<select id="bike-distance" name="distance">
							<option value="20000">20 km (Sprint)</option>
							<option value="40000">40 km (Olympic)</option>
							<option value="90000">90 km (70.2)</option>
							<option value="180000">180 km (IronMan)</option>
						</select>
						</div>
						<span class="caption">in</span>
						<table class="duration">
							<tr>
								<td>
									<input type="text" name="hours" id="bike-hours" value="0" style="width:50px;" />
								</td>
								<td>
									<input type="text" name="minutes" id="bike-minutes" value="0" style="width:50px;" />
								</td>
								<td>
									<input type="text" name="seconds" id="bike-seconds" value="0" style="width:50px;" />
								</td>
							</tr>
							<tr>
								<td>hours</td><td>minutes</td><td>seconds</td>
							</tr>
						</table>
						<input class="sbmt bike-sbmt" type="submit" value="Calculate how fast should i cycle" />
					</form>
				</div>
				<div class="run">
					<form action="" method="GET">
						<span class="caption">I want to run</span>
						<div class="select-style">
						<select id="run-distance" name="distance">
							<option value="5000">5 km (Sprint)</option>
							<option value="10000">10 km (Olympic)</option>
							<option value="21097">Half Marathon (70.2)</option>
							<option value="42195">Marathon (IronMan)</option>
						</select>
						</div>
						<span class="caption">in</span>
						<table class="duration">
							<tr>
								<td>
									<input type="text" name="hours" id="run-hours" value="0" style="width:50px;" />
								</td>
								<td>
									<input type="text" name="minutes" id="run-minutes" value="0" style="width:50px;" />
								</td>
								<td>
									<input type="text" name="seconds" id="run-seconds" value="0" style="width:50px;" />
								</td>
							</tr>
							<tr>
								<td>hours</td><td>minutes</td><td>seconds</td>
							</tr>
						</table>
						<input class="sbmt run-sbmt" type="submit" value="Calculate how fast should i run" />
					</form>
				</div>
				<br /><br /><hr /><br />
			</div>
			<span class="caption-json" id="title"></span><br />
			<div id="swim-box" class="result-box">
				<img src="/static/swim.png" style="height:40px;" /><br />
				<strong>
				<span id="swim-distance-info"></span> km in <span id="swim-time-info"></span><br />
				</strong>
				Average pace: <span id="swim-pace"></span> min/km<br />
				Average speed: <span id="swim-speed"></span> km/h<br />
				<div class="side">
				Average 250m lap time: <span id="swim-qpace"></span> min<br />
				Average 100m lap time: <span id="swim-hpace"></span> min<br />
				Average 50m lap time: <span id="swim-fpace"></span> min
				</div>
			</div>
			<div id="bike-box" class="result-box" style="margin:0px 5px;">
				<img src="/static/bike.png" style="height:40px;" /><br />
				<strong>
				<span id="bike-distance-info"></span> km in <span id="bike-time-info"></span><br />
				</strong>
				Average pace: <span id="bike-pace"></span> min/km<br />
				Average speed: <span id="bike-speed"></span> km/h<br />
				<div class="side">
				Average 10km lap: <span id="bike-dpace"></span> min<br /><br /><br />
				</div>
			</div>
			<div id="run-box" class="result-box">
				<img src="/static/run.png" style="height:40px;" /><br />
				<strong>
				<span id="run-distance-info"></span> km in <span id="run-time-info"></span><br />
				</strong>
				Average pace: <span id="run-pace"></span> min/km<br />
				Average speed: <span id="run-speed"></span> km/h<br />
				<div class="side">
				Average 5km lap: <span id="run-dpace"></span> min<br /><br /><br />
				</div>
			</div>
		</div>
		</body>
	</html>
	
	<script>
		$(document).ready(function() {
			$('.pictograms').hide();
			
			$('#swim-btn').click(function() {
				$('.bike').hide();
				$('.run').hide();
				$('.swim').show();
				return false;
			});
			$('#bike-btn').click(function() {
				$('.bike').show();
				$('.run').hide();
				$('.swim').hide();
				return false;
			});
			$('#run-btn').click(function() {
				$('.bike').hide();
				$('.run').show();
				$('.swim').hide();
				return false;
			});
			
			$('.swim-sbmt').click(function() {
				var distance = $('#swim-distance').val();
				var hours = $('#swim-hours').val();
				var minutes = $('#swim-minutes').val();
				var seconds = $('#swim-seconds').val();
				$.post('/calculate_swim',
					{distance: distance, hours: hours, minutes: minutes, seconds: seconds},
					function(data) {
						var json = $.parseJSON(data);
						var pace = json.pace;
						var speed = json.speed;
						var qpace = json.qpace;
						var hpace = json.hpace;
						var fpace = json.fpace;
						$('#title').html('So you\'d have to:');
						$('#swim-distance-info').html(distance/1000);
						var time = (parseInt(hours) * 3600) + (parseInt(minutes) * 60) + parseInt(seconds);
						$('#swim-time-info').html(time.toString().toHHMMSS());
						$('#swim-pace').html(pace);
						$('#swim-speed').html(speed);
						$('#swim-qpace').html(qpace);
						$('#swim-hpace').html(hpace);
						$('#swim-fpace').html(fpace);
						$('#swim-box').show();
					});
				return false;
			});
			
			$('.run-sbmt').click(function() {
				var distance = $('#run-distance').val();
				var hours = $('#run-hours').val();
				var minutes = $('#run-minutes').val();
				var seconds = $('#run-seconds').val();
				$.post('/calculate_run',
					{distance: distance, hours: hours, minutes: minutes, seconds: seconds},
					function(data) {
						var json = $.parseJSON(data);
						var pace = json.pace;
						var dpace = json.dpace;
						var speed = json.speed;
						$('#title').html('So you\'d have to:');
						$('#run-distance-info').html(distance/1000);
						var time = (parseInt(hours) * 3600) + (parseInt(minutes) * 60) + parseInt(seconds);
						$('#run-time-info').html(time.toString().toHHMMSS());
						$('#run-pace').html(pace);
						$('#run-dpace').html(dpace);
						$('#run-speed').html(speed);
						$('#run-box').show();
					});
				return false;
			});
			
			$('.bike-sbmt').click(function() {
				var distance = $('#bike-distance').val();
				var hours = $('#bike-hours').val();
				var minutes = $('#bike-minutes').val();
				var seconds = $('#bike-seconds').val();
				$.post('/calculate_bike',
					{distance: distance, hours: hours, minutes: minutes, seconds: seconds},
					function(data) {
						var json = $.parseJSON(data);
						var pace = json.pace;
						var dpace = json.dpace;
						var speed = json.speed;
						$('#title').html('So you\'d have to:');
						$('#bike-distance-info').html(distance/1000);
						var time = (parseInt(hours) * 3600) + (parseInt(minutes) * 60) + parseInt(seconds);
						$('#bike-time-info').html(time.toString().toHHMMSS());
						$('#bike-pace').html(pace);
						$('#bike-dpace').html(dpace);
						$('#bike-speed').html(speed);
						$('#bike-box').show();
					});
				return false;
			});
		});
		
		String.prototype.toHHMMSS = function () {
			var sec_num = parseInt(this, 10); // don't forget the second param
			var hours   = Math.floor(sec_num / 3600);
			var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
			var seconds = sec_num - (hours * 3600) - (minutes * 60);

			if (hours   < 10) {hours   = "0"+hours;}
			if (minutes < 10) {minutes = "0"+minutes;}
			if (seconds < 10) {seconds = "0"+seconds;}
			var time    = hours+'h '+minutes+'m '+seconds+'s';
			return time;
		}
	</script>
