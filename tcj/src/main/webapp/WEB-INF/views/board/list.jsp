<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>List</title>
</head>
<body>

	<h1> 더조은컴 후기 게시판(사용자) </h1>
	<table>
		<tr>
			<td>
				<button onclick="window.location='/board/write'">글작성</button>
			</td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>이미지</td>
			<td>제  목</td>
			<td>작성자</td>
			
			<td>작성일</td>
		</tr>
		<%-- items="${list}" : 컨트롤러에서 model로 보내준 글목록데이터 
			var="board" : 글 목록 데이터에서 하나 꺼낸거 담아주는 변수 = BoardVO
		--%>
		<c:forEach var="reviews" items="${list}" varStatus="status">
			<tr>
				<td>${reviews.reviewnum}</td>
				<td>
			
											
					<%-- 이미지가 리스트의 controller의 리뷰리스트 목록의 List<List<ReviewimgVO>> 배열 인덱스의값이 0일때 기본이미지 출력	--%>
					<c:if test="${imgList[status.index].size() == 0}">
						<img src="/resources/img/default.png" width="70px"/>
					</c:if>
					<%-- 이미지가 리스트의 controller의 리뷰리스트 목록의 List<List<ReviewimgVO>> 배열 인덱스의값이 0이 아닐때 사용자가 올린 이미지 출력	--%>
					<c:if test="${imgList[status.index].size() != 0}">
						<img src="/resources/upload/${imgList[status.index][0].path}" width="100px"/>
					</c:if>
				</td> 
				<td><a href="/board/content?reviewnum=${reviews.reviewnum}&pageNum=${pager.pageInfo.pageNum}&listSize=${pager.pageInfo.listSize}
				&sel=${pager.pageInfo.sel}&keyword=${pager.pageInfo.keyword}">${reviews.title}</a></td>
				
				<td>${reviews.id.substring(0, 2)}****</td>
				
				<td>${reviews.reg}</td>
			</tr>
		</c:forEach>
	</table>
	<br />
			
	
	<!-- pagination : 페이지 번호 -->
	<div> 현재페이지 : ${pager.pageInfo.pageNum} </div> <br />
	<div>
		<c:if test="${pager.prev}">
			<a href="/board/list?pageNum=${pager.startPage - 1}&listSize=${pager.pageInfo.listSize}&sel=${pager.pageInfo.sel}&keyword=${pager.pageInfo.keyword}">&lt; previous &nbsp;</a>
		</c:if>
		
		<c:forEach var="num" begin="${pager.startPage}" end="${pager.endPage}">
			<a href="/board/list?pageNum=${num}&listSize=${pager.pageInfo.listSize}&sel=${pager.pageInfo.sel}&keyword=${pager.pageInfo.keyword}">&nbsp; ${num} &nbsp;</a>
		</c:forEach>
		
		<c:if test="${pager.next}">
			<a href="/board/list?pageNum=${pager.endPage + 1}&listSize=${pager.pageInfo.listSize}&sel=${pager.pageInfo.sel}&keyword=${pager.pageInfo.keyword}">&nbsp; next &gt; </a>
		</c:if>
	</div>
	<br /><br />
	<!-- 검색 폼 -->
	<div>
		<form action="/board/list" method="get">
			<select name="sel">
				<option value=""
					<c:out value="${pager.pageInfo.sel == null ? 'selected' : ''}" />
				>---</option>
				<option value="t"
					<c:out value="${pager.pageInfo.sel == 't' ? 'selected' : ''}" />
				>제목</option>
				<option value="c"
					<c:out value="${pager.pageInfo.sel == 'c' ? 'selected' : ''}" />
				>내용</option>
				<option value="tc"
					<c:out value="${pager.pageInfo.sel == 'tc' ? 'selected' : ''}" />
				>제목 or 내용</option>
				<option value="tw"
					<c:out value="${pager.pageInfo.sel == 'ti' ? 'selected' : ''}" />
				>제목 or 작성자</option>
				<option value="tcw"
					<c:out value="${pager.pageInfo.sel == 'tci' ? 'selected' : ''}" />
				>제목 or 내용 or 작성자</option>
			</select>	
			<input type="text" name="keyword" value="${pager.pageInfo.keyword}" />
			<input type="hidden" name="pageNum" value="${pager.pageInfo.pageNum}" />
			<input type="hidden" name="listSize" value="${pager.pageInfo.listSize}" />
			<input type="submit" value="검색" />
		</form>
	</div>
	<br />
	<button onclick="window.location='/board/list'">전체 글보기</button>
	

	<br /><br /><br />
</body>
</html>