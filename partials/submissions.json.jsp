<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set var="submissionType" value="${param['submissionType']}"/>

<c:if test="${submissionType eq 'Approvals'}">
  <c:set scope="request" var="submissions" value="${Submissions.searchByKapp(kapp, SubmissionHelper.approvalsQueryOptions())}"/>
</c:if>

<c:if test="${submissionType eq 'Submissions'}">
  <c:set scope="request" var="submissions" value="${Submissions.searchByKapp(kapp, SubmissionHelper.requestsQueryOptions())}"/>
</c:if>

<json:object>
  <json:array name="columns">
    <json:object>
      <json:property name="title" value="Label"/>
      <json:property name="data" value="label"/>
    </json:object>
  </json:array>
  <json:array name="data" var="submission" items="${submissions}">
      <json:object>
        <json:property name="label" value="${submission.id}"/>
    </json:object>
  </json:array>
</json:object>