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
</head>
<body>
	<h1>글 본문(관리자)</h1>
	<!--  <h4> pageInfo : ${pageInfo}</h4>-->
	<table border="1">
		<tr>
			<td>글 고유번호</td>
			<td>${review.reviewnum}</td>
		</tr>
		<tr>
			<td>상품분류</td>
			<td>${review.ordertype}</td>
		</tr>
		<tr>
			<td>상품번호</td>
			<td>${review.productnum}</td>
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
						<img src="/resources/upload/${imgOne.path}" width="100px" />
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
				<form action="/admin/delete" method="post">
					<input type="hidden" name="reviewnum" value="${review.reviewnum}" />
					<input type="hidden" name="pageNum" value="${pageInfo.pageNum}" />
					<input type="hidden" name="listSize" value="${pageInfo.listSize}" />
					<input type="hidden" name="sel" value="${pageInfo.sel}" /> <input
						type="hidden" name="keyword" value="${pageInfo.keyword}" /> <input
						type="submit" value="삭제" />
				</form> <input type="button" value="리스트"
				onclick="window.location='/admin/reviewm/reviewlist?pageNum=${pageInfo.pageNum}&listSize=${pageInfo.listSize}&sel=${pageInfo.sel}&keyword=${pageInfo.keyword}'" />
			</td>
		</tr>
	</table>
	<br />
	<br />




</body>
</html>