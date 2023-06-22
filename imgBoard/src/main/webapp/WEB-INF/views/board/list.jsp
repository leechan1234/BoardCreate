<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<%-- header.jsp 붙히기 --%>
	<%@ include file="../includes/header.jsp" %>

	<%-- list content : 리스트 메인 영역  --%>
	
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Board</h1>
	<p class="mb-4"> 게시판 목록 페이지 입니다. </p>


	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary" style="line-height:2rem;">Board List Page
				<button type="button" class="btn btn-sm btn-primary float-right" onclick="window.location='/board/write'">New Board</button>
			</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" >
					<thead>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
							<th>조회수</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="board" items="${list}" varStatus="status">
							<tr>
								<td>${pageDTO.bnumber - status.index}</td>
								<td><a href="/board/content?bno=${board.bno}&pageNum=${pageDTO.pager.pageNum}&listSize=${pageDTO.pager.listSize}&sel=${pageDTO.pager.sel}&keyword=${pageDTO.pager.keyword}">${board.title}</a></td>
								<td>${board.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regDate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.updateDate}"/></td>
								<td>${board.readcount}</td>
							</tr>
						</c:forEach>
	          
					</tbody>
				</table>
				
				<!--  검색 기능  -->
				<div class="row">
					<div class="col-lg-12">
						<form action="/board/list" >
							<select name="sel">
								<option value=""
									<c:out value="${pageDTO.pager.sel == null ? 'selected' : ''}" />
								>---</option>
								<option value="t"
									<c:out value="${pageDTO.pager.sel == 't' ? 'selected' : ''}" />
								>제목</option>
								<option value="c"
									<c:out value="${pageDTO.pager.sel == 'c' ? 'selected' : ''}" />
								>내용</option>
								<option value="w"
									<c:out value="${pageDTO.pager.sel == 'w' ? 'selected' : ''}" />
								>작성자</option>
								<option value="tc"
									<c:out value="${pageDTO.pager.sel == 'tc' ? 'selected' : ''}" />
								>제목 or 내용</option>
								<option value="tw"
									<c:out value="${pageDTO.pager.sel == 'tw' ? 'selected' : ''}" />
								>제목 or 작성자</option>
								<option value="tcw"
									<c:out value="${pageDTO.pager.sel == 'tcw' ? 'selected' : ''}" />
								>제목 or 내용 or 작성자</option>
							</select>	
							<input type="text" name="keyword" value="${pageDTO.pager.keyword}" />
							<input type="hidden" name="pageNum" value="${pageDTO.pager.pageNum}" />
							<input type="hidden" name="listSize" value="${pageDTO.pager.listSize}" />
							<input type="submit" value="검색" />
						</form>					
					</div>
				</div> <!-- //검색기능 -->
				
				
				<!-- 페이지네이션 : 페이지 번호  -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-end">
					
						<c:if test="${pageDTO.prev}">
							<li class="page-item">
								<a class="page-link" href="/board/list?pageNum=${pageDTO.startPage - 1}&listSize=${pageDTO.pager.listSize}&sel=${pageDTO.pager.sel}&keyword=${pageDTO.pager.keyword}">Previous</a>
							</li>
						</c:if>
						
						<c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
							<c:if test="${num == pageDTO.pager.pageNum}">
								<li class="page-item active">
									<a class="page-link" href="/board/list?pageNum=${num}&listSize=${pageDTO.pager.listSize}&sel=${pageDTO.pager.sel}&keyword=${pageDTO.pager.keyword}">&nbsp; ${num} &nbsp;</a>
								</li>
							</c:if>
							<c:if test="${num != pageDTO.pager.pageNum}">
								<li class="page-item">
									<a class="page-link" href="/board/list?pageNum=${num}&listSize=${pageDTO.pager.listSize}&sel=${pageDTO.pager.sel}&keyword=${pageDTO.pager.keyword}">&nbsp; ${num} &nbsp;</a>
								</li>
							</c:if>
								
						</c:forEach>
						
						<c:if test="${pageDTO.next}">
							<li class="page-item">
								<a class="page-link" href="/board/list?pageNum=${pageDTO.endPage + 1}&listSize=${pageDTO.pager.listSize}&sel=${pageDTO.pager.sel}&keyword=${pageDTO.pager.keyword}">Next</a>
							</li>
						</c:if>
						
					</ul>
				</nav> <!-- // pagination -->
				
				
				
				
				
			</div>
		</div> <!-- card body -->
	</div>
 

             
	<%-- footer.jsp 붙히기 --%>       
	<%@ include file="../includes/footer.jsp" %>       
                    
                    
                    
                    
                    
                    