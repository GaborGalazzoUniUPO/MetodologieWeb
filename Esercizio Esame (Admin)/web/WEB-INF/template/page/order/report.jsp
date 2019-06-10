<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../common/header.jsp"/>
<jsp:useBean id="order" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Order"/>
<jsp:useBean id="msgs" scope="request" type="java.util.List<upo.gaborgalazzo.mweb.marketplace.domain.Message>"/>

<div class="w-75 mx-auto flex-shrink-0">
	<header class="mb-5">
		Report for order n: <a href="${pageContext.request.contextPath}/orders/${order.id}/manage/">${order.code}</a>
	</header>

	<c:forEach items="${msgs}" var="message">
		<div class=" ${message.type == 1?'text-left':'text-right'}">
			<article><p class="alert alert-info" style="display:inline-block; max-width: 60%">${message.text}</p>
			</article>
		</div>
	</c:forEach>

	<div class="mb-5 m-5 p-5">
		<div class="m-5">
		</div>
	</div>

</div>
<footer class="footer mt-auto py-3">
	<form class="" action="${pageContext.request.contextPath}/orders/${order.id}/report/"
		  method="post">
		<div class="px-5">
			<input type="hidden" name="order_id" value="${order.id}">
			<textarea name="text" class="form-control" placeholder="Insert your message here..."></textarea>
			<div class="text-right">
				<button type="submit" class="btn btn-primary mt-2 ">Submit</button>
			</div>
		</div>
	</form>
</footer>

<jsp:include page="../../common/footer.jsp"/>