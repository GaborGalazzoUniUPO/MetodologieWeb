<jsp:useBean id="product" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Product"/>
<jsp:useBean id="errors" scope="request" type="java.util.HashMap"/>

<%--
  Created by IntelliJ IDEA.
  User: Gaborando
  Date: 29/05/2019
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../common/header.jsp"/>

<c:if test="${errors.exception != null}">
	<p class="alert alert-danger">${errors.exception}</p>
</c:if>

<c:if test="${errors.success != null}">
	<p class="alert alert-success">${errors.success}</p>
</c:if>

<div class="card">
	<header class="card-header">
		<h4 class="card-title mt-2">Product Form (${product.categoryString})</h4>
	</header>
	<article class="card-body">
		<form action="${pageContext.request.contextPath}/product/${product.id > 0?"edit/":'add'}${product.id > 0?product.id:''}"
			  method="post">
			<input type="hidden" name="category" value="${product.category}">
			<div class="form-row">
				<div class="col col-md-6 form-group">
					<label>Name</label>
					<input type="text" class="form-control  ${errors.name != null?'is-invalid':''}" placeholder=""
						   name="name" value="${product.name}">
					<div class="invalid-feedback">
						${errors.name}
					</div>
				</div> <!-- form-group end.// -->
				<div class="col col-md-4 form-group">
					<label>Code</label>
					<input type="text" class="form-control ${errors.code != null?'is-invalid':''}" placeholder=""
						   name="code" value="${product.code}">
					<div class="invalid-feedback">
						${errors.code}
					</div>
				</div> <!-- form-group end.// -->
				<div class="col col-md-2 form-group">
					<label>Unit Price</label>
					<input type="text" class="form-control  ${errors.unit_price != null?'is-invalid':''}" placeholder=""
						   name="unit_price"
						   value="${product.unitPrice}">
					<div class="invalid-feedback">
						${errors.unit_price}
					</div>
				</div> <!-- form-group end.// -->
			</div> <!-- form-row end.// -->
			<div class="row">
				<div class="form-group col-10">
					<label>Photo Url</label>
					<input type="text" class="form-control  ${errors.photo_url != null?'is-invalid':''}" oninput="$('#image').attr('src', this.value);" placeholder=""
						   name="photo_url" value="${product.photoUrl}">
					<div class="invalid-feedback">
						${errors.photo_url}
					</div>

				</div> <!-- form-group end.// -->
				<div class="col-2">
					<div class="img-wrap"><img src="${product.photoUrl}" id="image" class="img-thumbnail img-sm" alt=""></div>
				</div>
			</div>
			<div class="form-group">
				<label> Description</label>
				<textarea name="description" class="form-control  ${errors.description != null?'is-invalid':''}"
						  rows="3">${product.description}</textarea>
				<div class="invalid-feedback">
					${errors.description}
				</div>

			</div>
			<div class="form-group">
				<label> Small description</label>
				<textarea name="small_description"
						  class="form-control  ${errors.small_description != null?'is-invalid':''}"
						  rows="3">${product.smallDescription}</textarea>
				<div class="invalid-feedback">
					${errors.small_description}
				</div>
			</div>

			<div class="card disabled">
				<header class="card-header">
					<h6 class="card-title mt-2">Category Info</h6>
				</header>
				<article class="card-body">

					<div id="category_info">
						<c:choose>
							<c:when test="${product.category == 1 || product.category == 2}">
								<jsp:include page="category/book.jsp"/>
							</c:when>

							<c:when test="${product.category == 3 || product.category == 4}">
								<jsp:include page="category/song.jsp"/>
							</c:when>

							<c:when test="${product.category == 5}">
								<jsp:include page="category/movie.jsp"/>
							</c:when>

							<c:when test="${product.category == 6}">
								<jsp:include page="category/game.jsp"/>
							</c:when>
						</c:choose>
					</div>

				</article>
			</div>

			<div class="form-group mt-3">
				<button type="submit" class="btn btn-primary btn-block"> Submit</button>
			</div> <!-- form-group// -->
		</form>
	</article> <!-- card-body end .// -->
</div>

<jsp:include page="../../common/footer.jsp"/>

