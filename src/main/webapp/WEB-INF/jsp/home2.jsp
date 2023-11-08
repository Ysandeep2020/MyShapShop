<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sample JSP Page 123456</title>
</head>
<body>
	<h1>Welcome to My JSP Page123456789</h1>
	<p>This is a sample JSP page.</p>
	<a href="/students">Students List</a>


	<h1>File Upload Example</h1>
	<form action="/import" method="post" enctype="multipart/form-data">
		Select a file to upload: <input type="file" name="file" id="file">
		<input type="submit" value="Upload File">
	</form>
	
	<img src="new2.jpg" alt="Your Image">
	
</body>
</html>
