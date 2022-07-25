<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* common css 파일 적용 안되서 임시로 걸어둠 */
.container {
	width: 566px;
	margin: 0 auto;
	margin-bottom: 120px;
	margin-top: 100px;
}
.rv_title{
display:flex;
align-itmes:center;
margin-botton:20px;
position:relative;
font-size: 25px;
letter-spacing :-1px;
font-weight:500;
line-height: 1;
}
.rv_list > li{
border-top: 1px solid #ebebeb;
padding: 25px 0;
}
.rv_list.fisrt{
display:table;
width:100%;
box-sizing: border-box;
table-layout:fixed;
}
.rv_list.first.info1{
display:flex;
align-items:center;
flex-direction: row;
font-size; 15px;
color: #888;
lign-height:1;
font-weight: 500;
margin-right: 10px;
}
.conts{
margin-top:10px;
overflow: hidden;
position: relative;
}
.detail_txt review{
overflow: hidden;
text-overflow: ellipsis;
-webkit-line-clamp:2;
-webkit-box-oreint: vertical;
display: webkit-box;
max-height: 44px;
color: #666;
font-size: 14px;
line-height: 22px;
}

</style>
</head>
<body>
<div class="container">
<div class="rv_title">
		<h4>${acm.acm_name}의 전체후기</h4>
		<em class="rv_cnt_num">${total}건</em>
</div>		
		<div class="content">
		<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li><span class="txt_title">작성된 리뷰가 없습니다.</span></li>
				</ul>
		</c:if>
			<div class="rv_list">
			<c:if test="${list.size() != 0}">
			<div class="star_avg">★★★★★ &nbsp;<span class="text">${star_rate }</span> </div>
				<ul>
					<c:forEach var="acmReview" items="${list}">
						<li>
							<div class="first">
								<div class="info1">
			                    	<span class="nickname">${acmReview.nickname }</span>
			                    	<span class="rv_date">${acmReview.rv_regdate }</span>
				                    <span class="star_avg">★★★★★ ${acmReview.star_rate }</span>
			                    </div>
		                    </div>
		                    <div class="conts">
		                		<p class="detail_txt review">${acmReview.rv_content }</p>	
		                	</div>
		                	
		                	<div class="rv_photo">
		                		<c:if test="${acmReview.rvpic != null }">	
		                	<span class="rv_pic"><img alt="리뷰사진" src="resources/rvpic/${acmReview.rvpic}"
		                	width="200"></span>
		                		</c:if>
		                	</div>			
						</li>
					</c:forEach>
				</ul>
			</c:if>
			</div>
		</div>
	</div>
</body>
</html>