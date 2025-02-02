document.addEventListener("DOMContentLoaded", () => {
    const galleryContainer = document.getElementById("gridContainer");

    // Função para criar o card de cada animal
    function createAnimalCard(animal) {
        const card = document.createElement("div");
        card.classList.add("grid-item");

        const img = document.createElement("img");
        img.src = `https://recreio.com.br/media/uploads/2024/02/relampago-mcqueen_capa.jpg`; // Assumindo que as imagens têm o ID do animal
        img.alt = `Foto de ${animal.nome}`;
        img.classList.add("animal-img");

        const infoProduto = document.createElement("div");
        infoProduto.classList.add("info-produto");
        infoProduto.style.display = "none"; // Inicialmente escondido

        const title = document.createElement("h5");
        title.textContent = animal.nome;

        const detalhes = document.createElement("p");
        detalhes.textContent = animal.descricao ? animal.descricao : "Descrição não disponível";

        const description = document.createElement("p");
        description.textContent = `${animal.raca}, ${animal.idade} anos, ${animal.sexo}`;

        const status = document.createElement("span");
        status.textContent = animal.status === "DISPONIVEL" ? "Disponível" : "Adotado";
        status.style.color = animal.status === "DISPONIVEL" ? "green" : "gray";

        infoProduto.appendChild(title);
        infoProduto.appendChild(detalhes);
        infoProduto.appendChild(description);
        infoProduto.appendChild(status);

        // Cria o card, mas sem o clique explícito
        card.appendChild(img);
        card.appendChild(infoProduto);

        // Adiciona a lógica de alternância de exibição ao clicar na imagem
        img.addEventListener("click", () => {
            if (infoProduto.style.display === "block") {
                infoProduto.style.display = "none";
                img.style.transform = "scale(1)"; // Restaura a escala da imagem
            } else {
                infoProduto.style.display = "block";
                img.style.transform = "scale(1.1)"; // Aumenta a imagem ao clicar
            }
        });

        return card;
    }

    // Função para carregar os dados e criar os cards
    function loadAnimalsFromJSON() {
        const animalsData = JSON.parse(document.getElementById("select-itens").textContent);
        console.log(animalsData); // Veja se os dados estão corretos no console do navegador

        // Cria os cards para cada animal e adiciona à galeria
        animalsData.forEach(animal => {
            const card = createAnimalCard(animal);
            galleryContainer.appendChild(card);
        });
    }

    loadAnimalsFromJSON(); // Chama a função para carregar os dados
});
