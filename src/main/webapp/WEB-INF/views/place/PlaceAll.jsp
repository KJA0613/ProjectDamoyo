<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장소 총집합</title>

<!-- 장소 광고 CSS -->
<style>
	.wrapper {
	    max-width: 1200px;
	    margin: 0 auto;
	    position: relative;
	}
	
	.wrapper ul.properties_list li {
	    display: block;
	    width: 30%;
	    height: auto;
	    position: relative;
	    float: left;	    
	    margin: 0 3% 3% 0;
	}
	
	.wrapper ul.properties_list li img.property_img {
	    width: 100%;
	    height: 350px;
	    vertical-align: top;
	}
	
	.wrapper ul.properties_list li .price {
	    position: absolute;
	    top: 10px;
	    left: 10px;
	    padding: 15px 20px;
	    background: #ffffff;
	    color: #514d4d;
	    font-size: 16px;
	    font-weight: bold;
	    letter-spacing: 1px;
    }
    
    .wrapper ul li .property_details {
	    width: 100%;
	    padding: 2.9% 5.8% 4.1% 5.8%;
	    border-bottom: 1px solid #f2f1f1;
	    border-left: 1px solid #f2f1f1;
	    border-right: 1px solid #f2f1f1;
    }
    
    .wrapper ul li .property_details h1 a {
	    text-decoration: none;
	    color: #666464;
	}
	 
	.wrapper ul li .property_details.title a{
	    color: #666464;
	    font-size: 28%;
	    font-weight: bold;
	    margin-left: 0px;
	    margin-bottom: 5px;
	    line-height: 28px;
	    vertical-align: baseline;
	    background: transparent;
	}
	
	.property_details h3 {
		color: #40b4e5;
		margin-left: 0px;
	    margin-bottom: 5px;
	    line-height: 25px;
	}
	
	.details {
		margin-left: 0;
	}
	
	#s1 {
		margin-left: 0px;
		color: #777;
		font-weight: bold;
		font-size: 16px;
		/* display: inline-block; */
    	/* padding: 0px 5px 0; */
	}
	
	#s2 {
	margin-left: 0px;
		color: #777;
		font-size: 16px;
		font-weight: normal;
	}	
</style>

<style type="text/css">
	img {
	    -webkit-transform:scale(1);
	    -moz-transform:scale(1);
	    -ms-transform:scale(1); 
	    -o-transform:scale(1);  
	    transform:scale(1);
	    -webkit-transition:.3s;
	    -moz-transition:.3s;
	    -ms-transition:.3s;
	    -o-transition:.3s;
	    transition:.3s;
	}
	.sample_image:hover img {
	    -webkit-transform:scale(1.2);
	    -moz-transform:scale(1.2);
	    -ms-transform:scale(1.2);   
	    -o-transform:scale(1.2);
	    transform:scale(1.2);
	}
	.sample_image {
		overflow: hidden;
	}
</style>
</head>
<body>

	<c:forEach var="plList" items="${plList}">	
		<ul class="properties_list">
			<li>
				<div class="sample_image">
					<a href="/place/PlaceDetail?placeNo=${plList.placeNo}">
					<img src="${plList.placeImage}" class="property_img"> 	</a>			
					<span class="price">${plList.placeCostChoice} :	<fmt:formatNumber value="${plList.placeCost}" pattern="#,###,###원"/></span>		
				</div>		
				
				<div class="property_details">
					<div class="title">
						<h3>
							<a href="/place/PlaceDetail?placeNo=${plList.placeNo}">${plList.placeName}</a>
						</h3>
					</div>
					<div class="details">
						<span id="s1">지역</span>&nbsp;&nbsp; <span id="s2">${plList.placeAddr3}</span>
						<br> <span id="s1">유형</span>&nbsp;&nbsp; <span id="s2">${plList.placeType}</span>
						<br> <span id="s1">영업시간</span>&nbsp;&nbsp; <span id="s2">${plList.placeUseTime}</span>
					</div>
				</div>
			</li>
		</ul>
	</c:forEach>
	
</body>
</html>