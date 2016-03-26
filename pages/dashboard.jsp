<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<%--
<bundle:stylepack>
	<bundle:style src="${bundle.location}/css/catalog.css" />
</bundle:stylepack>
--%>

<bundle:layout page="${bundle.path}/layouts/layout.jsp">
	<bundle:variable name="head">
		<title>${text.escape(space.name)} Dashboard</title>
	</bundle:variable>
	<div class="form-wrap">
		<section class="catalog">
			<header>
				My Managed Services Dashboard
				<div class="options">
					<i class="icon fa fa-th-large"></i> View Options <i class="icon fa fa-caret-down"></i>
					<div class="wrap hide" aria-hidden="true">
						<ul class="options">
						</ul>
					</div>
				</div>
			</header>
			<section class="widgets bg-gray hidden-sm hidden-xs">
				<c:import url="${bundle.path}/partials/alerts.jsp"/>
				<div class="row itsm">
					<c:import url="${bundle.path}/partials/approvals.jsp"/>
					<c:import url="${bundle.path}/partials/requests.jsp"/>
				</div>
				<div class="row itsm">
					<c:import url="${bundle.path}/partials/inventory.jsp"/>
				</div>
			</section>
		</section>
	</div>
</bundle:layout>
