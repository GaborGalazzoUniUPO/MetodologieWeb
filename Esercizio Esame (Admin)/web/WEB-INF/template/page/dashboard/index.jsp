<%--
  Created by IntelliJ IDEA.
  User: Gaborando
  Date: 29/05/2019
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../common/header.jsp"/>

<div>
	<div class="row">
		<div class="col">
			<article class="box">
				<figure class="itemside">
					<div class="aside align-self-center">
					<span class="icon-wrap icon-md round bg-warning">
						<i class="fa fa-user white"></i>
					</span>
					</div>
					<figcaption class="text-wrap">
						<h5 class="title">NEW USERS</h5>
						<h2 class="text-muted">${requestScope.new_users} </h2>
						<p class="text-muted">for last 7 days</p>
					</figcaption>
				</figure> <!-- iconbox // -->
			</article> <!-- panel-lg.// -->
		</div><!-- col // -->

		<div class="col">
			<article class="box">
				<figure class="itemside">
					<div class="aside align-self-center">
					<span class="icon-wrap icon-md round bg-success">
						<i class="fa fa-list white"></i>
					</span>
					</div>
					<figcaption class="text-wrap">
						<h5 class="title">NEW ORDERS</h5>
						<h2 class="text-muted">${requestScope.new_orders} </h2>
						<p class="text-muted">for last 7 days</p>
					</figcaption>
				</figure> <!-- iconbox // -->
			</article> <!-- panel-lg.// -->
		</div><!-- col // -->

		<div class="col">
			<article class="box">
				<figure class="itemside">
					<div class="aside align-self-center">
					<span class="icon-wrap icon-md round bg-primary">
						<i class="fa fa-euro-sign white"></i>
					</span>
					</div>
					<figcaption class="text-wrap">
						<h5 class="title">TOTAL INCOME</h5>
						<h2 class="text-muted">€ <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${requestScope.total_income}"/></h2>
						<p class="text-muted">for last 7 days</p>
					</figcaption>
				</figure> <!-- iconbox // -->
			</article> <!-- panel-lg.// -->
		</div><!-- col // -->
	</div>
	<div class="row mt-3">
		<div class="col-4">
			<div class="card">
				<div class="card-header">
					Order to process
				</div>
				<div class="card-body">
					<table class="table">
						<thead class="text-muted">
						<tr>
							<th>Code</th>
							<th>#Items</th>
							<th>Total</th>
							<th>Date</th>
						</tr>
						</thead>
						<tbody>
					<jsp:useBean id="toProcess" scope="request" type="java.util.List<upo.gaborgalazzo.mweb.marketplace.domain.Order>"/>
					<c:forEach items="${toProcess}" var="order">
						<tr>
							<td>
							<a href="${pageContext.request.contextPath}/orders/${order.id}/manage/">${order.code}</a>
							</td>
							<td>${order.itemCount}</td>
							<td><div class="price-wrap">
								<var class="price total">€ <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${order.total}"/></var>
							</div> <!-- price-wrap .// --></td>
							<td>${order.createdAt}</td>
						</tr>
					</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="card">
				<div class="card-header">
					Order with new report
				</div>
				<div class="card-body">
					<table class="table">
						<thead class="text-muted">
						<tr>
							<th>Code</th>
							<th>Messages</th>
						</tr>
						</thead>
						<tbody>
						<jsp:useBean id="newReport" scope="request" type="java.util.List<upo.gaborgalazzo.mweb.marketplace.domain.Order>"/>
						<c:forEach items="${newReport}" var="order">
							<tr>
								<td>
									<a href="${pageContext.request.contextPath}/orders/${order.id}/manage/">${order.code}</a>
								</td>
								<td>   <a href="${pageContext.request.contextPath}/orders/${order.id}/report/" class="btn btn-outline-danger btn-block">Open report (${order.messagesCount})</a>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../../common/footer.jsp"/>