<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>


<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:stylepack>
        <bundle:style src="${bundle.location}/css/dashboard.css" />
    </bundle:stylepack>
	<bundle:variable name="head">
		<title>${text.escape(space.name)} Dashboard</title>
	</bundle:variable>
	<section class="dashboard">
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
			<section class="reports">
				<c:import url="${bundle.path}/partials/perfstats.jsp"/>
				<c:import url="${bundle.path}/partials/securityview.jsp"/>
				<c:import url="${bundle.path}/partials/financeview.jsp"/>
				<c:import url="${bundle.path}/partials/inventory.jsp"/>
				<c:import url="${bundle.path}/partials/approvals.jsp"/>
				<c:import url="${bundle.path}/partials/requests.jsp"/>
			</section>
		</section>
	</section>
</bundle:layout>
