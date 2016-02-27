<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<!-- Build a list of variables to loop over later on. List includes alerts, submissions and approvals -->
<c:set scope="request" var="approvalsList" value="${Submissions.searchByKapp(kapp, SubmissionHelper.requestsQueryOptions())}"/>
<c:set scope="request" var="submissionsList" value="${Submissions.searchByKapp(kapp, SubmissionHelper.approvalsQueryOptions())}"/>

<bundle:stylepack>
	<bundle:style src="${bundle.location}/css/catalog.css" />
</bundle:stylepack>

<bundle:variable name="head">
    <title>${text.escape(kapp.name)} - Home</title>
</bundle:variable>
<section class="catalog bg-black">
    <section class="welcome">
        <div class="h2 center white lighter">
            Welcome ${text.escape(identity.user.displayName)}
        </div>
        <div class="h3 center dark-blue normal">
            What would you like to do?
        </div>
    </section>
    <section class="quick-links">
        <div class="row icons">
        	<div class="col-md-3">
        		<div class="panel">
        			<a class="white color-hover-ice" href="javascript:void(0)" aria-label="Go To My Dashboard">
        				<div class="icon" style="background: url(&quot;${bundle.location}/images/dashboard.png&quot;);background-size:contain;"></div>
        				<div class="iconLabel">Go To My Dashboard</div>
        				<div class="drop-shadow"></div>
        			</a>
        		</div>
        	</div>
        	<c:forEach items="${kapp.categories}" var="category">
        		<%-- If the category is not hidden, and it contains at least 1 form --%>
        		<c:if test="${fn:toLowerCase(category.getAttribute('Hidden').value) ne 'true' && fn:toLowerCase(category.getAttribute('Visible On Home Page').value) eq 'true'}">
        			<div class="col-md-3">
        				<div class="panel">
        					<a class="white color-hover-ice" href="${bundle.spaceLocation}/${kapp.slug}?page=categories&category=${category.name}" aria-label="${text.escape(category.name)}">
        						<div class="icon" style="background: url(&quot;${bundle.location}/images/${category.getAttribute('Home Page Image').value}&quot;);background-size:contain;"></div>
        						<div class="iconLabel">${text.escape(category.name)}</div>
        						<div class="drop-shadow"></div>
        					</a>
        				</div>
        			</div>
        		</c:if>
        	</c:forEach>
        </div>
    </section>
    <!-- Begin Widgets Section -->
    <section class="widgets bg-gray hidden-sm hidden-xs">
        <c:import url="${bundle.path}/partials/alerts.jsp"/>
        <div class="row itsm">
            <div class="col-md-6 tasks widget" widget-target="assigned-tasks" data-target="div.content" filter-target="div.filter">
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
            <div class="col-md-6 reports widget" widget-target="service-management" data-target="div.content" filter-target="div.filter">
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
        </div>
    </section>
    <!-- End Widgets Section -->




<!--
    <div class="tab-content">
    <div role="tabpanel" class="tab-pane" id="tab-requests">
        <h3>My Requests</h3>
        <c:set scope="request" var="submissionsList" value="${Submissions.searchByKapp(kapp, SubmissionHelper.requestsQueryOptions())}"/>
        <c:import url="${bundle.path}/partials/submissions.jsp" charEncoding="UTF-8"/>
    </div>
    <div role="tabpanel" class="tab-pane" id="tab-approvals">
        <h3>My Approvals</h3>
        <c:set scope="request" var="submissionsList" value="${Submissions.searchByKapp(kapp, SubmissionHelper.approvalsQueryOptions())}"/>
        <c:import url="${bundle.path}/partials/submissions.jsp" charEncoding="UTF-8"/>
    </div>
</div> -->