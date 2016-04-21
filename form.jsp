<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/form.jsp">
    <bundle:variable name="head">
        <title>${text.escape(form.name)}</title>
    </bundle:variable>
    <div class="form-wrap">
      <section class="page" data-page="${page.name}">
        <header>
          <h2 class="header-label color-black">${text.escape(form.name)}</h2>
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
		<script>
	        console.log('vv cgi-ce-bundle/form.jsp vv');
            // Initialize Bootstrappy field overrides.
            bundle.config.fields = {
              text: function(field, triggerFn) {
                $(field.wrapper()).addClass('form-group');
                $(field.wrapper()).find('label').addClass('control-label');
                $(field.element()).addClass('form-control');
                $(field.element()).on('change', triggerFn);
              },
              dropdown: function(field, triggerFn) {
                $(field.wrapper()).addClass('form-group');
                $(field.wrapper()).find('label').addClass('control-label');
                $(field.element()).addClass('form-control');
                $(field.element()).on('change', triggerFn);
              },
              checkbox: function(field, triggerFn) {
                $(field.wrapper()).removeClass('checkbox');
                $(field.wrapper()).find('label').first().addClass('control-label');
                $(field.wrapper()).find('label').first().removeClass('field-label');
                $(field.wrapper()).children().not(':first-child').addClass('checkbox');
                $(field.wrapper()).children().not(':first-child').attr('style', 'margin-left:20px;');
             },
              radio: function(field, triggerFn) {
                $(field.wrapper()).removeClass('radio');
                $(field.wrapper()).find('label').first().addClass('control-label');
                $(field.wrapper()).find('label').first().removeClass('field-label');
                $(field.wrapper()).children().not(':first-child').addClass('radio');
                $(field.wrapper()).children().not(':first-child').attr('style', 'margin-left:20px;');
              }
            };
            bundle.config.ready = function() {
			  console.log('vv cgi-ce-bundle/form.jsp bundle.config.ready vv');
              $('[data-element-type="button"]').addClass('btn btn-default');
			  var searchForm = $('#navbar-collapse-1 > div.navbar-form > form > div > input.form-control.predictiveText.x');
			  var searchFormLabelText = searchForm.attr('placeholder');
			  searchForm.wrap('<label class="field-label control-label white">'+searchFormLabelText+'</label>');
			  $('head').append('<title>'+$('.header-label')[0].innerText+' | CGI Unify360 </title>');
			  $('html').attr('lang','en');
			  $('img[alt="logo"]').attr('alt','CGI Unify Three Sixty');
			  $('span.fa.fa-home').after('<span class="sr-only">Home</span>');
			  $('span.fa.fa-bell').after('<span class="sr-only">Alerts</span>');
			  console.log('^^ cgi-ce-bundle/form.jsp bundle.config.ready ^^');
            };
			console.log('^^ cgi-ce-bundle/form.jsp ^^');
          </script>
</bundle:layout>
