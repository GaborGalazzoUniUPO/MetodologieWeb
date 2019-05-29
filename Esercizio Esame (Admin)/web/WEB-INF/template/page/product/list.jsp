<%--
  Created by IntelliJ IDEA.
  User: Gaborando
  Date: 28/05/2019
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../common/header.jsp"/>
<div class="card">
	<div class="card-body">
		<div class="text-right">
			<a href="${pageContext.request.contextPath}/product/add" class="btn btn-outline-primary">New</a>
		</div>
	</div>
</div>

<div class="card mt-3">
	<table class="table table-hover shopping-cart-wrap">
		<thead class="text-muted">
		<tr>
			<th scope="col">Product</th>
			<th scope="col" width="120">Quantity</th>
			<th scope="col" width="120">Price</th>
			<th scope="col" width="200" class="text-right">Action</th>
		</tr>
		</thead>
		<tbody>


		<jsp:useBean id="products" scope="request" type="java.util.List<upo.gaborgalazzo.mweb.marketplace.domain.Product>"/>
		<c:forEach items="${products}" var="product">

			<tr>
				<td>
					<figure class="media">
						<div class="img-wrap"><img src="${product.photoUrl}" class="img-thumbnail img-sm" alt=""></div>
						<figcaption class="media-body">
							<h6 class="title text-truncate">${product.name}</h6>
							<dl class="dlist-inline small">
								<dt>Size:</dt>
								<dd>XXL</dd>
							</dl>
							<dl class="dlist-inline small">
								<dt>Color:</dt>
								<dd>Orange color</dd>
							</dl>
						</figcaption>
					</figure>
				</td>
				<td>
					${product.qta}
				</td>
				<td>
					<div class="price-wrap">
						<var class="price">€ ${product.unitPrice}</var>
					</div> <!-- price-wrap .// -->
				</td>
				<td class="text-right">
					<a href="${pageContext.request.contextPath}/product/edit/${product.id}" class="btn btn-outline-success"> Edit</a>
				</td>
			</tr>
		</c:forEach>

		</tbody>
	</table>
</div> <!-- card.// -->

<jsp:include page="../../common/footer.jsp"/>
