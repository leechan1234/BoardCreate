<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<!-- JQuery 라이브러리 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
/* 모달 스타일 */
.modal {
	display: none; /* 모달 기본으로 숨김 */
	position: fixed; /* 위치 고정 */
	z-index: 1; /* 다른 요소 위에 표시하기 위해 z-index 설정 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto; /* 스크롤바 생성을 위해 오버플로우 설정 */
	background-color: rgba(0, 0, 0, 0.7); /* 배경색과 투명도 설정 */
}

.modal-content {
	display: block; /* 모달 내용 블록 요소로 표시 */
	margin: 10% auto; /* 모달을 수직 및 수평 가운데로 정렬 */
	max-width: 700px; /* 모달 최대 너비 설정 */
	background-color: #fefefe;
	padding: 20px;
	border: 1px solid #888;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.modal-image {
	width: 100%; /* 이미지 가로 너비 100% 설정 */
	height: auto; /* 세로 크기에 맞게 자동 조정 */
}
</style>

<script>
	$(document).ready(function() {
		// 이미지를 클릭했을 때 모달 창 표시
		$('.modal-image-trigger').click(function() {
			$('.modal-image').attr('src', $(this).attr('src')); // 모달 내 이미지 소스 변경
			$('.modal').css('display', 'block'); // 모달 창 표시
		});

		// 모달 닫기 버튼 클릭 이벤트 처리
		$('.close').click(function() {
			$('.modal').css('display', 'none'); // 모달 창 숨김
		});
	});
</script>
</head>
<body>
	<h1>글 본문</h1>
	<!--  <h4> pageInfo : ${pageInfo}</h4>-->
	<table border="1">
		<tr>
			<td>글 고유번호</td>
			<td>${review.reviewnum}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${review.title}</td>
		</tr>

		<tr>
			<td>작성자</td>
			<td>${review.id}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${review.reg}</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><c:if test="${imgeList.size() == 0}">
					<img src="/resources/img/default.png" width="70px" />
				</c:if> <c:if test="${imgeList.size() != 0}">
					<c:forEach var="imgOne" items="${imgList}">
						<img class="modal-image-trigger"
							src="/resources/upload/${imgOne.path}" width="100px" />
					</c:forEach>
				</c:if></td>
		</tr>

		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="30" disabled>${review.content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<form action="/board/delete" method="post">
					<input type="hidden" name="reviewnum" value="${review.reviewnum}" />
					<input type="hidden" name="pageNum" value="${pageInfo.pageNum}" />
					<input type="hidden" name="listSize" value="${pageInfo.listSize}" />
					<input type="hidden" name="sel" value="${pageInfo.sel}" /> <input
						type="hidden" name="keyword" value="${pageInfo.keyword}" /> <input
						type="submit" value="삭제" />
				</form> <input type="button" value="리스트"
				onclick="window.location='/board/list?pageNum=${pageInfo.pageNum}&listSize=${pageInfo.listSize}&sel=${pageInfo.sel}&keyword=${pageInfo.keyword}'" />
			</td>
		</tr>
	</table>
	<br />
	<br />

	<!-- 모달 창 -->
	<div class="modal">
		<div class="modal-content">
			<span class="close">&times;</span> <img class="modal-image" src=""
				alt="Image" />
		</div>
	</div>
</body>
</html>
