<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%-- header.jsp 붙히기 --%>
	<%@ include file="../includes/header.jsp" %>
	
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Board Form</h1>
	<p class="mb-4"> 게시판 글 작성 폼 입니다. </p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary" >New Board</h6>
		</div>
		<div class="card-body">
		
			<form action="/board/write" method="post" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="titleInput" class="form-label">제목</label>
					<input type="text" name="title" class="form-control" id="titleInput" >
				</div>
				
				<div class="mb-3">
					<label for="contentInput" class="form-label">내용</label>
					<textarea name="content" class="form-control" rows="5" id="contentInput"></textarea>
				</div>
				
				<div class="mb-3">
					<label for="writerInput" class="form-label">작성자</label>
					<input type="text" name="writer" class="form-control" id="writerInput" >
				</div>
				
				<div class="mb-3">
					<label for="fileInput" class="form-label">이미지 첨부</label>
					<input type="file" name="uploadFile" class="form-control" id="fileInput" multiple>
				</div>
				
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-warning">Reset</button>
				<button type="button" class="btn btn-info" onclick="window.location='/board/list'">List</button>
			</form>
			
		</div>
	</div> <!-- //div.card -->
	
	
	<%-- footer.jsp 붙히기 --%>       
	<%@ include file="../includes/footer.jsp" %>  
	
	