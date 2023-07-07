<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1> Board Content Sample </h1>
	<h4> 게시글 내용들......</h4>
	<br />
	
	<h3> 댓글 </h3>
	<!-- 댓글 목록 영역 -->
	<div>
		<table id="reply-container" border="1">
		
			<tr>
				<td>rno</td>
				<td>댓글내용</td>
				<td>작성자</td>
				<td>작성시간</td>
				<td><button type="button" class="addReplyBtn" data-rno="">답글</button></td>
				<td><button type="button" class="delReplyBtn" data-rno="">삭제</button></td>
			</tr>	
		
		</table>
	</div> 
	<br />
	<!-- 댓글 페이지번호 pagination -->
	<div id="reply-pagination">
		<!-- 댓글 페이지 번호들 동적으로 추가 -->
	</div>
	<br /><hr /><br/>
	<div>
		<h3>New Reply Form</h3> 
		<form id="newReplyForm">
		<table>
			<tr>
				<td>
					<label for="rcontentInput">댓글</label>
					<textarea rows="2" cols="70" name="rcontent" id="rcontentInput"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<label for="replyerInput">작성자</label>
					<input type="text" name="replyer" id="replyerInput" /> 
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" id="newReplyBtn">댓글저장</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<script>
	$(document).ready(function(){
		let bnoVal = 16;  // 임의로 지정 (추후 content.jsp board.bno로 꺼내기)
		let reply_container = $("#reply-container"); // 댓글목록 영역 태그
		let pageNum = 1;  // 현재 댓글 페이지번호 
		let reply_pagination = $("#reply-pagination"); // 댓글페이지번호 영역 태그
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
					printList(result.list); // 목록 화면에 출력
					printReplyPagination(result.replyCount); // 페이지번호 출력 
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
				str += '<tr><td>'+list[i].rno+'</td><td><img src="/resources/imgs/background.PNG" width="'+tabSize+'" height="1rem" />';
				if(list[i].rlevel > 0){
					str += '<i class="fas fa-angle-double-right" style="color: #00d1c3;"></i>';
				}
				str += list[i].rcontent+'</td>';
				str += '<td>'+list[i].replyer+'</td><td>'+timeFormat(list[i].regDate)+'</td>';
				str += '<td><button type="button" class="addReplyBtn" data-rgr="'+list[i].rgroup+'" data-rst="'+list[i].rstep+'" data-rlev="'+list[i].rlevel+'" data-rno="'+list[i].rno+'">답글</button></td>';
				str += '<td><button type="button" class="delReplyBtn" data-rno="'+list[i].rno+'">삭제</button></td>';
				str += '</tr>';
			}
			reply_container.html(str);		
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
		reply_container.on("click", "button.addReplyBtn", function(e){
			let rnoVal = $(this).data("rno");
			let rgrVal = $(this).data("rgr");
			let rstVal = $(this).data("rst");
			let rlevVal = $(this).data("rlev");
			
			// 답글 작성할 수 있는 폼태그 화면 띄우기 	
			let str = '<tr><td colspan="6"><form id="addReplyForm"><table><tr><td>';
			str += '<label for="addReplyInput">답글</label>';
			str += '<textarea rows="2" cols="70" id="addReplyInput"></textarea>';
			str += '</td></tr><tr><td><label for="addReplyerInput">작성자</label>';
			str += '<input type="text" name="replyer" id="addReplyerInput" />';
			str += '</td></tr><tr><td> ';
			str += '<button type="button" data-rno="'+rnoVal+'" data-rgr="'+rgrVal+'" data-rst="'+rstVal+'" data-rlev="'+rlevVal+'" id="saveReplyBtn">답글저장</button>';
			str += '<button type="button" id="cancelReplyBtn">취소</button>';	
			str += '</td></tr></table></form></td></tr>';
			
			let parentTr = $(this).parent().parent(); 
			parentTr.after(str); // 답글폼 추가 
		});
		// 답글 저장 버튼 이벤트 reply_container의 동적 button#saveReplyBtn
		reply_container.on("click", "button#saveReplyBtn",function(e){
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
		reply_container.on("click", "button#cancelReplyBtn",function(e){
			console.log("답글 취소 버튼 클릭!!!");
			getReplyList(pageNum); // 보던 댓글 페이지 다시 요청 
		});
		
		// 댓글 삭제 요청 
		reply_container.on("click", "button.delReplyBtn", function(e){
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
	
	
	
	<br /><br /><br />
</body>
</html>