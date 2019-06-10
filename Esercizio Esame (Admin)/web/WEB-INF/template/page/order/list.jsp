<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../common/header.jsp"/>
<div class="card mt-3">
	<table class="table table-hover shopping-cart-wrap">
		<thead class="text-muted">
		<tr>
			<th scope="col">Code</th>
			<th scope="col">Customer</th>
			<th scope="col">Status</th>



			<th scope="col" >Items</th>
			<th scope="col" >Messages</th>
			<th scope="col" >Total</th>
			<th scope="col" class="text-right">Action</th>
		</tr>
		</thead>
		<tbody>


		<jsp:useBean id="orders" scope="request" type="java.util.List<upo.gaborgalazzo.mweb.marketplace.domain.Order>"/>
		<c:forEach items="${orders}" var="order">

			<tr>
				<td>
					<figure class="media">
						<figcaption class="media-body">
							<h6 class="title text-truncate">${order.code}</h6>
						</figcaption>
					</figure>
				</td>
				<td>
						${order.ownerInfo}
				</td>
				<td>
						${order.statusString}
				</td>
				<td>
						${order.itemCount}
				</td>
				<td>
						${order.messagesCount}
				</td>
				<td>
					<div class="price-wrap">
						<var class="price">€ <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${order.total}"/></var>
					</div> <!-- price-wrap .// -->
				</td>
				<td class="text-right">
					<a href="${pageContext.request.contextPath}/orders/${order.id}/manage/" class="btn btn-outline-success"> Manage</a>
				</td>
			</tr>
		</c:forEach>

		</tbody>
	</table>
</div> <!-- card.// -->

<jsp:include page="../../common/footer.jsp"/>
