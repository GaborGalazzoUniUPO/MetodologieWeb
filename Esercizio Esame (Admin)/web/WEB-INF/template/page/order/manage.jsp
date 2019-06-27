<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../common/header.jsp"/>
<jsp:useBean id="order" scope="request" type="upo.gaborgalazzo.mweb.marketplace.domain.Order"/>
<jsp:useBean id="errors" scope="request" type="java.util.Map<java.lang.String,java.lang.String>"/>
<div class="row">

    <main class="col-lg-9 col-sm-12 ">
        <div class="row">
            <div class="col col-6">
                <div class="card mb-3">
                    <div class="card-header">
                        Manage
                    </div>

                    <div class="card-body">

                        <form action="${pageContext.request.contextPath}/orders/${order.id}/manage/" method="post">
                            <div class="form-group">
                                <c:if test="${errors.success != null}">
                                    <div class="alert alert-success">${errors.success}</div>
                                </c:if>
                                <c:if test="${errors.exception != null}">
                                    <div class="alert alert-danger">${errors.exception}</div>
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label>Change status:</label>
                                <select class="form-control" name="status">
                                    <option value="0" ${order.status == 0?'selected':''} ${order.status > 0?'disabled':''} >To Process</option>
                                    <option value="1" ${order.status == 1?'selected':''} ${order.status > 1?'disabled':''}>Sent</option>
                                    <option value="2" ${order.status == 2?'selected':''} ${order.status > 2?'disabled':''}>Delivered</option>
                                    <option value="-1" ${order.status <0 ||order.status>  2?'selected':''}>Error
                                    </option>
                                </select>
                            </div> <!-- form-group end.// -->
                            <div class="form-group">
                                <label>Tracking Code:</label>
                                <input type="text" class="form-control" placeholder=""
                                       name="tracking_code" value="${order.trackingCode}">
                            </div> <!-- form-group end.// -->

                            <button type="submit" class="btn btn-primary btn-block">Update</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col col-6">
                <div class="card mb-3">
                    <div class="card-header">
                        Order information
                    </div>
                    <div class="card-body">
                        <dl>
                            <dt>Owner:</dt>
                            <dd>${order.ownerInfo}</dd>

                        </dl>
                        <dl>
                            <dt>Status:</dt>
                            <dd>${order.statusString}</dd>

                        </dl>
                        <dl>
                            <dt>Shipping Address:</dt>
                            <dd>${order.saInfo}</dd>

                        </dl>
                        <dl>
                            <dt>Payment Method:</dt>
                            <dd>${order.pmInfo}</dd>

                        </dl>
                        <dl>
                            <dt>Shipping Method:</dt>
                            <dd>${order.shipmentType==1 ?  'Courier service (€20)':'Postal mail (€10)'}</dd>
                        </dl>
                        <dl>
                            <dt>Payment Transaction:</dt>
                            <dd>${order.transaction}</dd>
                        </dl>
                        <dl>
                            <dt>Creation Date:</dt>
                            <dd>${order.createdAt}</dd>
                        </dl>
                        <dl>
                            <dt>Delivery Date:</dt>
                            <dd>${order.deliveredAt==null?'NOT DELIVERED':order.deliveredAt}</dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mb-3">
            <div class="card-header">Summary</div>
            <table class="table table-hover shopping-cart-wrap table-responsive-md">
                <thead class="text-muted">
                <tr>
                    <th scope="col">Product</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${order.products}" var="product">
                    <tr>
                        <td>
                            <figure class="media">
                                <div class="img-wrap"><img class="img-thumbnail img-sm"
                                                           src="${product.photoUrl}"/>
                                </div>
                                <figcaption class="media-body">
                                    <h6 class="title text-truncate"><a
                                            href="${pageContext.request.contextPath}/product/edit/${product.id}">${product.name} </a>
                                    </h6>
                                </figcaption>
                            </figure>
                        </td>
                        <td>
                                ${product.qta}
                        </td>
                        <td>
                            <div class="price-wrap">
                                <var class="price">€ <fmt:formatNumber type="number" maxFractionDigits="2"
                                                                       minFractionDigits="2"
                                                                       value="${product.unitPrice}"/> </var>
                                <small class="text-muted">(€ <fmt:formatNumber type="number" maxFractionDigits="2"
                                                                               minFractionDigits="2"
                                                                               value="${product.unitPrice}"/> each)
                                </small>
                            </div> <!-- price-wrap .// -->
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div> <!-- card.// -->
    </main>
    <aside class="col-lg-3 col-sm-12">

        <div class="box">
            Summary:
            <dl class="dlist-align mt-2">
                <dt>Num Items:</dt>
                <dd class="text-right">${order.itemCount}</dd>
            </dl>
            <dl class="dlist-align mt-2">
                <dt class="w-auto">Shipment Type:</dt>
                <dd class="text-right">${order.shipmentType==1 ?  'Courier service (€20)':'Postal mail (€10)'}</dd>
            </dl>
            <dl class="dlist-align mt-2">
                <dt class="w-auto">Subtotal:</dt>
                <dd class="text-right">€ <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                                           value="${order.total}"/></dd>
            </dl>
            <dl class="dlist-align h3 mt-4">
                <dt>Total:</dt>
                <dd class="text-right">€ <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                                           value="${order.total +(order.shipmentType==1 ? 20:10)}"/></dd>
            </dl>
        </div>
        <div class="mt-3">

            <a href="${pageContext.request.contextPath}/orders/${order.id}/report/" class="btn btn-outline-danger btn-block">Open report (${order.messagesCount})</a>
        </div>

    </aside>

</div>

<jsp:include page="../../common/footer.jsp"/>