<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
	<bundle:variable name="head">
		<title>${text.escape(space.name)} Profile</title>
	</bundle:variable>
	<div class="form-wrap">
		<section class="page">
			<header>
				<h2 class="header-label color-black">Edit Your Profile</h2>
			</header>
			<div class="page-border page-padding">
				<div class="card">
					<div class="panel-body">
						<div class="form-group">
							<label for="email" class="control-label">Email</label>
							<input id="email" type="text" name="email" class="form-control" value="${identity.user.email}">
						</div>
						<div class="form-group">
							<label for="displayName" class="control-label">Display Name</label>
							<input id="displayName" type="text" name="displayName" class="form-control" value="${identity.user.displayName}">
						</div>
						<div class="form-group">
							<label for="groups" class="control-label">Security Groups</label>
							<input id="groups" type="text" name="groups" class="form-control" value="${identity.groups}">
						</div>
						<div class="form-group">
							<label for="password" class="control-label">Password</label>
							<input id="password" type="password" name="password" class="form-control">
						</div>
						<div class="form-group">
							<label for="passwordConfirmation" class="control-label">Password Confirmation</label>
							<input id="passwordConfirmation" type="password" name="passwordConfirmation" class="form-control">
						</div>
					</div>
					<div class="panel-footer">
						<button class="btn btn-info save-profile bg-beet">Save</button>
					</div>
				</div>
			</div>
		</section>
	</div>
</bundle:layout>
<script>
	$('button.save-profile').on('click', function(e){
		if ($('input#password').val() !== $('input#passwordConfirmation').val()){
			$('input#password').notifie({
				anchor: 'div',
				message: 'Passwords do not match.',
				disable: false,
				exitEvents: 'focus'
			});
			return;
				}
		var data = {
			displayName: $('input#displayName').val().trim(),
			email: $('input#email').val().trim()
		};
		if ($('input#password').val().length > 0){
			data.password = $('input#password').val();
		}
		$.ajax({
			method: 'put',
			dataType: 'json',
			url: '${bundle.apiLocation}/me',
			data: JSON.stringify(data),
			beforeSend: function(jqXHR, settings){
				$('button.save-profile').prop('disabled', true);
				$('div.profile').notifie({
						exit: true,
						recurseExit: true
					});
			},
			success: function(data, textStatus, jqXHR){
				$('div.profile').notifie({
					severity: 'success',
						message: 'Saved changes to user ' + data.user.displayName,
						expire: 5000
					});
			},
			error: function(jqXHR, textStatus, errorThrown){
				$('div.profile').notifie({
						message: 'Failed to save changes'
					});
			},
			complete: function(jqXHR, settings){
				$('button.save-profile').prop('disabled', false);
			},
		});
	});
</script>