<jsp:useBean id="product" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Product"/>
<jsp:useBean id="errors" scope="request" type="java.util.HashMap"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="category-info">
    <div class="form-row">
        <div class="col form-group">
            <label>Director</label>
            <input type="text" class="form-control" placeholder="" name="director"
                   value="${product.categoryInfo.get("Director") }">
        </div> <!-- form-group end.// -->
        <div class="col form-group">
            <label>Publication year</label>
            <input type="text" class="form-control" placeholder="" name="pub_year"
                   value="${product.categoryInfo.get("Publication year") }">
        </div> <!-- form-group end.// -->
        <div class="col form-group">
            <label>Genre</label>
            <input type="text" class="form-control" placeholder="" name="genre"
                   value="${product.categoryInfo.get("Genre") }">
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

<script>
    var actors = [];

    function addActor(actor) {
        if (!actor)
            actor = $('#actor_input').val();
        if (actor.length < 3)
            return false;
        actors.push(actor);
        var actorList = '';
        $('#actor_list').empty();
        for (var i = 0; i < actors.length; i++)
            actorList += '<li index="' + i + '" ">' + actors[i] + '</li>';
        $('#actor_list').append(actorList);
        $('#actor_input').val("");
        $('#actors').val(actors.join(',~,'));
    }

    <c:forEach items='${product.categoryInfo.get("Actors").toString() }' var="actor">
    addActor('${actor}');
    </c:forEach>
</script>