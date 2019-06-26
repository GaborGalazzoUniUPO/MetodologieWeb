<%@ page import="javax.servlet.jsp.jstl.core.LoopTagStatus" %>
<jsp:useBean id="product" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Product"/>
<jsp:useBean id="errors" scope="request" type="java.util.HashMap"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="category-info">
    <div class="form-row">
        <div class="col form-group">
            <label>Author</label>
            <input type="text" class="form-control ${errors.author != null?'is-invalid':''}" placeholder="" name="author"
                   value="${product.categoryInfo.get("Author")}">
            <div class="invalid-feedback">
                ${errors.author}
            </div>
        </div> <!-- form-group end.// -->
        <div class="col form-group">
            <label>Publication year</label>
            <input type="text" class="form-control ${errors.pub_year != null?'is-invalid':''}" placeholder="" name="pub_year"
                   value="${product.categoryInfo.get("Publication year") }">
            <div class="invalid-feedback">
                ${errors.pub_year}
            </div>
        </div> <!-- form-group end.// -->


    </div> <!-- form-row end.// -->
    <div class="form-row">
        <div class="col-4 form-group">
            <label>Track</label>
            <input type="text" class="form-control ${errors.tracks != null?'is-invalid':''}" placeholder=""
                   id="track_title"/>
            <div class="invalid-feedback">
                ${errors.tracks}
            </div>
        </div> <!-- form-group end.// -->
        <div class="col-1 form-group">
            <label>Duration</label>
            <input type="number" class="form-control ${errors.tracks != null?'is-invalid':''}" placeholder=""
                   id="track_duration"/>
            <div class="text-muted">
                in seconds
            </div>
        </div>
        <div class="col-1 form-group">
            <label>&ensp;</label>
            <br/>
            <input type="button" class="btn btn-success " onclick="addTrack()" value="Add">
        </div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->

    <div>
        <ul id="track_list">

        </ul>
    </div>

</div>

<script>
    var tracks = [];

    /**
     * @return {string}
     */
    function formatNumberLength(num, length) {
        var r = "" + num;
        while (r.length < length) {
            r = "0" + r;
        }
        return r;
    }


    function addTrack(track)
    {
        if (!track)
        {
            var time = parseInt($('#track_duration').val(),10);
            var minutes = Math.floor(time/60);
            var seconds = time - minutes * 60;
            track = $('#track_title').val() + " - (" + formatNumberLength(minutes,2) + ":"+formatNumberLength(seconds,2)+")";
        }
        if (track.length < 3)
            return false;
        tracks.push(track);
        $('#track_list').empty();
        for (var i = 0; i < tracks.length; i++)
        {
            $('#track_list').append('<li index="' + i + '" ">' + tracks[i] + '  <a href="#"><span class="text-danger" onclick="return removeTrack(' + i + ')">(x)</span></a></li>');
            $('#track_list').append('<input type="hidden"  name="tracks" value=\'' + tracks[i] + '\'/>');
        }
        $('#track_title').val("");
        $('#track_duration').val("");


    }

    function removeTrack(index)
    {
        tracks.splice(index, 1);
        $('#track_list').empty();
        for (var i = 0; i < tracks.length; i++)
        {
            $('#track_list').append('<li index="' + i + '" ">' + tracks[i] + '<span class="text-danger" onclick="removeTrack(' + i + ')">(x)</span></li>');
            $('#track_list').append('<input type="hidden"  name="tracks" value=\'' + tracks[i] + '\'/>');
        }
        $('#track_title').val("");
        $('#track_duration').val("");

        return false;
    }

    <c:if test='${product.categoryInfo.getArray("Tracks") != null && product.categoryInfo.getArray("Tracks").size() > 0}'>
    <c:forEach begin="0" end='${product.categoryInfo.getArray("Tracks").size() -1 }' varStatus="loop">

    addTrack('<%= new String(product.getCategoryInfo().getArray("Tracks").getString((((LoopTagStatus)pageContext.findAttribute("loop")).getIndex())).getBytes(), "UTF-8").replaceAll("'","\\'") %>');
    </c:forEach>
    </c:if>
</script>