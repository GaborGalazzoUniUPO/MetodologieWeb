<jsp:useBean id="product" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Product"/>
<jsp:useBean id="errors" scope="request" type="java.util.HashMap"/>
<div class="category-info">
    <div class="form-row">
        <div class="col form-group">
            <label>Author</label>
            <input type="text" class="form-control" placeholder="" name="author"
                   value="${product.categoryInfo.get("Author")}">
        </div> <!-- form-group end.// -->
        <div class="col form-group">
            <label>Publication year</label>
            <input type="text" class="form-control" placeholder="" name="pub_year"
                   value="${product.categoryInfo.get("Publication year") }">
        </div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->

</div>