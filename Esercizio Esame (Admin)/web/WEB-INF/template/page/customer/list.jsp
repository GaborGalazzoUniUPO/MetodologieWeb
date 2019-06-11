<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../common/header.jsp"/>
<div id="users">
	<div class="form-group">
		<!-- class="search" automagically makes an input a search field. -->
		<input class="form-control search" placeholder="Search"/>
		<!-- class="sort" automagically makes an element a sort buttons. The date-sort value decides what to sort by. -->

	</div>

	<div class="card mt-3">
		<table class="table table-hover shopping-cart-wrap mt-3">

			<thead class="text-muted">
			<tr>
				<th scope="col"><span class="sort" data-sort="name">Name<i class="fa fa-sort"></i><i
						class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>
				<th scope="col"><span class="sort" data-sort="surname">Surname<i class="fa fa-sort"></i><i
						class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>
				<th scope="col"><span class="sort" data-sort="email">Email<i class="fa fa-sort"></i><i
						class="fa fa-sort-up"></i><i class="fa fa-sort-down"></i></span></th>


			</tr>
			</thead>
			<tbody class="list">


			<jsp:useBean id="customers" scope="request"
						 type="java.util.List<upo.gaborgalazzo.mweb.marketplace.domain.Customer>"/>
			<c:forEach items="${customers}" var="customer">

				<tr>
					<td class="name">
							${customer.name}
					</td>
					<td class="surname">
							${customer.surname}
					</td>
					<td>
						<a href="mailto:${customer.email}" class="email">${customer.email}</a>
					</td>
				</tr>
			</c:forEach>

			</tbody>
		</table>
	</div>
	<!-- card.// -->
</div>

<script>
	var options = {
		valueNames: ['name', 'surname', 'email']
	};

	var list = new List('users', options);

</script>
<jsp:include page="../../common/footer.jsp"/>