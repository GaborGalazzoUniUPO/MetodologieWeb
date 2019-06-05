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


<div class="card">
	<header class="card-header">
		<h4 class="card-title mt-2">Product Form</h4>
	</header>
	<article class="card-body">
		<form action="${pageContext.request.contextPath}/product/add" method="post">
			<div class="form-row">
				<div class="col form-group">
					<label>Name</label>
					<input type="text" class="form-control  ${errors.name != null?'is-invalid':''}" placeholder="" name="name" value="${product.name}">
					<div class="invalid-feedback">
						${errors.name}
					</div>
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>Code</label>
					<input type="text" class="form-control ${errors.code != null?'is-invalid':''}" placeholder="" name="code" value="${product.code}">
					<div class="invalid-feedback">
						${errors.code}
					</div>
				</div> <!-- form-group end.// -->
			</div> <!-- form-row end.// -->
			<div class="form-row">
				<div class="col form-group">
					<label>Unit Price</label>
					<input type="text" class="form-control  ${errors.unit_price != null?'is-invalid':''}" placeholder="" name="unit_price"
						   value="${product.unitPrice}">
					<div class="invalid-feedback">
						${errors.unit_price}
					</div>
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>Category</label>
					<select class="form-control   ${errors.category != null?'is-invalid':''}" onchange="populateCategoryInfo(this.value)" name="category">
						<option selected value="0"> -- Select an option --</option>
						<option value="1"  ${product.category == 1?'selected':''}> Book</option>
						<option value="2"  ${product.category == 2?'selected':''}> Comic</option>
						<option value="3"  ${product.category == 3?'selected':''}> Audio CD</option>
						<option value="4"  ${product.category == 4?'selected':''}> Vinyl</option>
						<option value="5"  ${product.category == 5?'selected':''}> DVD Movie</option>
						<option value="6"  ${product.category == 6?'selected':''}> Video Games</option>
					</select>
					<div class="invalid-feedback">
						${errors.category}
					</div>
				</div> <!-- form-group end.// -->
			</div> <!-- form-row end.// -->
			<div class="form-group">
				<label>Photo Url</label>
				<input type="text" class="form-control  ${errors.photo_url != null?'is-invalid':''}" placeholder="" name="photo_url" value="${product.photoUrl}">
				<div class="invalid-feedback">
					${errors.photo_url}
				</div>
			</div> <!-- form-group end.// -->
			<div class="form-group">
				<label> Description</label>
				<textarea name="description" class="form-control  ${errors.description != null?'is-invalid':''}" rows="3">${product.description}</textarea>
				<div class="invalid-feedback">
					${errors.description}
				</div>

			</div>
			<div class="form-group">
				<label> Small description</label>
				<textarea name="small_description" class="form-control  ${errors.small_description != null?'is-invalid':''}" rows="3">${product.smallDescription}</textarea>
				<div class="invalid-feedback">
					${errors.small_description}
				</div>
			</div>

			<div class="card disabled">
				<header class="card-header">
					<h6 class="card-title mt-2">Category Info</h6>
				</header>
				<article class="card-body">
					<i class="fas fa-spinner fa-pulse" id="wait_cat"></i>

					<div id="category_info"></div>

				</article>
			</div>

			<div class="form-group mt-3">
				<button type="submit" class="btn btn-primary btn-block"> Submit</button>
			</div> <!-- form-group// -->
		</form>
	</article> <!-- card-body end .// -->
</div>
<!-- card.// -->
<template id="_6">
	<div class="category-info">
		<div class="form-row">
			<div class="col form-group">
				<label>Platform</label>
				<input type="text" class="form-control" placeholder="" name="platform"
					   value="${product.categoryInfo.getOrDefault('Platform','')}">
			</div> <!-- form-group end.// -->
			<div class="col form-group">
				<label>Publisher</label>
				<input type="text" class="form-control" placeholder="" name="publisher"
					   value="${product.categoryInfo.getOrDefault('Publisher','')}">
			</div> <!-- form-group end.// -->
		</div> <!-- form-row end.// -->
		<div class="form-row">
			<div class="col form-group">
				<label>Publication year</label>
				<input type="text" class="form-control" placeholder="" name="publication_year"
					   value="${product.categoryInfo.getOrDefault('Publication year','')}">
			</div> <!-- form-group end.// -->
		</div> <!-- form-row end.// -->
		<div class="form-row">
		</div>
	</div>
</template>

