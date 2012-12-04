function closeDialog () {
	$('#windowTitleDialog').modal('hide'); 
	};
function okClicked () {
	document.title = document.getElementById ("xlInput").value;
	closeDialog ();
	};

$("#btn-login").click(function() {
	$("#employeeLogin").modal('hide');
});