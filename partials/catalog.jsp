<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<bundle:variable name="head">
    <title>Kinetic Data ${text.escape(kapp.name)}</title>
</bundle:variable>
<section class="catalog">
    <section class="welcome">
        <div class="h1 center color-white lighter">
            Welcome ${text.escape(identity.username)}
        </div>
        <div class="h2 center color-dark-blue normal">
            What would you like to do?
        </div>
    </section>
    <section class="quick-links">
        <div class="row icons">
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
        </div>
    </section>
    <c:set scope="request" var="alertsList" value="${Submissions.searchByForm(space.getKapp('helper').getForm('alerts'))}"/>
    <section class="widgets background-gray hidden-sm hidden-xs">
        <div class="row color-black announcements">
            <div class="title col-md-2 color-gray-darkest">
                <i class="fa fa-bullhorn"></i>
                <h4>Announcements</h4>
            </div>
            <div class="col-md-10 messages background-gray-lightest">
                <div class="row" container-max="3">
                    <c:forEach items="${alertsList}" var="alert" varStatus="loop">
                        <c:set scope="request" var="hideshow" value=""/>
                        <c:if test="${loop.index gt 2}">
                            <c:set scope="request" var="hideshow" value="hide"/>
                        </c:if>


                        <div class="col-md-4 message ${hideshow}">
                            <div class="date">  
                                <div class="day">${alert.createdAt}</div>
                                <div class="mt">${alert.createdAt}</div>
                            </div>
                            <div class="content">
                                <h3 class="subject">${alert.getValue('Subject')}</h3>
                                <p class="body">${alert.getValue('Message')}</p>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${fn:length(alerts) gt 3}">
                        <div class="shift left inactive" content-target="div.message">
                            <span>
                                <i class="background fa fa-circle"></i>
                                <i class="icon fa fa-chevron-circle-left"></i>
                            </span>
                        </div>
                        <div class="shift right" content-target="div.message">
                            <i class="background fa fa-circle"></i>
                            <i class="icon fa fa-chevron-circle-right"></i>
                        </div>
                    </c:if>
                    <c:forEach items="${alertsList}" var="alert" end="2">
                        <div class="col-md-4 message">
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="row itsm">
            <div class="col-md-6 tasks widget" widget-target="assigned-tasks" data-target="div.content" filter-target="div.filter">
                <div class="wrap">
                    <header>
                        <div class="label color-gray-darkest">
                            My Assigned Tasks
                        </div>
                        <div class="filter">
                            <a href="javascript:void(0);">
                                Filter By
                                <i class="icon fa fa-chevron-circle-down"></i>
                            </a>
                        </div>
                    </header>
                    <div class="content background-gray-lightest"></div>
                </div>
            </div>
            <div class="col-md-6 reports widget" widget-target="service-management" data-target="div.content" filter-target="div.filter">
                <div class="wrap">
                    <header>
                        <div class="label color-gray-darkest">
                            Service Management View
                        </div>
                        <div class="filter">
                            <a href="javascript:void(0);">
                                Filter By
                                <i class="icon fa fa-chevron-circle-down"></i>
                            </a>
                        </div>
                    </header>
                    <div class="content background-gray-lightest"></div>
                </div>
            </div>
        </div>
    </section>




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