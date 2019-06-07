<jsp:useBean id="product" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Product"/>
<jsp:useBean id="errors" scope="request" type="java.util.HashMap"/>
<div class="category-info">
    <div class="form-row">
        <div class="col form-group">
            <label>Author</label>
            <input type="text" class="form-control  ${errors.author != null?'is-invalid':''}" placeholder=""
                   name="author"
                   value="${product.categoryInfo.get("Author")}">
            <div class="invalid-feedback">
                ${errors.author}
            </div>
        </div> <!-- form-group end.// -->
        <div class="col form-group">
            <label>Editor</label>
            <input type="text" class="form-control  ${errors.editor != null?'is-invalid':''}" placeholder=""
                   name="editor"
                   value="${product.categoryInfo.get("Editor")}">
            <div class="invalid-feedback">
                ${errors.editor}
            </div>
        </div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->
    <div class="form-row">
        <div class="col form-group">
            <label>ISBN</label>
            <input type="text" class="form-control  ${errors.isbn != null?'is-invalid':''}" placeholder=""
                   name="isbn"
                   value="${product.categoryInfo.get("ISBN")}">
            <div class="invalid-feedback">
                ${errors.isbn}
            </div>
        </div> <!-- form-group end.// -->
        <div class="col form-group">
            <label>Print Length</label>
            <input type="text" class="form-control  ${errors.length != null?'is-invalid':''}" placeholder=""
                   name="length"
                   value="${product.categoryInfo.get("Print length") }">
            <div class="invalid-feedback">
                ${errors.length}
            </div>
        </div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->
    <div class="form-row">
        <div class="col form-group">
            <label>Publication year</label>
            <input type="text" class="form-control  ${errors.pub_year != null?'is-invalid':''}" placeholder=""
                   name="pub_year"
                   value="${product.categoryInfo.get("Publication year") }">
            <div class="invalid-feedback">
                ${errors.pub_year}
            </div>
        </div> <!-- form-group end.// -->
        <div class="col form-group"></div> <!-- form-group end.// -->
    </div> <!-- form-row end.// -->
</div>