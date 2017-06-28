<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
	 <jsp:include page="html-header.jsp">
	 <jsp:param  name="page" value="header"/>
 	 </jsp:include>

  <body>

    <div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">

              <h1 class="masthead-brand">お昼ご飯評価システム(仮)</h1>
              <nav>              
			     <jsp:include page="log-header.jsp">
				 <jsp:param  name="page" value="login"/>
			 	 </jsp:include>
			 	 
              </nav>
              

<!-- ------------------------------------------------------------------------------------------------- -->
				
				<c:if test="${!empty param.id && empty error}">
				<sql:query var="rs" dataSource="ds/lunch">
					SELECT * FROM REVIEW r JOIN LUNCH l WHERE r.lunch_name LIKE "${param.id}"
				</sql:query>
				<sql:query var="avg" dataSource="ds/lunch">
					SELECT * FROM REVIEW r JOIN LUNCH l WHERE r.lunch_name LIKE "${param.id}"
				</sql:query>
				<sql:query var="avg1" dataSource="ds/lunch">
					SELECT AVG(price) FROM REVIEW WHERE lunch_name LIKE "${param.id}"
				</sql:query>
	
				</c:if>
				
				<div align="center">
				
				<c:set var="lunch" value="${rs.rows[0]}"/>
                <c:set var="review" value="${avg.rows[0]}"/>
                <c:set var="review1" value="${avg1.rows[0]}"/>
				<h1>${param.title}</h1>
		
				<form action="${param.action}" method="post">
					<table>
						<tr>
							<th><label for="Name">Name</label></th>
							<td>${param.id}</td>
						</tr>
						<tr>
							<th><label for="location">Location</label></th>
							<td>${lunch.location}</td>
						</tr>
						<tr>
							<th><label for="taste">Taste</label></th>
							<td>${review.taste}</td>
						</tr>
						<tr>
							<th><label for="price">Price</label></th>
							<td>${review1.price}</td>
						</tr>
						<tr>
							<th><label for="volume">Volume</label></th>
							<td>${review.volume}</td>
						</tr>
						<tr>
							<th><label for="distances">Distances</label></th>
							<td>${review.distances}</td>
						</tr>
						<tr>
							<th><label for="variety">Variety</label></th>
							<td>${review.variety}</td>
						</tr>
					</table>
				</form>
				<p class="error">${error}</p>

					<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js">
			        </script>
 				       <div class="chart-container">
 					       <canvas id="myChart">
 				       </div>
 					       </canvas>
 				       <style>
  						  .chart-container {
  								position: relative;
							    width: 30vw;
							    height: 30vh;
							    }
						</style>
         			<script>
       					var ctx = document.getElementById("myChart").getContext('2d');
                        
       					Chart.defaults.global.defaultFontColor = 'silver';
        				new Chart(ctx, {
    							type: 'radar',
    						
    						data: {
        							labels: ["Taste", "Price", "Volume", "Distance", "Variety"],
        							datasets: [{
              										label: 'lunch',
              										borderWidth: 1,
             										backgroundColor: "rgba(153, 255, 51, 0.4)",
              										borderColor:     "rgba(153, 255, 51, 1)",
              										data:[${review.taste}, ${review1.price}, ${review.volume}, ${review.distances}, ${review.variety}]
              											
        							}]
        
    						},
    						options:{
    							scale:{
    								ticks:{
    									beginAtZero:true,
    						            max:5,
    						            min:0
    								}
    							}
    						}
    
						});
 

       
        		</script>
        	</div>
<!-- ------------------------------------------------------------------------------------------------- -->

        		
       				<br><br><br><br><br><br><br><br><br><br><br>
					<a href="javascript:history.back()">←　一覧ページへ戻る</a>
					<br>
					<div class="inner">
					<p>Copyright © <a href="http://www.comnic.co.jp/">comnic</a>-javalesson 2017</p>
					</div>
					
					</div>
					</div>
					</div>


        		
      <jsp:include page="html-footer.jsp"></jsp:include>
        		    
  </body>
</html>