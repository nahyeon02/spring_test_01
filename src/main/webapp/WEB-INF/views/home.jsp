<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<script type="text/javascript">
	

$( document ).ready( function() {
   

    
  } );
	 
</script>
<style>

</style>
<body>
<c:set var="listSize" value="${fn:length(list) }" />
 <fmt:parseNumber value="${listSize div 6}"  var = "num" integerOnly="true" />
 ${num * 6}
 
<div class="wrap">
	<c:if test="${not empty list }">
		<c:set var="setDiv" value="1" />
		<c:set var="bigDivYn" value="Y" />
		<c:set var="listSize" value="${fn:length(list) }" />
		<c:forEach var="list" items="${list }" varStatus="vs">
			<c:set var="count" value="${vs.count }" />
			
			<c:choose>
				<c:when test="${setDiv eq 1 }">
					
					<c:choose>
						<c:when test="${ (count-1)%6 eq 0  or count eq 1}">
							<c:choose>
								<c:when test="${bigDivYn eq 'Y' }">
									<c:set var="bigDivYn" value="N" />
									<div class="right">
								</c:when>
								<c:otherwise>
									<c:set var="bigDivYn" value="Y" />
									<div class="left">
								</c:otherwise>
							</c:choose>
							
							<div>
								<video src=""></video>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<img alt="" src="">
							</div>
						</c:otherwise>
					</c:choose>
					<c:if test="${count%3 eq 0 or count eq listSize}">
						</div>
						<c:set var="setDiv" value="2" />
					</c:if>
					
				</c:when>
				
				<c:otherwise>
					<c:if test="${(count-1)%3 eq 0 }">
						<div class="bottom">
					</c:if>
							<div>
								<img alt="" src="">
							</div>
					<c:if test="${count%3 eq 0 or count eq listSize }">
						</div>
						<c:set var="setDiv" value="1" />
					</c:if>
					
				</c:otherwise>	
			</c:choose>
		
		</c:forEach>
	</c:if>
</div>	
	
	<!-- 
<div class="wrap">
	<div class="right">
		<div>
			<video src=""></video>1
		</div>
		<div>
			<img alt="" src="">2
		</div>
		<div>
			<img alt="" src="">3
		</div>
	</div>
	<div>
		<div>
			<img alt="" src="">4
		</div>
		<div>
			<img alt="" src="">5
		</div>
		<div>
			<img alt="" src="">6
		</div>
	</div>
	<div>
		<div>
			<video src=""></video>7
		</div>
		<div>
			<img alt="" src="">8
		</div>
		<div>
			<img alt="" src="">9
		</div>
	</div>
	<div>
		<div>
			<img alt="" src="">10
		</div>
		<div>
			<img alt="" src="">11
		</div>
		<div>
			<img alt="" src="">12
		</div>
	</div> 
</div>	
	-->



</body>
</html>
