<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set var="submissionType" value="${param['submissionType']}"/>
<c:set var="submissionFriendly" value="request that has been assigned to me"/>

<c:if test="${submissionType eq 'Approvals'}">
  <c:set scope="request" var="submissions" value="${Submissions.searchByKapp(kapp, SubmissionHelper.approvalsQueryOptions())}"/>
</c:if>

<c:if test="${submissionType eq 'Submissions'}">
	<c:set scope="request" var="submissions" value="${Submissions.searchByKapp(kapp, SubmissionHelper.requestsQueryOptions())}"/>
	<c:set var="submissionFriendly" value="request that was submitted by me"/>
</c:if>

<json:object>
  <json:property name="dom" value="t"/>
  <json:property name="rowId" value="DT_RowId"/>
  <json:array name="columns">
    <json:object>
      <json:property name="title" value=""/>
      <json:property name="data" value="label"/>
    </json:object>
  </json:array>
  <json:array name="data" var="submission" items="${submissions}">
      <json:object>
        <json:property name="label" value="${submission.form.name} ${submissionFriendly} - ${submission.label}"/>
		<json:property name="DT_RowId" value="${submission.id}"/>
		<c:if test="${fn:length(submission.form.categories) gt 0}">
			<c:if test="${not empty submission.form.categories[0].getAttribute('fa-logo')}">
				<json:property name="fa-logo" value="${submission.form.categories[0].getAttribute('fa-logo').value}"/>
			</c:if>
		</c:if>
    </json:object>
  </json:array>
</json:object>