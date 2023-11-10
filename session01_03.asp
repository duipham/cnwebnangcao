<html>
	<head>
		<title>Tiêu đề của website</title>
		<meta charset="utf-8">
	</head>
	<body>
		<h1>Ví dụ về thẻ H1</h1>
		<%
			dim i
			for i = 10 to 40 
				response.write("<font style='font-size:" & i & "pt;'>Ví dụ cỡ chữ " & i & "</font><br>")
			next
			for i = 10 to 40 step 2
				response.write("<font style='font-size:" & i & "pt;'>Ví dụ cỡ chữ " & i & "</font><br>")
			next
			for i = 40 to 10 step -2
				response.write("<font style='font-size:" & i & "pt;'>Ví dụ cỡ chữ " & i & "</font><br>")
			next
			
			
Dim cars(2)
cars(0)="Volvo"
cars(1)="Saab"
cars(2)="BMW"

For Each x In cars
  response.write("<br />" & x)
Next
i = 30
Do Until i=10
  i=i-1
  response.write("<br>" & i)
  If i<13 Then Exit Do
Loop
response.write("<br> Làm với while<br>")
while (i<30)
	response.write("<br> "& i )
	i=i+1
wend 
%>
	</body>
</html>