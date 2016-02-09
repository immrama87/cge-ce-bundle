<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<bundle:variable name="head">
    <title>Kinetic Data ${text.escape(kapp.name)}</title>
</bundle:variable>
<section class="menu">
    <!--<ul class="nav nav-pills">
        <c:set var="pageHome" value="${kapp.getForm('home')}" scope="page"/>
        <li role="presentation" class="active">
            <a href="#tab-home" aria-controls="tab-home" role="tab" data-toggle="tab">Home</a>
        </li>
        <li role="presentation">
            <a href="#tab-requests" aria-controls="tab-requests" role="tab" data-toggle="tab">My Requests</a>
        </li>
        <li role="presentation">
            <a href="#tab-approvals" aria-controls="tab-approvals" role="tab" data-toggle="tab">My Approvals</a>
        </li>
    </ul>-->
	<div class="col-md-3">
				<div class="panel">
					<a class="color-white color-hover-ice" href="javascript:void(0)" aria-label="Go To My Dashboard">
						<div class="icon" style="background: url(&quot;${bundle.location}/images/dashboard.png&quot;);"></div>
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
					<a class="color-white color-hover-ice" href="javascript:void(0)" aria-label="${text.escape(category.name)}">
						<div class="icon" style="background: url(&quot;${bundle.location}/images/${category.getAttribute('Home Page Image').value}&quot;);"></div>
						<div class="iconLabel">${text.escape(category.name)}</div>
						<div class="drop-shadow"></div>
					</a>
				</div>
			</div>
		</c:if>
	</c:forEach>
</section>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="tab-home">
        <div class="row">
            <div class="col-md-8">
                <!--<h2>Service Items</h2>
                <%-- For each of the categories --%>
                
                <div class="category uncategorized">
                    <h3>
                        Uncategorized Forms
                    </h3>
                    <div class="row">
                        <c:forEach items="${kapp.forms}" var="form">
                            <%-- Only show New or Active forms --%>
                            <c:if test="${empty form.categories && (form.status eq 'New' || form.status eq 'Active')}">
                                <%-- Render the form panel --%>
                                <c:set scope="request" var="thisForm" value="${form}"/>
                                <c:import url="${bundle.path}/partials/formCard.jsp" charEncoding="UTF-8" />
                            </c:if>
                        </c:forEach>
                    </div>
                </div>-->
            </div>
            <div class="col-md-3 col-md-offset-1 hidden-xs" id="social-column" >
                <a class="twitter-grid" href="https://twitter.com/_/timelines/672792909733842945">A Collection on Twitter</a>
                <script async src="https://platform.twitter.com/widgets.js"></script>
            </div>
        </div>
    </div>
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
</div>