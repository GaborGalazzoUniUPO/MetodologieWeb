<!DOCTYPE HTML>
<html lang="en">
<jsp:include page="head.jsp"/>
<body>
<header class="navbar navbar-dark bg-white sticky-top flex-md-nowrap p-2  shadow-sm">
		<a class=" col-sm-3 col-md-2 mr-0" href="#">
			<div class="brand-wrap">
				<img class="logo" src="<%= request.getContextPath()%>/assets/images/logo-dark.png">
				<h2 class="logo-text">LOGO</h2>
			</div> <!-- brand-wrap.// --></a>
		<div class="w-100"></div>
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap">
				<a class="nav-link" href="#">Sign out</a>
			</li>
		</ul>
</header>


<div class="container-fluid">

	<div class="row">
		<jsp:include page="menu.jsp"/>
		<section class="section-content col-md-9 ml-sm-auto col-lg-10 pt-3 px-0">
			<div class="container">
