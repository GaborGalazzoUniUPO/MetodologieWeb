<jsp:useBean id="product" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Product"/>
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
					<input type="text" class="form-control" placeholder="" name="name" value="${product.name}">
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>Code</label>
					<input type="text" class="form-control" placeholder="" name="code" value="${product.code}">
				</div> <!-- form-group end.// -->
			</div> <!-- form-row end.// -->
			<div class="form-row">
				<div class="col form-group">
					<label>Unit Price</label>
					<input type="number" class="form-control" placeholder="" name="unit_price"
						   value="${product.unitPrice}">
				</div> <!-- form-group end.// -->
				<div class="col form-group">
					<label>Category</label>
					<select class="form-control" onchange="populateCategoryInfo(this.value)">
						<option disabled selected value> -- Select an option --</option>
						<option value="1" ${product.type == 1?'selected':''}> Book</option>
						<option value="2" ${product.type == 2?'selected':''}> Comic</option>
						<option value="3" ${product.type == 3?'selected':''}> Audio CD</option>
						<option value="4" ${product.type == 4?'selected':''}> Vinyl</option>
						<option value="5" ${product.type == 5?'selected':''}> DVD Movie</option>
						<option value="6" ${product.type == 6?'selected':''}> Video Games</option>
					</select>
				</div> <!-- form-group end.// -->
			</div> <!-- form-row end.// -->
			<div class="form-group">
				<label>Photo Url</label>
				<input type="text" class="form-control" placeholder="" name="photo_url" value="${product.photoUrl}">
			</div> <!-- form-group end.// -->
			<div class="form-group">
				<label> Description</label>
				<textarea name="description" class="form-control" rows="3">${product.description}</textarea>

			</div>
			<div class="form-group">
				<label> Small description</label>
				<textarea name="small_description" class="form-control" rows="3">${product.smallDescription}</textarea>

			</div>

			<div class="card disabled">
				<header class="card-header">
					<h6 class="card-title mt-2">Category Info</h6>
				</header>
				<article class="card-body">
					<i class="fas fa-spinner fa-pulse" id="wait_cat"></i>

					<div class="category-info" id="_1">
						<div class="form-row">
							<div class="col form-group">
								<label>Author</label>
								<input type="text" class="form-control" placeholder="" name="author"
									   value="${product.categoryInfoMap.get('Author')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group">
								<label>Editor</label>
								<input type="text" class="form-control" placeholder="" name="editor"
									   value="${product.categoryInfoMap.get('Editor')}">
							</div> <!-- form-group end.// -->
						</div> <!-- form-row end.// -->
						<div class="form-row">
							<div class="col form-group">
								<label>ISBN</label>
								<input type="text" class="form-control" placeholder="" name="isbn"
									   value="${product.categoryInfoMap.get('ISBN')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group">
								<label>Print Length</label>
								<input type="text" class="form-control" placeholder="" name="length"
									   value="${product.categoryInfoMap.get('Print Length')}">
							</div> <!-- form-group end.// -->
						</div> <!-- form-row end.// -->
						<div class="form-row">
							<div class="col form-group">
								<label>Publication year</label>
								<input type="text" class="form-control" placeholder="" name="pub_year"
									   value="${product.categoryInfoMap.get('Publication Year')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group"></div> <!-- form-group end.// -->
						</div> <!-- form-row end.// -->
					</div>

					<div class="category-info" id="_2">
						<div class="form-row">
							<div class="col form-group">
								<label>Author</label>
								<input type="text" class="form-control" placeholder="" name="_2[]"
									   value="${product.categoryInfoMap.get('Author')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group">
								<label>Editor</label>
								<input type="text" class="form-control" placeholder="" name="_2[]"
									   value="${product.categoryInfoMap.get('Editor')}">
							</div> <!-- form-group end.// -->
						</div> <!-- form-row end.// -->
						<div class="form-row">
							<div class="col form-group">
								<label>ISBN</label>
								<input type="text" class="form-control" placeholder="" name="_2[]"
									   value="${product.categoryInfoMap.get('ISBN')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group">
								<label>Print Length</label>
								<input type="text" class="form-control" placeholder="" name="_2[]"
									   value="${product.categoryInfoMap.get('Print length')}">
							</div> <!-- form-group end.// -->
						</div> <!-- form-row end.// -->
						<div class="form-row">
							<div class="col form-group">
								<label>Publication year</label>
								<input type="text" class="form-control" placeholder="" name="_2[]"
									   value="${product.categoryInfoMap.get('Publication year')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group"></div> <!-- form-group end.// -->
						</div> <!-- form-row end.// -->
					</div>

					<div class="category-info" id="_3">
						<div class="form-row">
							<div class="col form-group">
								<label>Author</label>
								<input type="text" class="form-control" placeholder="" name="author"
									   value="${product.categoryInfoMap.get('author')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group">
								<label>Publication year</label>
								<input type="text" class="form-control" placeholder="" name="pub_year"
									   value="${product.categoryInfoMap.get('publication_year')}">
							</div> <!-- form-group end.// -->
						</div> <!-- form-row end.// -->

					</div>

					<div class="category-info" id="_4">
						<div class="form-row">
							<div class="col form-group">
								<label>Author</label>
								<input type="text" class="form-control" placeholder="" name="author"
									   value="${product.categoryInfoMap.get('author')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group">
								<label>Publication year</label>
								<input type="text" class="form-control" placeholder="" name="pub_year"
									   value="${product.categoryInfoMap.get('publication_year')}">
							</div> <!-- form-group end.// -->
						</div> <!-- form-row end.// -->

					</div>

					<div class="category-info" id="_5">
						<div class="form-row">
							<div class="col form-group">
								<label>Director</label>
								<input type="text" class="form-control" placeholder="" name="director"
									   value="${product.categoryInfoMap.get('director')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group">
								<label>Publication year</label>
								<input type="text" class="form-control" placeholder="" name="pub_year"
									   value="${product.categoryInfoMap.get('publication_year')}">
							</div> <!-- form-group end.// -->
							<div class="col form-group">
								<label>Publication year</label>
								<input type="text" class="form-control" placeholder="" name="genre"
									   value="${product.categoryInfoMap.get('genre')}">
							</div> <!-- form-group end.// -->
						</div> <!-- form-row end.// -->
						<div class="form-row form-inline">
							<div class="form-group">
								<label>Actor1</label>
								<input type="text" class="form-control mx-3" placeholder="" id="actor_input">
							</div> <!-- form-group end.// -->
							<div class="btn btn-success" onclick="addActor()">Add</div>
							<ul id="actor_list">

							</ul>
						</div> <!-- form-row end.// -->

					</div>
				</article>
			</div>

			<div class="form-group mt-3">
				<button type="submit" class="btn btn-primary btn-block"> Submit</button>
			</div> <!-- form-group// -->
		</form>
	</article> <!-- card-body end .// -->
</div>
<!-- card.// -->

<script>

	var actors = [];
	function addActor()
	{
		var actor = $('#actor_input').value;
		actors.push(actor);
		var actorList = '';
		for (var a in actors)
			actorList += '<li>'+a+'</li>';
		$('#actor_list').innerHTML = actorList;
	}

	$('.category-info').hide();

	function populateCategoryInfo(category)
	{
		$('#wait_cat').hide();
		$('.category-info').hide();
		$('#_' + category).show();
	}
</script>

<jsp:include page="../../common/footer.jsp"/>