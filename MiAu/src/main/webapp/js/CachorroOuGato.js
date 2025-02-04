// Executa o script apenas após o DOM estar carregado
document.addEventListener("DOMContentLoaded", function () {
    const especie = document.getElementById("especie");
    const racaCaes = document.getElementById("racaCaes");
    const racaGatos = document.getElementById("racaGatos");

    // Função para alternar os selects de raça
    function mostrarRacas() {
        if (especie.value === "CACHORRO") {
            racaCaes.style.display = "block";
            racaGatos.style.display = "none";
        } else if (especie.value === "GATO") {
            racaCaes.style.display = "none";
            racaGatos.style.display = "block";
        } else {
            racaCaes.style.display = "none";
            racaGatos.style.display = "none";
        }
    }

    // Chama a função inicialmente para garantir o estado correto
    mostrarRacas();

    // Adiciona o evento de mudança ao select
    especie.addEventListener("change", mostrarRacas);
});
