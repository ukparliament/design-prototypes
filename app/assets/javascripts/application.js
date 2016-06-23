// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

"use strict";

$(document).ready(main);

$(document).on("page:change", main);

function main() {
	$("input[type=checkbox]").click(function() {
		var dataType = $(this).attr("name");
		if (dataType === "commons" || dataType === "lords") {
			filterMembersByHouse.call(this, dataType);
		}
		else {
			filterMembersByContribution.call(this, dataType);
		}	
	});

	$("a[href='#']").click(function() {
		alert("This is a prototype so this link doesn't go anywhere yet.");
	});

	function filterMembersByHouse(house) {
		if($(this).prop("checked")) {
			$('div[data-house='+house+']').show();
		}
		else {
			$('div[data-house='+house+']').hide();
		}
	}


	function filterMembersByContribution(type) {
		if($(this).prop("checked")) {
			$('div[data-contribution-' + type + '=true]').show();
		}
		else {
			$('div[data-contribution-' + type + '=true]').hide();
		}
	}
}