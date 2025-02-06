
document.addEventListener("DOMContentLoaded", () => {
	console.log("restaurando valores dos cookies");

	function getCookie(name) {
		let match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
		return match ? decodeURIComponent(match[2]) : "";
	}

	function setCookie(name, value, seconds) {
		let expires = "";
		if (days) {
			let date = new Date();
			date.setTime(date.getTime() + (seconds * 1000));

			expires = "; expires=" + date.toUTCString();
		}
		document.cookie = name + "=" + encodeURIComponent(value) + expires + "; path=/";
	}

	function restoreFormValues() {
		let fields = ["nome", "email", "telefone", "cep", "numero", "logradouro", "complemento", "bairro", "cidade", "estado"];
		fields.forEach(field => {
			let value = getCookie(field);
			if (value) {
				document.getElementById(field).value = value;
			}
		});
	}

	function saveFormValues() {
		let fields = ["nome", "email", "telefone", "cep", "numero", "logradouro", "complemento", "bairro", "cidade", "estado"];
		fields.forEach(field => {
			let input = document.getElementById(field);
			if (input) {
				setCookie(field, input.value, 10);
			}
		});
	}
	function deleteCookies() {
		let fields = ["nome", "email", "telefone", "cep", "numero", "logradouro", "complemento", "bairro", "cidade", "estado"];
		fields.forEach(field => {
			document.cookie = field + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
		});
	}


	restoreFormValues();


	document.querySelectorAll("#form1 input, #form1 select").forEach(input => {
		input.addEventListener("input", saveFormValues);
	});

});

$(document).ready(() => {
	$('#telefone').inputmask('(99) 99999-9999');
	$('#cpf').inputmask('999.999.999-99');
	$('#cep').inputmask('99999-999');
});

