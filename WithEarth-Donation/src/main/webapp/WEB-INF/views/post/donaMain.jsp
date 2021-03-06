<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" charset="utf-8"/>
<title>WithEarth</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	
	#banner{
	  margin-bottom : -200px;
	}
	
	#subTitle{
	 font-weight : bold;
	 color : #737373;
	
	}
	
	.article{	
	 width : 250px;
	 height : 320px;	 
	 padding : 15px;
	 
	 text-align : center;
	 margin-bottom : 30px;
	/*  border : 5px solid #EEE; */
	 border-radius: 20px;
	}
	
	.article-img{		
	 float : left;
	 width : 200px;
	 height :200px;
	}
	
	.img{
	 margin-left : 4px;
	 width : 230px;
	 height :190px; 
	 
	 image-rendering : auto;
	 border-radius: 10px;
	 border : 1px solid #EEE;
	 cursor: pointer;
	 
	 box-shadow: 1px 1px 0 #EEE;
   position: relative; 
   top:2px;

	}
	
	.article-title{
	  width : 200px;	  	 	
	  white-space: nowrap;  
	  overflow: hidden;
	  text-overflow: ellipsis;
	  font-weight : 500;
	  text-align: left;
	  font-size : 20px;
	  color : #02060D;
	}
	
	.article-heart{
	text-align: left;
	font-size : 15px;
	font-weight : 400;
	
	}
	.title{
	  font-size : 50px;
	  font-weight: bold;	  
	 color : #404040;
	}	
	.pBtn{
	  float : right;	 
	}
	
	#updateBtn{
	 border-radius: 25px !important;
	 width : 60px;
	}
	.searchForm {
	 margin-left : 730px;
	 overflow : hidden;
	 text-align: left;
	}
	
	#searchType{
	 width : 120px;
	 border-radius : 10px 0 0 10px;
	}
	
	.search-unit{
	  float : left; 
	}
	
	#searchBtn{
	  border-radius : 0 10px 10px 0;
	}
	
	.floating { 
	position: fixed;
	right: 50%;
	top: 280px; 
	margin-right: -720px; 
	text-align:center; 
	width: 120px; 
	}
	
 #writeFormBtn:active{
 box-shadow: 1px 1px 0 #DDD;
 position: relative; 
 top:2px;
}

.pagination{
  overflow : hidden;
  float : right; 
}

.paging{
  margin-right : 550px;
}

.page-link{
 border-radius: 3px 3px;
}

.notice{
  display : none; 
  border : 5px solid #5385c1;
  background-color : white;
  border-radius : 20px;
  width : 270px;
  height : 130px;  
  margin-left : 20px;
  position : fixed;
  top : 600px;
  right : 100px;
}

.noticeBtn{
  width : 40px !important;
  height : 30px !important;
  font-size : 15px !important;
  padding-right : 50px !important;
  padding-bottom : 45px !important;
  text-align : center !important;
  border-radius: 5px !important;
  margin : 10px !important;
  background-color:  #5385c1 !important;
 }
 
 .noticeMsg{
   margin-top : 30px;
   font-size : 15px;
 }

