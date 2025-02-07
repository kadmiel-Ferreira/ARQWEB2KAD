document.addEventListener("DOMContentLoaded", ()=> {
	let vlibrasScript = document.createElement("script");
	vlibrasScript.src = "https://vlibras.gov.br/app/vlibras-plugin.js";
	vlibrasScript.defer = true;
	document.body.appendChild(vlibrasScript);

	vlibrasScript.onload = function() {
		new window.VLibras.Widget();
	};
});
