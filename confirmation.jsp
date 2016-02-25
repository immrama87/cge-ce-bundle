<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/layout.jsp">
<bundle:variable name="head">
<title>${text.escape(form.name)}</title>
</bundle:variable>
<section class="page">
    <header>
        <h3 class="color-black">${text.escape(form.name)}</h3>
    </header>
    <div class='content'>
        <div class='row'>
            <div class="col-xs-12">
            <%--  If no confirmation page is defined for the form,
                  use the default text below, otherwise use the page content.
                  An empty 'current page' means there is no page defined.
            --%>
            <section class="page">
            <div class="page-border page-padding">
                <c:choose>
                  <c:when test='${empty submission.currentPage}'>
                    <h4>Thank you for your submission</h4>
                    <p><a href="${bundle.kappLocation}/${form.slug}">Submit again</a></p>
                    <p><a href="${bundle.kappLocation}">Return to the catalog</a></p>
                  </c:when>
                  <c:otherwise>
                    <app:bodyContent/>
                  </c:otherwise>
                </c:choose>
                </div>
                </section>
            </div>
        </div>
    </div>
</section>
</bundle:layout>
