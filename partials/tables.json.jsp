<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set var="helperKapp" value="${space.getKapp('helper')}" />
<c:set var="tablesForm" value="${helperKapp.getForm('data-table-config')}" />
<c:set var="formFields" value="${tablesForm.pages[0].fields}" />
<c:set var="tables" value="${Submissions.searchByForm(tablesForm, SubmissionHelper.helperQueryOptions())}"/>

<json:object>
	<json:array name="tables" var="table" items="${tables}">
		<json:object>
			<c:forEach var="field" items="${formFields}">
				<json:property name="${field.name}" value="${table.values[field.name]}" />
			</c:forEach>
		</json:object>
	</json:array>
</json:object>