</style>	
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
       
    <section id="banner"></section>
			
		<section id="three" class="wrapper special">
				<div class="inner">
					<header class="align-center">
						<div class="title">????????????</div>
						<h3 id="subTitle"> ????????? ?????? ????????? ??????????????????! </h3>
					</header>
			    <form class="searchForm" action="<c:url value="/rest/user/post/list"/>">
			      <div class="search-unit">
					  <select id="searchType" name="searchType">
					    <option value="">????????????  ??? </option>
						  <option value="idx">?????????</option>
						  <option value="postTitle">??????</option>
						  <option value="both">?????????+??????</option>
					  </select>
				  	</div>
					  <div class="search-unit">
					    <input type="text" name="keyword" id="keyword" placeholder="???????????? ??????????????????."> 
					  </div>
					  <div class="search-unit">
					    <input type="button" id="searchBtn" value="??????">
					  </div>
				 </form>
				 
				 	<div class="flex flex-2" id="wrapContent" ></div>		
				  				   	
			    <div class="paging">
				     	<ul class="pagination"></ul>						 
			    </div>
	         
		  </div>			
		  	
	    <div class="notice"></div>		
	    
	    <div class="floating">	
	      <a href="<c:url value="/main/post/mypost?idx=1"/>"><input type="button" class="pBtn" id="updateBtn" value="My"></a>
	      <a href="<c:url value="/main/post/upload"/>"><img src="<c:url value="/image/write1.png"/>" class="pBtn" id="writeFormBtn" width="50px;"><br></a>  	
      </div>	
	</section>			

  
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>  
<script>

  // ??????????????? ????????? ?????? ??????
 	function getParameterByName(name) {
	  
	  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 	
	  
	  var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);	
	    
	  return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
  }
    
    var p = getParameterByName('p');
    console.log(p); 
    
 
     // ?????? ??????
     // ???????????? ????????? url??? ????????????.
		 var sock = new SockJS("<c:url value="/chat"/>");
					
		 //???????????? ????????? ??????????????? ??? ???????????? ???????????? function
		 sock.onmessage = onMessage;

		 //???????????? ??????????????? ???????????? ?????????
			sock.onclose = onClose;
				
		 // ????????? ????????? ??????????????? ?????? ?????????				
		 function onMessage(evt) { 
			console.log(evt.data);
			var data = evt.data; // ?????? ?????? ?????????				
					
			msgData = JSON.parse(data);
			
				  $('.notice').css('display', 'block');					  		  
			  							
			var html = '<h4 class="noticeMsg"><img src="<c:url value="/image/notice.png"/>" width="20px">';
			    html += msgData.userIdx+'?????????????????? ???????????? ??????????????????!</h4>';
			    html += '<input type="button" onclick="window.location.reload()" class="noticeBtn" id="laterBtn" value="?????????">';
			    html += '<input type="button" onclick="goChatRoom(); noticeNone();" class="noticeBtn" value="??????">';				    			 
				  		    
			    $('.notice').append(html);
				
		 }
		 
		  function noticeNone(){
			  
			  $('.notice').empty();
				$('.notice').css('display', 'none');
			  
		  }

		// ??????????????? ?????? (??? ??? ?????????)						
	  function goChatRoom(){
		child2 = window.open('<c:url value="/post/chat?donaIdx='+msgData.donaIdx+'&uid='+msgData.to+'&to='+msgData.userIdx+'&rid='+msgData.roomIdx+'"/>',"child2","width=330,height=600");
		}	
			
		// ?????? ??????
		function onClose(evt) {
		console.log(evt);		
		}
			
		// ?????? ??? ????????? ????????? ????????? ???????????? ?????????		
    function goPage(i){
    	
    	$('#wrapContent').empty();
		  $('.paging').empty();
		
		var searchType = $('#searchType').val();
		var keyword = $('#keyword').val();
	    console.log(searchType +':' + keyword);
		
		$.ajax({
			url : 'http://localhost:8080/dona/rest/user/post/list/search',
			type : 'GET',
			data : 'p='+ i + '&searchType=' +searchType + '&keyword='+keyword,
			success : function(data){
				console.log(data);
				var list = $(data.postList);
				console.log(list);
				
				$.each(list, function(index, item){
																													
					  var html =	'<div class="article" onClick="location.href=\'<c:url value="/main/post/detail?idx='+item.donaIdx+'"/>\'">';
						html += '<input type="hidden" value="'+item.donaIdx+'">';
					  html += '<div class="article-img">';
						html += '<img alt="thumbnail" class="img" src="<c:url value="/fileupload/post/s_'+item.files.fileName+'"/>">';	
						html += '</div>';
						html += '<div class="article-content">';
						html += '<div class="article-title">';
						html += item.postTitle+'</div>';
						html += '<div class="article-heart">';							
						html += '?????? '+item.heartCnt+'</div>';
						html += '</div></div>'			
														
						$('#wrapContent').append(html);		 
																																				
				 });
										
				   // ????????? ??????
					 if (data.totalPostCount>0){
						 
						 var pHtml = '<ul class="pagination"></ul>';
						 $('.paging').append(pHtml);
						 
						 console.log('totalPageCount :' + data.totalPageCount);
						for(var i=1; i <= data.totalPageCount; i++){				
							//var html2 =' [ <a href="<c:url value="/main/list/search"/>?p='+i+'&searchType='+searchType+'&keyword='+keyword+'">'+i+'</a> ] ';				
							//var html2 =' [ <a href="javascript:void(0);" onclick="javascript:goPage('+i+');">'+i+'</a> ] ';				
								var html2 = '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="javascript:goPage('+i+');">'+i+'</a></li>';							
								$('.pagination').append(html2);
						}					
					 };	
			}, error : function(e){
				console.log(e);
			}
		});
    }
     
    
		$(document).ready(function() {	
				
			// ?????? ????????? ?????? ??? ????????? ?????????
				$.ajax({
					  url : 'http://localhost:8080/dona/rest/user/post/list?p=' + p,
					  type : 'GET',
					  async : false,
					  success : function(data){				
						console.log(data);	
						 						 						 
						var list = $(data.postList);
						console.log(list);
						
						$.each(list, function(index, item){
																															
							  var html =	'<div class="article" onClick="location.href=\'<c:url value="/main/post/detail?idx='+item.donaIdx+'"/>\'">';
								html += '<input type="hidden" value="'+item.donaIdx+'">';
							  html += '<div class="article-img">';
								html += '<img alt="thumbnail" class="img" src="<c:url value="/fileupload/post/s_'+item.files.fileName+'"/>">';	
								html += '</div>';
								html += '<div class="article-content">';
								html += '<div class="article-title">';
								html += item.postTitle+'</div>';
								html += '<div class="article-heart">';							
								html += '?????? '+item.heartCnt+'</div>';
								html += '</div></div>'			
																
								$('#wrapContent').append(html);		 
																																						
						 });
												
						   // ????????? ??????
							 if (data.totalPostCount>0){
								 console.log('totalPageCount :' + data.totalPageCount);
								 							
								for(var i=1; i <= data.totalPageCount; i++){	
								  	var html2 = '<li class="page-item"><a class="page-link" href="<c:url value="/main/list"/>?p='+i+'">'+i+'</a></li>';
									  	//var html2 =' [ <a href="<c:url value="/main/list"/>?p='+i+'">'+i+'</a> ] ';													
								  	$('.pagination').append(html2);
								}												 
							 };								 																							    	
						  },error : function(request, status, error) {
								console.log("?????? ?????? : code = " +request.status + "message =" + request.responseText + "error : " + error);
							}
				});
				
				// ?????? ??? ????????? ?????????
				$('#searchBtn').click(function(){
					
					$('#wrapContent').empty();
					$('.paging').empty();
					
					var searchType = $('#searchType').val();
					var keyword = $('#keyword').val();
					
					$.ajax({
						url : 'http://localhost:8080/dona/rest/user/post/list/search',
						type : 'GET',
						data : 'p='+ p + '&searchType=' +searchType + '&keyword='+keyword,
						success : function(data){
							console.log(data);
							var list = $(data.postList);
							console.log(list);
							
							$.each(list, function(index, item){
																																
								  var html ='<div class="article" onClick="location.href=\'<c:url value="/main/post/detail?idx='+item.donaIdx+'"/>\'">';
									html += '<input type="hidden" value="'+item.donaIdx+'">';
								  html += '<div class="article-img">';
									html += '<img alt="thumbnail" class="img" src="<c:url value="/fileupload/post/s_'+item.files.fileName+'"/>">';	
									html += '</div>';
									html += '<div class="article-content">';
									html += '<div class="article-title">';
									html += item.postTitle+'</div>';
									html += '<div class="article-heart">';							
									html += '?????? '+item.heartCnt+'</div>';
									html += '</div></div>'			
																	
									$('#wrapContent').append(html);		 
																																							
							 });
													
							   // ????????? ??????
								 if (data.totalPostCount>0){
									 console.log('totalPageCount :' + data.totalPageCount);
									 										
									 var pHtml = '<ul class="pagination"></ul>';
									 $('.paging').append(pHtml);
									 
									for(var i=1; i <= data.totalPageCount; i++){				
										//var html2 =' [ <a href="<c:url value="/main/list/search"/>?p='+i+'&searchType='+searchType+'&keyword='+keyword+'">'+i+'</a> ] ';				
									  //var html2 =' [ <a href="javascript:void(0);" onclick="javascript:goPage('+i+');">'+i+'</a> ] ';																				   
										var html2 = '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="javascript:goPage('+i+');">'+i+'</a></li>';							
									   console.log(html2);
										 $('.pagination').append(html2);
									}			 							
								 };	
						}, error : function(e){
							console.log(e);
						}
					});
					
				});
			
			});
		
   </script>	
    </body>
    	
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    
</html>