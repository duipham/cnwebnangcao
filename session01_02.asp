<!DOCTYPE html>
<html>
<body>

<%
dim name
name=10
response.write("My name is: " & name)
name = now()
response.write("<br>Today is: " & name & "<br>")
sub giaithua(n)
	dim gt,i
	gt = 1
	for i=1 to n 
		gt = gt*i
	next
	Response.write(gt)
end sub
function giaithuaf(n)
	dim gt,i
	gt = 1
	for i=1 to n 
		gt = gt*i
	next
	giaithuaf = gt
end function

	call giaithua(4)
	response.write("<br>")
	call giaithua(6)
	response.write("<br>" & giaithuaf(7))
	
i=hour(time)
response.write("<br>Now is " & i & " hours")
If i < 10 Then
response.write("<br>Good morning!")
Else
response.write("<br>Have a nice day!")
End If
Response.write("<br>")

i=hour(time)
If i = 10 Then
response.write("Just started...!")
ElseIf i = 11 Then
response.write("Hungry!")
ElseIf i = 12 Then
response.write("Ah, lunch-time!")
ElseIf i = 16 Then
response.write("Time to go home!")
Else
response.write("Unknown")
End If
Response.write("<br>")
d=weekday(date)
Select Case d
  Case 1
    response.write("Sleepy Sunday")
  Case 2
    response.write("Monday again!")
  Case 3
    response.write("Just Tuesday!")
  Case 4
    response.write("Wednesday!")
  Case 5
    response.write("Thursday...")
  Case 6
    response.write("Finally Friday!")
  Case else
    response.write("Super Saturday!!!!")
End Select
	
%>

</body>
</html>