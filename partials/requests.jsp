<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<div class="col-md-6 report widget" widget-target="service-management" data-target="div.content" filter-target="div.filter">
	<div class="wrap">
		<header>
			<div class="label gray-darkest">
				Service Management View
			</div>
			<div class="filter">
				<a href="javascript:void(0);">
					Filter By
					<i class="icon fa fa-chevron-circle-down"></i>
				</a>
			</div>
		</header>
		<div class="content bg-gray-lightest">
			<table id="submissionsTable" class="hover"></table>
		</div>
	</div>
</div>