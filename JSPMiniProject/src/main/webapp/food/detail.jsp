<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
 <div class="container h-100">
  <div class="row h-100 align-items-center">
   <div class="col-12">
    <div class="bradcumb-title text-center">
     <h2>${vo.name }</h2>
    </div>
   </div>
  </div>
 </div>
</div>
<div class="breadcumb-nav">
 <div class="container">
  <div class="row">
   <div class="col-12">
    <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
     	
     </ol>
    </nav>
   </div>
  </div>
 </div>
</div>
	<section class="single_blog_area section_padding_80">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="row no-gutters">
                    
                    <table class="table">
                                   	<tr>
                                   		<td width="30%" class="text-center" rowspan="8">
                                   		
                                        <div class="post-thumb">
                                   		<img src="${vo.poster }" style="height: 300px; object-fit: cover">
                                   		</div>
                                   		</td>
                                   		<td colspan="2"><h3>${vo.name }</h3></td>                    	
                                   	</tr>
                                   	<tr>
                                   		<td width="10%">카테고리</td>
                                   		<td width="60%">${vo.type }</td>
                                   	</tr>
                                   	<tr>
                                   		<td width="10%">주소</td>
                                   		<td width="60%">${vo.address }</td>
                                   	</tr>
                                   	<tr>
                                   		<td width="10%">가격</td>
                                   		<td width="60%">${vo.price }</td>
                                   	</tr>
                                   	<tr>
                                   		<td width="10%">영업시간</td>
                                   		<td width="60%">${vo.time }</td>
                                   	</tr>
                                   	<tr>
                                   		<td width="10%">주차</td>
                                   		<td width="60%">${vo.parking }</td>
                                   	</tr>
                                   	<tr>
                                   		<td width="10%">테마</td>
                                   		<td width="60%">${vo.theme }</td>
                                   	</tr>
                                   	<tr>
                                   		<td width="10%">전화번호</td>
                                   		<td width="60%">${vo.phone }</td>
                                   	</tr>
                                   	<tr>
                                   		<td colspan="3">${vo.content }</td>
                                   	</tr>
                                   	<tr>
                                   		<td colspan="3" class="text-right">
                                   			<a href="#" class="btn btn-sm btn-success">좋아요</a>
                                   			<a href="#" class="btn btn-sm btn-primary">찜하기</a>
                                   			<a href="#" class="btn btn-sm btn-info">예약하기</a>
                                   			<a href="list.do" class="btn btn-sm btn-danger">목록</a>
                                   		</td>
                                   	</tr>
                                   </table>
                    
                    
                    	<div class="col-12 col-sm-12">
                    		<div class="related-post-area section_padding_50">
                                <h4 class="mb-30">인근 맛집</h4>
                                <div class="related-post-slider owl-carousel">
                                
									<c:forEach var="rvo" items="${list }">
									<c:if test="${rvo.no!=vo.no }">
                                    <div class="single-post">
                                        <!-- Post Thumb -->
                                        <div class="post-thumb">
                                            <img src="${rvo.poster }" title="${rvo.address }">
                                        </div>
                                        <!-- Post Content -->
                                        <div class="post-content">
                                            <div class="post-meta d-flex">
                                                <div class="post-author-date-area d-flex">
                                                    <%-- <!-- Post Author -->
                                                    <div class="post-author">
                                                        <a href="#">${rvo.type }</a>
                                                    </div>
                                                    <!-- Post Date -->
                                                    <div class="post-date">
                                                        <a href="#">${rvo.phone }</a>
                                                    </div> --%>
                                                </div>
                                            </div>
                                            <a href="#">
                                                <h6>${rvo.name }</h6>
                                            </a>
                                        </div>
                                    </div>
                                    </c:if>
                                	</c:forEach>
                                   
                                </div>
                            </div>
                    	</div>
                    	
                    	
                    	
                    </div>
                </div>
            </div>
        </div>
	</section>
</body>
</html>