
document.addEventListener("DOMContentLoaded", () => {
	console.log("restaurando valores dos cookies");

	function getCookie(name) {
		let match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
		return match ? decodeURIComponent(match[2]) : "";
	}

	function setCookie(name, value, seconds) {
		let expires = "";
		if (seconds) {
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
			console.log(`Restaurando ${field}:`, value); 
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
		input.addEventListener("change", saveFormValues);
	});

});

/*window.onload = function () {
    function deleteAllCookies() {
        document.cookie.split(";").forEach(cookie => {
            let cookieName = cookie.split("=")[0].trim();
            document.cookie = cookieName + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/; SameSite=Lax";
        });
        console.log("Todos os cookies foram deletados.");
    }

    deleteAllCookies();
};*/




$(document).ready(() => {
	$('#telefone').inputmask('(99) 99999-9999');
	$('#cpf').inputmask('999.999.999-99');
	$('#cep').inputmask('99999-999');
	
});

