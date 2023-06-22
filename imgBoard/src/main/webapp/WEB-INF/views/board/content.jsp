<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<%-- header.jsp 붙히기 --%>
	<%@ include file="../includes/header.jsp" %>
    
    <!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Board Content</h1>
	<p class="mb-4"> 게시판 글 상세 페이지 입니다. </p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Board Content</h6>
		</div>
		<div class="card-body">
				<div class="mb-3">
					<label for="bnoInput" class="form-label">Bno</label>
					<input type="text" name="bno" class="form-control" id="bnoInput" value="${board.bno}" readonly/>
				</div>
				<div class="mb-3">
					<label for="titleInput" class="form-label">제목</label>
					<input type="text" name="title" class="form-control" id="titleInput" value="${board.title}" readonly/>
				</div>
				
				<div class="mb-3">
					<label for="contentInput" class="form-label">내용</label>
					<textarea name="content" class="form-control" rows="5" id="contentInput" readonly>${board.content}</textarea>
				</div>
				
				<div class="mb-3">
					<label for="imgInput" class="form-label">첨부이미지</label>
					<c:forEach var="imgvo" items="${imgList}">
						<img src="/resources/upload/${imgvo.filename}" width="300px" />
					</c:forEach>
				</div>
				
				<div class="mb-3">
					<label for="writerInput" class="form-label">작성자</label>
					<input type="text" name="writer" class="form-control" id="writerInput" value="${board.writer}" readonly/>
				</div>
				
				<div class="mb-3">
					<label for="regDateInput" class="form-label">작성일</label>
					<input type="text" name="email" class="form-control" id="regDateInput" value="${board.regDate}" readonly/>
				</div>
				
				<div class="mb-3">
					<label for="updateDateInput" class="form-label">수정일</label>
					<input type="text" name="email" class="form-control" id="updateDateInput" value="${board.updateDate}" readonly/>
				</div>
				
				<button type="button" class="btn btn-warning" onclick="window.location='/board/modify?bno=${board.bno}&pageNum=${pager.pageNum}&listSize=${pager.listSize}&sel=${pager.sel}&keyword=${pager.keyword}'" >수정</button>
				<form action="/board/delete" method="post" style="display:inline-block;" >
					<input type="hidden" name="bno" value="${board.bno}" />
					<input type="hidden" name="pageNum" value="${pager.pageNum}" />
					<input type="hidden" name="listSize" value="${pager.listSize}" />
					<input type="hidden" name="sel" value="${pager.sel}" />
					<input type="hidden" name="keyword" value="${pager.keyword}" />
					<button type="submit" class="btn btn-danger">삭제</button>
				</form>
				<button type="button" class="btn btn-info" onclick="window.location='/board/list?pageNum=${pager.pageNum}&listSize=${pager.listSize}&sel=${pager.sel}&keyword=${pager.keyword}'">List</button>
		</div>
	</div> <!-- // 글상세 div.card -->
	
	<!-- 댓글 + 댓글 페이지네이션 -->
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<i class="far fa-comments"></i> Reply
			</h6>
		</div>
		<div class="card-body">
			
			
			
		</div>
		<div class="card-footer">
			
			
			
		</div>
	</div> <!-- // 댓글 div.card -->
	
	
	<%-- footer.jsp 붙히기 --%>       
	<%@ include file="../includes/footer.jsp" %>  
	