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
				<sql:query var="avg1" dataSource="ds/lunch">
					SELECT AVG(taste) avg1 FROM REVIEW WHERE lunch_name LIKE "${param.id}"
				</sql:query>
				<sql:query var="avg2" dataSource="ds/lunch">
					SELECT AVG(price) avg2 FROM REVIEW WHERE lunch_name LIKE "${param.id}"
				</sql:query>
				<sql:query var="avg3" dataSource="ds/lunch">
					SELECT AVG(volume) avg3 FROM REVIEW WHERE lunch_name LIKE "${param.id}"
				</sql:query>
				<sql:query var="avg4" dataSource="ds/lunch">
					SELECT AVG(distances) avg4 FROM REVIEW WHERE lunch_name LIKE "${param.id}"
				</sql:query>
				<sql:query var="avg5" dataSource="ds/lunch">
					SELECT AVG(variety) avg5 FROM REVIEW WHERE lunch_name LIKE "${param.id}"
				</sql:query>
	
				</c:if>
				
				<div align="center">
				
				<c:set var="lunch" value="${rs.rows[0]}"/>
                <c:set var="review1" value="${avg1.rows[0]}"/>
                <c:set var="review2" value="${avg2.rows[0]}"/>
                <c:set var="review3" value="${avg3.rows[0]}"/>
                <c:set var="review4" value="${avg4.rows[0]}"/>
                <c:set var="review5" value="${avg5.rows[0]}"/>
                
				<h1>${param.title}</h1>
		
				<form action="${param.action}" method="post">
					<table>
						<tr>
							<th><label for="Name">店名</label></th>
							<td>${param.id}</td>
						</tr>
						<tr>
							<th><label for="location">場所</label></th>
							<td>${lunch.location}</td>
						</tr>
						<tr>
							<th><label for="taste">味</label></th>
							<td>${review1.avg1}</td>
						</tr>
						<tr>
							<th><label for="price">価格</label></th>
							<td>${review2.avg2}</td>
						</tr>
						<tr>
							<th><label for="volume">量</label></th>
							<td>${review3.avg3}</td>
						</tr>
						
						<tr>
							<th><label for="distances">距離</label></th>
							<td>${review4.avg4}</td>
						</tr>
						<tr>
							<th><label for="variety">種類</label></th>
							<td>${review5.avg5}</td>
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
        							labels: ["味", "価格", "量", "距離", "種類"],
        							datasets: [{
              										label: 'lunch',
              										borderWidth: 1,
             										backgroundColor: "rgba(153, 255, 51, 0.4)",
              										borderColor:     "rgba(153, 255, 51, 1)",
              											
              										data:[${review1.avg1}, ${review2.avg2}, ${review3.avg3}, ${review4.avg4}, ${review5.avg5}]
              											
        							}]
        
    						},
    						options:{
    							scale:{
    								pointLabels: {
    							        fontSize: 20 //フォントサイズ
    							      },
    			
    								ticks:{
    									beginAtZero:true,
    									 stepSize: 1,
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