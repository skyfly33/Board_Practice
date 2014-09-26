<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Donghoon's Model1 Board - Text_Input_Form</title>
</head>
<body>
	<form action="insert.jsp" method="post" onsubmit="return formCheck();">
		<p align="center">
			제목 : <input type="text" name="title"
				style="height: 30px; width: 150px"><br> 작성자 :<input
				type="text" name="writer"
				style="height: 30px; width: 150px; left: auto"><br> 내용
			:
			<textarea name="content" cols="20" rows="10"
				style="height: 200px; width: 150px; list-style-type: circle; cursor: text"></textarea>
			<br> 날짜 : <input type="text" name="regdate"
				style="height: 30px; width: 150px"><br> <input
				type="submit" name="제출" style="height: 30px; width: 80px">
		</p>
	</form>
	<script>
		function formCheck() {

			var title = document.forms[0].title.value; // 사용하기 쉽도록 변수를 선언하여 담아주고,
			var writer = document.forms[0].writer.value;
			var regdate = document.forms[0].regdate.value;
			//var content = document.forms[0].content.value;   

			if (title == null || title == "") { // null인지 비교한 뒤
				alert('제목을 입력하세요'); // 경고창을 띄우고
				document.forms[0].title.focus(); // 해당태그에 포커스를 준뒤
				return false; // false를 리턴합니다.
			}

			if (writer == null || writer == "") {
				alert('작성자를 입력하세요');
				document.forms[0].writer.focus();
				return false;
			} else if (writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null) {
				alert('이메일 형식으로 입력하세요');
				document.forms[0].writer.focus();
				return false;
			}

			if (regdate == null || regdate == "") {

				alert('날짜를 입력하세요');
				document.forms[0].regdate.focus();
				return false;

			} else if (regdate.match(/^\d\d\d\d\d\d+$/ig) == null) {
				alert('숫자 형식(6자리)으로 입력하세요');
				document.forms[0].regdate.focus();
				return false;
			}

		} // function end
	</script>
</body>
</html>



