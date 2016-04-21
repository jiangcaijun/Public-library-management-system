$(document).ready(function() {
	/*var t = Math.random();
	var url="";
	url = "/item?action=recommen&t="+t;*/
	
	$("#search").click( function () {
		var itemSearch = $("#itemSearch").val();
		itemSearch = encodeURI(encodeURI(itemSearch));
		if(itemSearch!=""){
			location.href ="/search?search="+itemSearch;
		}
	});
});
