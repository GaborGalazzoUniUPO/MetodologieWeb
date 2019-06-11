<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../common/header.jsp"/>
<div id="orders">
	<div class="form-group">
		<!-- class="search" automagically makes an input a search field. -->
		<input class="form-control search" placeholder="Search"/>
		<!-- class="sort" automagically makes an element a sort buttons. The date-sort value decides what to sort by. -->

	</div>

	<div class="card mt-3">
	<table class="table table-hover shopping-cart-wrap">
		<thead class="text-muted">
		<tr>
			<th scope="col"><span class="sort" data-sort="code">Code<i class="fa fa-sort"></i><i
					class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>
			<th scope="col"><span class="sort" data-sort="customer">Customer<i class="fa fa-sort"></i><i
					class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>
			<th scope="col"><span class="sort" data-sort="status">Status<i class="fa fa-sort"></i><i
					class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>



			<th scope="col" ><span class="sort" data-sort="items">Items<i class="fa fa-sort"></i><i
					class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>
			<th scope="col" ><span class="sort" data-sort="massages">Massages<i class="fa fa-sort"></i><i
					class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>
			<th scope="col" ><span class="sort" data-sort="total">Total<i class="fa fa-sort"></i><i
					class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>
			<th scope="col"><span class="sort" data-sort="c_date">Created at<i class="fa fa-sort"></i><i
					class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>
			<th scope="col" class="text-right">Action</th>
		</tr>
		</thead>
		<tbody class="list">


		<jsp:useBean id="orders" scope="request" type="java.util.List<upo.gaborgalazzo.mweb.marketplace.domain.Order>"/>
		<c:forEach items="${orders}" var="order">

			<tr>
				<td>
					<figure class="media">
						<figcaption class="media-body">
							<h6 class="title text-truncate code" >${order.code}</h6>
						</figcaption>
					</figure>
				</td>
				<td class="owner">
						${order.ownerInfo}
				</td>
				<td class="status">
						${order.statusString}
				</td>
				<td class="items">
						${order.itemCount}
				</td>
				<td class="messages">
						${order.messagesCount}
				</td>
				<td>
					<div class="price-wrap">
						<var class="price total">€ <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${order.total}"/></var>
					</div> <!-- price-wrap .// -->
				</td>
				<td class="c_date">
						${order.createdAt}
				</td>
				<td class="text-right">
					<a href="${pageContext.request.contextPath}/orders/${order.id}/manage/" class="btn btn-outline-success"> Manage</a>
				</td>
			</tr>
		</c:forEach>

		</tbody>
	</table>


</div> <!-- card.// -->
</div>

<script>
	var options = {
		valueNames: [ 'code', 'owner', 'status', 'items', 'messages', 'total', 'c_date' ]
	};

	var list = new List('orders', options);
</script>
<jsp:include page="../../common/footer.jsp"/>
