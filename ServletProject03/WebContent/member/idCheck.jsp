<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../js/member.js?ver=2"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<label for="userid">UserID:</label> <input type="text"
					class="form-control" id="userid" placeholder="Enter UserId"
					name="userid">
			</div>
			<div class="col align-self-end">
				<button type="button" id="useBtn" class="btn btn-primary">사용여부</button>
			</div>
		</div>
	</div>
</body>
</html>