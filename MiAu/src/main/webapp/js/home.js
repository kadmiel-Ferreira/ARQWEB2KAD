// Inicialização dos tooltips
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl);
});

var myModal = document.getElementById('myModal');
var bsModal = new bootstrap.Modal(myModal);

// Listener para exibição do modal
myModal.addEventListener('show.bs.modal', function (event) {
  // Botão que acionou o modal
  var button = event.relatedTarget;

  // Extrair o ID do animal dos atributos data-bs-*
  var id = button.getAttribute('data-bs-id');

  // Atualizar o título do modal
  var modalTitle = myModal.querySelector('.modal-title');
  modalTitle.textContent = 'Exclusão do Animal ' + id;

  // Substituir o listener do botão "Excluir"
  var modalButton = myModal.querySelector('.modal-footer #delete');
  modalButton.replaceWith(modalButton.cloneNode(true)); // Remove listeners antigos
  modalButton = myModal.querySelector('.modal-footer #delete');

  // Adicionar listener ao botão "Excluir"
  modalButton.addEventListener('click', function() {
      deleteAnimal(button, id);
	  bsModal.hide();
	  window.location.reload(true);
      
  });

});

// Função para excluir o animal
function deleteAnimal(button, id) {
  // Obtém a linha correspondente na tabela
  var row = button.closest('tr');

  // URL do servlet para exclusão
  const url = `ControllerServlet?action=deleteAnimal&animal-id=${id}`;

  // Realizar a requisição GET
  fetch(url)
    .then(response => response.json())
    .then(data => {
      if (data) {
        // Remover a linha da tabela
        row.parentNode.removeChild(row);
      } else {
        console.error('Erro ao excluir o animal: Resposta do servidor inválida.');
      }
    })
    .catch(error => {
      console.error('Erro de solicitação:', error);
    });
}
