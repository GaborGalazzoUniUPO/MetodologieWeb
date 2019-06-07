<jsp:useBean id="product" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Product"/>
<jsp:useBean id="errors" scope="request" type="java.util.HashMap"/>
<div class="category-info">
    <div class="form-row">
        <div class="col form-group">
            <label>Platform</label>
            <input type="text" class="form-control ${errors.platform != null?'is-invalid':''}" placeholder="" name="platform"
                   value="${product.categoryInfo.get("Platform")}">
            <div class="invalid-feedback">
                ${errors.platform}
            </div>
        </div> <!-- form-group end.// -->
        <div class="col form-group">
            <label>Publisher</label>
            <input type="text" class="form-control ${errors.publisher != null?'is-invalid':''}" placeholder="" name="publisher"
                   value="${product.categoryInfo.get("Publisher")}">
            <div class="invalid-feedback">
                ${errors.publisher}
            </div>
        </div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->
    <div class="form-row">
        <div class="col form-group">
            <label>Publication year</label>
            <input type="text" class="form-control ${errors.pub_year != null?'is-invalid':''}" placeholder="" name="pub_year"
                   value="${product.categoryInfo.get("Publication year")}">
            <div class="invalid-feedback">
                ${errors.pub_year}
            </div>
        </div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->
    <div class="form-row">
    </div>
</div>