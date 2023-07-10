<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<!-- 유효성 검사  -->
<script>
	function validateForm() {
		var content = document.getElementById("content").value;
		if (content.length < 15) {
			alert("리뷰 내용은 최소 15글자 이상 입력해야 합니다.");
			return false;
		}
		return true;
	}

	function addFileInput() {
		const fileInputContainer = document
				.getElementById("fileInputContainer");
		const fileInput = document.createElement("input");
		fileInput.type = "file";
		fileInput.name = "uploadFile";
		fileInput.multiple = true;
		fileInputContainer.appendChild(fileInput);
	}
</script>
</head>
<body>
	<h1>캄퓨터 후기 리뷰 작성</h1>
	<form action="/board/write" method="post" enctype="multipart/form-data"
		onsubmit="return validateForm();">
		<input type="hidden" name="id" value="java" /> <br /> <label
			for="conum">주문 번호</label> 
			<select name="orderdata">
			<option value="parts-10421">[2023-07-05] 주문번호 : 부품 cpu 1</option>
			<option value="parts-9321">[2023-06-17] 주문번호 : 부품 쿨러 2</option>
			<option value="parts-8123">[2023-06-09] 주문번호 : 부품 메인보드 3</option>
			<option value="finished(완전체)-2031">[2023-06-09] 주문번호 : 완제품 1</option>
			<option value="finished-15213">[2023-06-09] 주문번호 : 완제품 2</option>
			<option value="custom-5123">[2023-05-19] 주문번호 : 주문제작 1</option>
			<option value="custom-4231">[2023-04-09] 주문번호 : 주문제작 2</option>
			<option value="custom-3123">[2023-03-07] 주문번호 : 주문제작 3</option>
		</select> <br /> <label for="title">리뷰 제목</label> <input type="text"
			name="title" id="title" required /><br /> <br /> <label
			for="content">리뷰 내용</label>
		<textarea name="content" id="content" required></textarea>
		<br /> <label for="fileInput" class="form-label">이미지 첨부</label>
		<div id="fileInputContainer">
			<input type="file" name="uploadFile" class="form-control" multiple>
		</div>
		<br />
		<button type="button" onclick="addFileInput()">사진 추가</button>
		<br />
		<button type="submit">작성 완료</button>
		<br />
		<button type="button" onclick="window.location='/board/list'">취소</button>
		<button type="reset">재작성</button>
	</form>
</body>
</html>