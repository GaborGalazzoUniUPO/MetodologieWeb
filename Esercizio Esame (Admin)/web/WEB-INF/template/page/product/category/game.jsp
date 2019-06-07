<jsp:useBean id="product" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Product"/>
<jsp:useBean id="errors" scope="request" type="java.util.HashMap"/>
<div class="category-info">
    <div class="form-row">
        <div class="col form-group">
            <label>Platform</label>
            <input type="text" class="form-control" placeholder="" name="platform"
                   value="${product.categoryInfo.get("Platform")}">
        </div> <!-- form-group end.// -->
        <div class="col form-group">
            <label>Publisher</label>
            <input type="text" class="form-control" placeholder="" name="publisher"
                   value="${product.categoryInfo.get("Publisher")}">
        </div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->
    <div class="form-row">
        <div class="col form-group">
            <label>Publication year</label>
            <input type="text" class="form-control" placeholder="" name="publication_year"
                   value="${product.categoryInfo.get("Publication year")}">
        </div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->
    <div class="form-row">
    </div>
</div>