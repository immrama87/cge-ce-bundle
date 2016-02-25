<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/form.jsp">
    <bundle:variable name="head">
        <title>${text.escape(form.name)}</title>
    </bundle:variable>
    <div class="form-wrap">
      <section class="page" data-page="${page.name}">
        <header>
          <h3 class="header-label color-black">${text.escape(form.name)}</h3>
        </header>
        <c:if test="${param.review != null && pages.size() > 1}">
            <c:import url="partials/review.jsp" charEncoding="UTF-8"></c:import>
        </c:if>
        <div class="errors"></div>
        <div class="page-border">
          <app:bodyContent/>
        </div>
      </section>
    </div>
</bundle:layout>
