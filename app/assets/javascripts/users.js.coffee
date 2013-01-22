# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$("#usersAjaxTable").dataTable
		bProcessing: true,
		bServerSide: true,
		sAjaxSource: "/users.json"
		sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
		sPaginationType: "bootstrap"
		oLanguage:
		  sProcessing: ""
		  sLengthMenu: "Mostrar _MENU_ registros por pagina"
		  sZeroRecords: "Nenhum registro correspondente ao criterio encontrado"
		  sInfoEmtpy: "Exibindo 0 a 0 de 0 registros"
		  sInfo: "Exibindo de _START_ a _END_ de _TOTAL_ registros"
		  sInfoFiltered: ""
		  sSearch: "Procurar: "
		  oPaginate:
		    sFirst: "Primeiro"
		    sPrevious: "Anterior"
		    sNext: "Próximo"
		    sLast: "Último"
