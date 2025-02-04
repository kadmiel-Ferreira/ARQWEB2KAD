// Executa o script apenas após o DOM estar carregado
document.addEventListener("DOMContentLoaded", function () {
    const tipoUsuario = document.getElementById("tipoUsuario");
    const cpfDiv = document.getElementById("cpfDiv");
    const cnpjDiv = document.getElementById("cnpjDiv");

    // Função para alternar os campos
    function mostrarCampos() {
        if (tipoUsuario.value === "ADOTANTE") {
            cpfDiv.style.display = "block";
            cnpjDiv.style.display = "none";
        } else if (tipoUsuario.value === "ONG") {
            cpfDiv.style.display = "none";
            cnpjDiv.style.display = "block";
        }
    }

    // Adiciona o evento de mudança ao select
    tipoUsuario.addEventListener("change", mostrarCampos);

    // Chama a função inicialmente para garantir o estado correto
    mostrarCampos();
});
