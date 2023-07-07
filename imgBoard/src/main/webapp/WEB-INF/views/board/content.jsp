<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <%-- header.jsp 붙히기 --%>
   <%@ include file="../includes/header.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
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
               <div id="imgInput">
                  <c:forEach var="imgvo" items="${imgList}">
                     <img src="/resources/upload/${imgvo.filename}" class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" />
                  </c:forEach>
               </div>
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
         <div class="col py-2">
            <h6 class="m-0 font-weight-bold text-primary">
               <i class="far fa-comments"></i> Reply 
            </h6>
         </div>
      </div>
      <div class="card-body">
         <div class="comments">
         
            <!--  댓글 반복 샘플  
            <c:forEach begin="1" end="8">
            <div class="ml-1 mr-1 comment-li">
                     <p class="mb-1">
                        <img src="/resources/imgs/background.PNG" width="20"/>
                        <i class="fas fa-angle-double-right" style="color: #00d1c3;"></i>
                        <span class="font-weight-bold">user00</span>
                        <span class="small float-right">2021-12-25 12:10</span>
                     </p>
                     <p>
                        <img src="/resources/imgs/background.PNG" width="20"/>
                        <span>comments comments....</span>
                        <span class="float-right">
                           <button type="button" data-rno="" data-rgr="" data-rst="" data-rlev="" class="btn btn-sm btn-info addReplyBtn">답글</button>
                           <button type="button" data-rno="" class="btn btn-sm btn-danger delReplyBtn">삭제</button>
                        </span>
                     </p>
                     <hr />
                </div>
                  </c:forEach>-->
         
         </div>
         
         <div class="reply-pagination">
            <!--  댓글 페이지 번호 샘플  -->
            <nav aria-label="Page navigation example">
               <ul class="pagination justify-content-end">
               
                  <!--  동적처리 부분  
                  <li class="page-item">
                     <a class="page-link" href="/board/content?bno=${board.bno}&pageNum=1&listSize=10&sel=&keyword=">Previous</a>
                  </li>
                  <c:forEach var="num" begin="1" end="5">
                     <li class="page-item active">
                        <a class="page-link" href="/board/content?bno=${board.bno}&pageNum=${num}&listSize=10&sel=&keyword=">${num}</a>
                     </li>
                  </c:forEach>
                  <li class="page-item">
                     <a class="page-link" href="/board/content?bno=${board.bno}&pageNum=6&listSize=10&sel=&keyword=">Next</a>
                  </li>
                  -->
               </ul>
            </nav> <!-- // pagination -->
            
         </div> <!-- reply-pagination -->
      </div>
      
      <div class="card-footer">
         <div class="replyNew">
            <form id="replyNewForm" >
               <div class="mb-4">
                  <div class="form-group row">
                     <div class="col-sm-8">
                        <label for="rcontentInput" class="form-label">댓글</label>
                        <input type="text" name="rcontent" class="form-control form-control-md" id="rcontentInput" />
                     </div>
                     <div class="col-sm-4">
                        <label for="replyerInput" class="form-label">작성자</label>
                        <input type="text" name="replyer" class="form-control form-control-md" id="replyerInput"/>
                     </div>
                  </div>
                  <div class="form-group row">
                     <div class="col-sm-8"></div>
                     <div class="col-sm-4">
                        <button type="button" id="newReplyBtn" class="btn btn-sm btn-primary float-right">New Reply</button>
                     </div>
                  </div>
               </div>
            </form>
         </div>
         
         
         
      </div> <!-- // .card-body -->
      
   </div> <!-- // 댓글 div.card -->
   
   <script type="text/javascript">
   $(document).ready(function(){
      let bnoVal = '<c:out value="${board.bno}" />';  
      let comments = $("div.comments"); // 댓글목록 영역 태그
      let pageNum = 1;   
      let reply_pagination = $("ul.pagination"); // 댓글페이지번호 영역 태그
      getReplyList(1);
      
      // 댓글 목록 요청 
      function getReplyList(page) {
         console.log("list page : " + page);
         $.ajax({
            url: "/replies/list/"+bnoVal+"/"+page, 
            type: "get",
            success: function(result){
               console.log("list 요청 성공!!!");
               console.log(result);
               printList(result.list); 
               printReplyPagination(result.replyCount);  
            }, 
            error: function(e){
               console.log("list 요청 실패.....");
               console.log(e);
            }
         });
      }
      // 댓글목록 화면에 출력 
      function printList(list){
         let str = ''; 
         for(let i = 0; i < list.length; i++) {
            let tabSize = list[i].rlevel * 20; 
            str += '<div class="ml-1 mr-1 comment-li"><p class="mb-1">'; 
            if(list[i].rlevel > 0){
               str += '<img src="/resources/imgs/background.PNG" width="'+tabSize+'"/>';
               str += '<i class="fas fa-angle-double-right" style="color: #00d1c3;"></i>';
            }
            str += '<span class="font-weight-bold">'+list[i].replyer+'</span>';      
            str += '<span class="small float-right">'+timeFormat(list[i].regDate)+'</span></p></p>';
            if(list[i].rlevel > 0){
               str += '<img src="/resources/imgs/background.PNG" width="'+tabSize+'"/>';
            }
            str += '<span>'+list[i].rcontent+'</span>';
            str += '<span class="float-right">';
            str += '<button type="button" data-rno="'+list[i].rno+'" data-rgr="'+list[i].rgroup+'" data-rst="'+list[i].rstep+'" data-rlev="'+list[i].rlevel+'" class="btn btn-sm btn-info addReplyBtn">답글</button> ';
            str += '<button type="button" data-rno="'+list[i].rno+'" class="btn btn-sm btn-danger delReplyBtn">삭제</button>';
            str += '</span></p><hr /></div>';
         }
         comments.html(str);      
      }
      // 댓글페이지 번호 화면에 출력 
      function printReplyPagination(replyCount) {
         console.log("댓글페이지번호, replyCount : " + replyCount);
         // 전체 댓글수로 페이지번호 띄워줄 값들 계산 
         let endNum = Math.ceil(pageNum / 10.0) * 10;  
         let startNum = endNum - 9; 
         let prev = startNum != 1;  
         let next = false;          
         if(endNum * 10 >= replyCount) {
            endNum = Math.ceil(replyCount / 10.0); 
         }
         if(endNum * 10 < replyCount) {
            next = true; 
         }
         // 페이지 번호 띄워줄 HTML
         let str = ""; 
         if(prev) {
            str += "<a class='page-link' href='"+(startNum-1)+"'> prev </a>";
         }
         for(let i = startNum; i <= endNum; i++){
            str += "<a class='page-link' href='"+i+"'>&nbsp; "+ i +" &nbsp;</a>";
         }
         if(next) {
            str += "<a class='page-link' href='"+(endNum+1)+"'> next </a>";
         }
         reply_pagination.html(str)
      }
      // 댓글 페이지번호 이벤트 처리 
      reply_pagination.on("click", "a.page-link", function(e){
         e.preventDefault(); // a태그 기본기능 취소 (기본기능:href속성의 주소로 이동)
         let page_link_num = $(this).attr("href");
         console.log("댓글 페이지 번호 클릭! page_link_num : " + page_link_num);
         pageNum = page_link_num; // 현재 페이지번호를 이동하는 페이지번호로 변경 
         getReplyList(page_link_num); // 댓글 목록 다시 요청 
      }); 
      
      // 댓글 저장 버튼 이벤트 처리  
      $("#newReplyBtn").click(function(e){
         console.log("신규 댓글 저장 클릭!!");
         // 사용자가 입력한 rcontent, replyer 가져오기 
         let rcontentVal = $("#rcontentInput").val(); 
         let replyerVal = $("#replyerInput").val();
         console.log("rcontentVal : " + rcontentVal);
         console.log("replyerVal : " + replyerVal);
         if(!rcontentVal || !replyerVal){
            alert("댓글 내용과 작성자가 모두 기입되어야합니다.");
            return;
         }
         
         // 저장 요청할 데이터 객체로 준비 
         let newReplyData = {
               rcontent: rcontentVal,
               replyer: replyerVal,
               bno: bnoVal
         };

         insertReply(newReplyData);
      });
      // 댓글 저장 요청 
      function insertReply(replyData){
         console.log("replyData : " + replyData);
         $.ajax({
            url: "/replies/new",
            type: "post",
            data: JSON.stringify(replyData), 
            contentType: "application/json;charset=utf-8", 
            success: function(result){
               console.log("댓글 등록 요청 성공!!");
               console.log(result); 
               $("#rcontentInput").val("");
               $("#replyerInput").val("");
               getReplyList(pageNum); // 보던페이지 다시 요청 
            },
            error: function(e){
               console.log("댓글 등록처리 실패....");
               console.log(e);
            }
         });
         
      }

      // 댓글의 답글 버튼 클릭 이벤트 
      comments.on("click", "button.addReplyBtn", function(e){
         let rnoVal = $(this).data("rno");
         let rgrVal = $(this).data("rgr");
         let rstVal = $(this).data("rst");
         let rlevVal = $(this).data("rlev");
         
         
         let str = '<div class="mb-4"><div class="form-group row"><div class="col-sm-8">';
         str += '<label for="addReplyInput" class="form-label">답글</label>';
         str += '<input type="text" name="rcontent" class="form-control form-control-md" id="addReplyInput" />';
         str += '</div><div class="col-sm-4"><label for="addReplyerInput" class="form-label">작성자</label>';
         str += '<input type="text" name="replyer" class="form-control form-control-md" id="addReplyerInput"/>';
         str += '</div></div><div class="form-group row"><div class="col-sm-8"></div><div class="col-sm-4 float-right">';
         str += '<button type="button" id="saveReplyBtn" data-rno="'+rnoVal+'" data-rgr="'+rgrVal+'" data-rst="'+rstVal+'" data-rlev="'+rlevVal+'" ';
         str += 'class="btn btn-sm btn-primary">Add Reply</button> ';
         str += '<button type="button" id="cancelReplyBtn" class="btn btn-sm btn-secondary">Cancel</button> ';
         str += '</div></div></div><hr />';
         
         let parentDiv = $(this).parent().parent(); // .comment-li
         parentDiv.after(str); // 답글폼 추가 
      });
      
      // 답글 저장 버튼 이벤트 reply_container의 동적 button#saveReplyBtn
      comments.on("click", "button#saveReplyBtn",function(e){
         console.log("답글 저장 버튼 클릭!!!");
         // rcontent, replyer, bno, (rno, rgroup, rstep, rlevel )
          let rcontentVal = $("#addReplyInput").val();
         let replyerVal = $("#addReplyerInput").val();
         let rnoVal = $(this).data("rno");
         let rgroupVal = $(this).data("rgr");
         let rstepVal = $(this).data("rst"); 
         let rlevelVal = $(this).data("rlev");
         
         let addReplyData = {
               rcontent: rcontentVal,
               replyer: replyerVal,
               bno: bnoVal,
               rno: rnoVal,
               rgroup: rgroupVal,
               rstep: rstepVal, 
               rlevel: rlevelVal
         };
         
         insertReply(addReplyData);
         
      });
      
      // 답글 취소 버튼 이벤트 reply_container의 동적 button#cancelReplyBtn
      comments.on("click", "button#cancelReplyBtn",function(e){
         console.log("답글 취소 버튼 클릭!!!");
         getReplyList(pageNum); // 보던 댓글 페이지 다시 요청 
      });
      
      // 댓글 삭제 요청 
      comments.on("click", "button.delReplyBtn", function(e){
         console.log("댓글 삭제 버튼 클릭!!");
         let rnoVal = $(this).data("rno"); 
         console.log("삭제 rnoVal : " + rnoVal);
         $.ajax({
            url: "/replies/" + rnoVal,
            type: "delete",
            success: function(result){
               console.log("삭제 요청 성공!!");
               console.log(result);
               getReplyList(pageNum); // 보던 댓글 페이지 다시 요청 
            },
            error: function(e){
               console.log("삭제 요청 실패....");
               console.log(e);
            }
         });
      }); 
      
      
      // 날짜 변환 함수 
      function timeFormat(timeValue) {
         let dateObj = new Date(timeValue);
         let yy = dateObj.getFullYear(); 
         let mm = dateObj.getMonth() + 1; 
         let dd = dateObj.getDate(); 
         let hh = dateObj.getHours(); 
         let mi = dateObj.getMinutes(); 
         let ss = dateObj.getSeconds(); 
         console.log("------ timeFormat -----");
         
         let result = yy + "-" + (mm > 9 ? "":"0") + mm + "-" + (dd > 9 ? "":"0") + dd + " ";
         result += (hh > 9 ? "": "0") + hh + ":" + (mi > 9 ? "":"0") + mi + ":" + (ss > 9 ? "":"0") + ss;
         
         return result;
      }
      
   });
   </script>
   
   <%-- footer.jsp 붙히기 --%>       
   <%@ include file="../includes/footer.jsp" %>  
   