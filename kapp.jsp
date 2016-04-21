<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>
<c:if test="${identity.anonymous}">
	<c:redirect url="/${space.slug}/app/login" />
</c:if>
<c:set var="customerRecordID" value="no identity object found" scope="session"/>
<c:if test="${identity != null && identity.user.displayName != null}">
	<c:set var="customerRecordID" value="searched for ${identity.user.displayName}" scope="session"/>
	<c:set var="params" value="${Resources.map()}"/>
	<c:set target="${params}" property="fullName" value="${identity.user.displayName}"/>
	<c:catch var="catchException">
		<c:set var="record" value="${Resources.retrieve('Customer%20by%20full%20name', params)}"/>
	</c:catch>
	<c:if test="catchException != null">
		<c:set var="customerRecordID" value="Exception caught: ${catchException.message}" scope="session"/>
	</c:if>
	<c:if test="${record != null && record.get('customerID') != null}">
		<c:set var="customerRecordID" value="${record.get('customerID')}" scope="session"/>
	</c:if>
</c:if>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:choose>
        <c:when test="${kapp!=null && kapp.hasAttribute('Task Server Url') && kapp.hasAttribute('Task Source Name')}">
            <c:choose>
                <c:when test="${param.submission_id != null}">
                    <c:import url="${bundle.path}/partials/submission.jsp" charEncoding="UTF-8" />
                </c:when>
                <c:otherwise>
                    <c:import url="${bundle.path}/partials/catalog.jsp" charEncoding="UTF-8" />
                </c:otherwise>
            </c:choose>
            <app:bodyContent/>
        </c:when>
        <c:otherwise>
            <div class="no-data">
                <h3>Kapp configuration is missing these attributes:</h3>
                <ul>
                    <c:if test="${!kapp.hasAttribute('Task Server Url')}">
                        <li>Task Server Url</li>
                    </c:if>
                    <c:if test="${!kapp.hasAttribute('Task Source Name')}">
                        <li>Task Source Name</li>
                    </c:if>
                </ul>
                <p>To update your configuration go to the <a href="${bundle.spaceLocation}/app/#/${kapp.slug}/setup/kapp/attributes">
                Kapp Attribute settings</a>.</p>
            </div>
        </c:otherwise>
    </c:choose>
</bundle:layout>