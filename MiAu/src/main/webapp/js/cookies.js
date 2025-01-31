
    document.addEventListener("DOMContentLoaded", function () {
        console.log("Página carregada, restaurando valores dos cookies...");

        function getCookie(name) {
            let match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
            return match ? decodeURIComponent(match[2]) : "";
        }

        function setCookie(name, value, days) {
            let expires = "";
            if (days) {
                let date = new Date();
                date.setTime(date.getTime() + (minutes * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + encodeURIComponent(value) + expires + "; path=/";
        }

        function restoreFormValues() {
            let fields = ["nome", "email", "telefone", "cep", "numero", "logradouro", "complemento", "bairro", "cidade", "estado"];
            fields.forEach(field => {
                let value = getCookie(field);
                if (value) {  // Só define o valor se o cookie não estiver vazio
                    document.getElementById(field).value = value;
                }
            });
        }

        function saveFormValues() {
            let fields = ["nome", "email", "telefone", "cep", "numero", "logradouro", "complemento", "bairro", "cidade", "estado"];
            fields.forEach(field => {
                let input = document.getElementById(field);
                if (input) {
                    setCookie(field, input.value, 7);
                }
            });
        }

        // Restaurar valores ao carregar a página
        restoreFormValues();

        // Salvar valores nos cookies sempre que o usuário digitar
        document.querySelectorAll("#form1 input, #form1 select").forEach(input => {
            input.addEventListener("input", saveFormValues);
        });

    });

    $(document).ready(function () {
        console.log("jQuery carregado, aplicando máscaras...");
        
        // Aplicando máscara ao telefone
        $('#telefone').inputmask('(99) 99999-9999');
		
		$('#cpf').inputmask('999.999.999-99');
        // Aplicando máscara ao CEP
        $('#cep').inputmask('99999-999');
    });

