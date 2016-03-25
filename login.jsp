<%@include file="bundle/initialization.jspf" %>

<bundle:layout page="layouts/login.jsp">
    <bundle:variable name="head">
        <title>${text.escape(kapp.name)} Login</title>
    </bundle:variable>
    <section>
      <form class="login-form" action="<c:url value="/${space.slug}/app/login.do"/>" method="POST">
          <!-- CSRF Token field -->
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

          <!-- Space to login to -->
          <input type="hidden" name="j_space" value="${space.slug}"/>

          <!-- Kapp to login to -->
          <input type="hidden" name="j_kapp" value="${kapp.slug}"/>

          <!-- Username field -->
          <div class="form-group">
            <label for="j_username">${resourceBundle.getString("auth.login.username")}:</label>
            <input type="text" name="j_username" id="j_username" class="" autofocus/>
          </div>

          <!-- Password field -->
          <div class="form-group">
            <label for="j_password">${resourceBundle.getString("auth.login.password")}:</label>
            <input type="password" name="j_password" id="j_password" class="" autocomplete="off"/>
          </div>
		  
		  <div class="pw-forget">
			<a href="#">Forgot my password</a>
		  </div>

          <div class="form-group">
            <button type="submit" id="submit" class="btn btn-login">Sign In</button>
          </div>
		  
		  <div class="eligible">
			Not a member? <a href="#">Contact us</a> to see if you are eligible
		  </div>
      </form>
  </section>
</bundle:layout>
