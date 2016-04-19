<!doctype html>
	<html lang="en">
		<head>
			<meta charset="utf-8" />
			<title></title>
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
							<option value="750">750 m</option>
							<option value="1500">1500 m</option>
							<option value="1900">1900 m</option>
							<option value="3800">3800 m</option>
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
					bike form
				</div>
				<div class="run">
					<form action="" method="GET">
						<span class="caption">I want to run</span>
						<div class="select-style">
						<select id="run-distance" name="distance">
							<option value="5000">5 km</option>
							<option value="10000">10 km</option>
							<option value="21097">Half Marathon</option>
							<option value="42195">Marathon</option>
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
			<img class="pictograms" id="pictogram-swim" src="/static/swim.png" style="height:20px; margin-right:5px; display:inline;" /><span class="caption-json" id="swim-result"></span><br />
			<img class="pictograms" id="pictogram-run" src="/static/run.png" style="height:20px; margin-right:5px; display:inline;" /><span class="caption-json" id="run-result"></span><br />
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
						$('#title').html('So you\'d have to:');
						$('#swim-result').html(pace + ' min/km' + ' / ' + speed + ' km/h');
						$('#pictogram-swim').show();
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
						var speed = json.speed;
						$('#title').html('So you\'d have to:');
						$('#run-result').html(pace + ' min/km' + ' / ' + speed + ' km/h');
						$('#pictogram-run').show();
					});
				return false;
			});
		});
	</script>