<jsp:useBean id="product" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Product"/>
<jsp:useBean id="errors" scope="request" type="java.util.HashMap"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="category-info">
	<div class="form-row">
		<div class="col form-group">
			<label>Director</label>
			<input type="text" class="form-control ${errors.director != null?'is-invalid':''}" placeholder=""
				   name="director"
				   value="${product.categoryInfo.get("Director") }">
			<div class="invalid-feedback">
				${errors.director}
			</div>
		</div> <!-- form-group end.// -->
		<div class="col form-group">
			<label>Publication year</label>
			<input type="text" class="form-control ${errors.pub_year != null?'is-invalid':''}" placeholder=""
				   name="pub_year"
				   value="${product.categoryInfo.get("Publication year") }">
			<div class="invalid-feedback">
				${errors.pub_year}
			</div>
		</div> <!-- form-group end.// -->
		<div class="col form-group">
			<label>Genre</label>
			<input type="text" class="form-control ${errors.genre != null?'is-invalid':''}" placeholder="" name="genre"
				   value="${product.categoryInfo.get("Genre") }">
			<div class="invalid-feedback">
				${errors.genre}
			</div>
		</div> <!-- form-group end.// -->
	</div> <!-- form-row end.// -->
	<div class="form-row">
		<div class="col-4 form-group">
			<label>Actors</label>
			<input type="text" class="form-control ${errors.actors != null?'is-invalid':''}" placeholder=""
				   id="actor_input"/>
			<div class="invalid-feedback">
				${errors.actors}
			</div>
		</div> <!-- form-group end.// -->
		<div class="col-4 form-group">
			<label>&ensp;</label>
			<br/>
			<input type="button" class="btn btn-success " onclick="addActors()" value="Add">
		</div> <!-- form-group end.// -->
	</div> <!-- form-row end.// -->

	<div>
		<ul id="actor_list">

		</ul>
	</div>

</div>

<script>
	var actors = [];

	function addActors(a)
	{
		if (!a)
			a = $('#actor_input').val();

		a = a.split(",");
		for (var i = 0; i < a.length; i++)
			addActor(a[i]);

	}

	function addActor(actor)
	{
		if (!actor)
			actor = $('#actor_input').val();
		if (actor.length < 3)
			return false;
		actors.push(actor);
		$('#actor_list').empty();
		for (var i = 0; i < actors.length; i++)
		{
			$('#actor_list').append('<li index="' + i + '" ">' + actors[i] + '  <a href="#"><span class="text-danger" onclick="return removeActor(' + i + ')">(x)</span></a></li>');
			$('#actor_list').append('<input type="hidden"  name="actors" value="' + actors[i] + '"</input>');
		}
		$('#actor_input').val("");


	}

	function removeActor(index)
	{
		actors.splice(index, 1);
		$('#actor_list').empty();
		for (var i = 0; i < actors.length; i++)
		{
			$('#actor_list').append('<li index="' + i + '" ">' + actors[i] + '<span class="text-danger" onclick="removeActor(' + i + ')">(x)</span></li>');
			$('#actor_list').append('<input type="hidden"  name="actors" value="' + actors[i] + '"</input>');
		}
		$('#actor_input').val("");

		return false;
	}

	<c:if test='${product.categoryInfo.getArray("Actors") != null && product.categoryInfo.getArray("Actors").size() > 0}'>
	<c:forEach begin="0" end='${product.categoryInfo.getArray("Actors").size() -1 }' varStatus="loop">
	addActor('${product.categoryInfo.getArray("Actors").get(loop.index) }');
	</c:forEach>
	</c:if>
</script>