<template id="_1">
	<div class="category-info">
		<div class="form-row">
			<div class="col form-group">
				<label>Author</label>
				<input type="text" class="form-control" placeholder="" name="author"
					   value="${product.categoryInfo.getOrDefault('Author','')}">
			</div> <!-- form-group end.// -->
			<div class="col form-group">
				<label>Editor</label>
				<input type="text" class="form-control" placeholder="" name="editor"
					   value="${product.categoryInfo.getOrDefault('Editor','')}">
			</div> <!-- form-group end.// -->
		</div> <!-- form-row end.// -->
		<div class="form-row">
			<div class="col form-group">
				<label>ISBN</label>
				<input type="text" class="form-control" placeholder="" name="isbn"
					   value="${product.categoryInfo.getOrDefault('ISBN','')}">
			</div> <!-- form-group end.// -->
			<div class="col form-group">
				<label>Print Length</label>
				<input type="text" class="form-control" placeholder="" name="length"
					   value="${product.categoryInfo.getOrDefault('Print Length','')}">
			</div> <!-- form-group end.// -->
		</div> <!-- form-row end.// -->
		<div class="form-row">
			<div class="col form-group">
				<label>Publication year</label>
				<input type="text" class="form-control" placeholder="" name="pub_year"
					   value="${product.categoryInfo.getOrDefault('Publication Year','')}">
			</div> <!-- form-group end.// -->
			<div class="col form-group"></div> <!-- form-group end.// -->
		</div> <!-- form-row end.// -->
	</div>
</template>

<template id="_3">
	<div class="category-info">
		<div class="form-row">
			<div class="col form-group">
				<label>Author</label>
				<input type="text" class="form-control" placeholder="" name="author"
					   value="${product.categoryInfo.getOrDefault('Author','')}">
			</div> <!-- form-group end.// -->
			<div class="col form-group">
				<label>Publication year</label>
				<input type="text" class="form-control" placeholder="" name="pub_year"
					   value="${product.categoryInfo.getOrDefault('Publication year','')}">
			</div> <!-- form-group end.// -->
		</div> <!-- form-row end.// -->

	</div>
</template>

<template id="_5">
	<div class="category-info">
		<div class="form-row">
			<div class="col form-group">
				<label>Director</label>
				<input type="text" class="form-control" placeholder="" name="director"
					   value="${product.categoryInfo.getOrDefault('Director','')}">
			</div> <!-- form-group end.// -->
			<div class="col form-group">
				<label>Publication year</label>
				<input type="text" class="form-control" placeholder="" name="pub_year"
					   value="${product.categoryInfo.getOrDefault('Publication year','')}">
			</div> <!-- form-group end.// -->
			<div class="col form-group">
				<label>Genre</label>
				<input type="text" class="form-control" placeholder="" name="genre"
					   value="${product.categoryInfo.getOrDefault('Genre','')}">
			</div> <!-- form-group end.// -->
		</div> <!-- form-row end.// -->
		<div class="form-row">
			<div class="col-4 form-group">
				<label>Actors</label>
				<input type="text" class="form-control " placeholder="" id="actor_input"/>
			</div> <!-- form-group end.// -->
			<div class="col-4 form-group">
				<label>&ensp;</label>
			<br/>
				<input type="button" class="btn btn-success " onclick="addActor()" value="Add">
			</div> <!-- form-group end.// -->
		</div> <!-- form-row end.// -->

		<input type="hidden" name="actors" id="actors">

		<div>
			<ul id="actor_list">

			</ul>
		</div>

	</div>
</template>

<script>

	var actors = [];

	function addActor(actor)
	{
		if (!actor)
			actor = $('#actor_input').val();
		if (actor.length < 3)
			return false;
		actors.push(actor);
		var actorList = '';
		$('#actor_list').empty();
		for (var i = 0; i<actors.length; i++)
			actorList += '<li index="'+i+'" ">' + actors[i] + '</li>';
		$('#actor_list').append(actorList);
		$('#actor_input').val("");
		$('#actors').join(',~,')
	}

	$('.category-info').hide();

	function populateCategoryInfo(category)
	{
		if (category == 2)
			category = 1;
		else if (category == 4)
			category = 3;
		$('#wait_cat').hide();
		$('#category_info').empty();
		$('#category_info').append(
			$('#_' + category).html()
		);
	}

	populateCategoryInfo(${product.category});

	<c:forEach items="${product.categoryInfo.get('Actors')}" var="actor" >
	addActor(${actor});
	</c:forEach>

</script>

<jsp:include page="../../common/footer.jsp"/>