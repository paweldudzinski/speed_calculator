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
		<form action="" method="GET">
			<span class="caption">I want to run</span>
			<div class="select-style">
			<select id="distance" name="distance">
				<option value="5000">5 km</option>
				<option value="10000">10 km</option>
				<option value="15000">15 km</option>
				<option value="21097">Half Marathon</option>
				<option value="42195">Marathon</option>
			</select>
			</div>
			<span class="caption">in</span>
			<table class="duration">
				<tr>
					<td>
						<input type="text" name="hours" id="hours" value="0" style="width:50px;" />
					</td>
					<td>
						<input type="text" name="minutes" id="minutes" value="0" style="width:50px;" />
					</td>
					<td>
						<input type="text" name="seconds" id="seconds" value="0" style="width:50px;" />
					</td>
				</tr>
				<tr>
					<td>hours</td><td>minutes</td><td>seconds</td>
				</tr>
			<table>
			<input class="sbmt" type="submit" value="Calculate how fast should i run">
		</form>
		<br /><br /><hr /><br />
		<span class="caption-json" id="title"></span><br />
		<span class="caption-json" id="pace"></span><br />
		<span class="caption-json" id="speed"></span>
		</div>
		</body>
	</html>
	
	<script>
		$(document).ready(function() {
			$('.sbmt').click(function() {
				var distance = $('#distance').val();
				var hours = $('#hours').val();
				var minutes = $('#minutes').val();
				var seconds = $('#seconds').val();
				$.post('/calculate',
					{distance: distance, hours: hours, minutes: minutes, seconds: seconds},
					function(data) {
						var json = $.parseJSON(data);
						var pace = json.pace;
						var speed = json.speed;
						$('#title').html('So you\'d have to run:');
						$('#pace').html(pace + ' min/km');
						$('#speed').html(speed + ' km/h');
					});
				return false;
			});
		});
	</script>