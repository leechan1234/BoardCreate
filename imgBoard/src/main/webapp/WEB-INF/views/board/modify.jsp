<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<%-- header.jsp 붙히기 --%>
	<%@ include file="../includes/header.jsp" %>
	
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Modify Form</h1>
	<p class="mb-4"> 게시판 수정 폼 입니다. </p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary" >Modify Board</h6>
		</div>
		<div class="card-body">
		
			<form action="/board/modify" method="post" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="titleInput" class="form-label">제목</label>
					<input type="text" name="title" class="form-control" id="titleInput" value="${board.title}">
				</div>
				
				<div class="mb-3">
					<label for="contentInput" class="form-label">내용</label>
					<textarea name="content" class="form-control" rows="5" id="contentInput">${board.content}</textarea>
				</div>
				
				<div class="mb-3">
					<label for="writerInput" class="form-label">작성자</label>
					<input type="text" name="writer" class="form-control" id="writerInput" value="${board.writer}" readonly >
				</div>
				
				<div class="mb-3">
					<label for="imgInput" class="form-label">첨부이미지</label>
					<div id="imgInput">
						<c:forEach var="imgvo" items="${imgList}">
							<img src="/resources/upload/${imgvo.filename}" class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" />
							<input type="checkbox" name="removeFiles" value="${imgvo.fno}" /> 삭제
						</c:forEach>
					</div>
				</div>
				
				<div class="mb-3">
					<label for="fileInput" class="form-label">이미지 추가</label>
					<input type="file" name="uploadFile" class="form-control" id="fileInput" multiple>
				</div>
				
				<input type="hidden" name="bno" value="${board.bno}" />
				<input type="hidden" name="pageNum" value="${pager.pageNum}" />
				<input type="hidden" name="listSize" value="${pager.listSize}" />
				<input type="hidden" name="sel" value="${pager.sel}" />
				<input type="hidden" name="keyword" value="${pager.keyword}" />
				
				<button type="submit" class="btn btn-danger">수정완료</button>
				<button type="reset" class="btn btn-info">재작성</button>
				<button type="button" class="btn btn-warning" onclick="history.go(-1)">취소</button>
				<button type="button" class="btn btn-primary" onclick="window.location='/board/list?pageNum=${pager.pageNum}&listSize=${pager.listSize}&sel=${pager.sel}&keyword=${pager.keyword}'">List</button>
			</form>
			
		</div>
	</div> <!-- //div.card -->
	
	
	<%-- footer.jsp 붙히기 --%>       
	<%@ include file="../includes/footer.jsp" %>  
	
	