<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set scope="request" var="approvalsList" value="${Submissions.searchByKapp(kapp, SubmissionHelper.requestsQueryOptions())}"/>

<div class="col-md-6 tasks widget report" widget-target="assigned-tasks" data-target="div.content" filter-target="div.filter">
	<div class="wrap">
		<header>
			<div class="label gray-darkest">
				My Assigned Tasks
			</div>
			<div class="filter">
				<a href="javascript:void(0);">
					Filter By
					<i class="icon fa fa-chevron-circle-down"></i>
				</a>
			</div>
		</header>
		<div class="content bg-gray-lightest">
			<table id="assignedTasksTable" class="hover"></table>
		</div>
	</div>
</div>