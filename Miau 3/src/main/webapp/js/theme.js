/*!
 * Color mode toggler for Bootstrap's docs (https://getbootstrap.com/)
 * Copyright 2011-2024 The Bootstrap Authors
 * Licensed under the Creative Commons Attribution 3.0 Unported License.
 */


'use strict'

const getStoredTheme = () => localStorage.getItem('theme')
const setStoredTheme = theme => localStorage.setItem('theme', theme)

const getPreferredTheme = () => {
	const storedTheme = getStoredTheme()
	if (storedTheme) {
		return storedTheme
	}

	return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
}

const changeSVG = (theme) => {
	let svg = document.querySelectorAll('svg');
	if(theme === 'dark'){
		for(const s of svg){
			s.style.fill = 'rgb(255,255,255)';
		}
	}else{
		for(const s of svg){
			s.style.fill = 'rgb(0,0,0)';
		}
	}
}

const setTheme = (theme) => {
	if (theme === 'auto') {
		document.documentElement.setAttribute('data-bs-theme', (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'))
	} else {
		document.documentElement.setAttribute('data-bs-theme', theme)
	}
	changeSVG(getPreferredTheme())
}

setTheme(getPreferredTheme())

const showActiveTheme = (theme, focus = false) => {
	const themeSwitcher = document.querySelector('#bd-theme')

	if (!themeSwitcher) {
		return
	}

	const themeSwitcherText = document.querySelector('#bd-theme-text')
	const activeThemeIcon = document.querySelector('.theme-icon-active use')
	const btnToActive = document.querySelector(`[data-bs-theme-value="${theme}"]`)
	const svgOfActiveBtn = btnToActive.querySelector('svg use').getAttribute('href')

	document.querySelectorAll('[data-bs-theme-value]').forEach(element => {
		element.classList.remove('active')
		element.setAttribute('aria-pressed', 'false')
	})

	btnToActive.classList.add('active')
	btnToActive.setAttribute('aria-pressed', 'true')
	activeThemeIcon.setAttribute('href', svgOfActiveBtn)
	const themeSwitcherLabel = `${themeSwitcherText.textContent} (${btnToActive.dataset.bsThemeValue})`
	themeSwitcher.setAttribute('aria-label', themeSwitcherLabel)

	if (focus) {
		themeSwitcher.focus()
	}
}

window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
	const storedTheme = getStoredTheme()
	if (storedTheme !== 'light' && storedTheme !== 'dark') {
		setTheme(getPreferredTheme())
	}
})

window.addEventListener('DOMContentLoaded', () => {
	showActiveTheme(getPreferredTheme())

	document.querySelectorAll('[data-bs-theme-value]')
		.forEach(toggle => {
			toggle.addEventListener('click', () => {
				const theme = toggle.getAttribute('data-bs-theme-value')
				setStoredTheme(theme)
				setTheme(theme)
				showActiveTheme(theme, true)
			})
		})
})

let button = document.querySelector('#switchTheme');
if(button){
	button.addEventListener('click', () => {
		switchTheme();
	})
}



const switchTheme = () => {
	let theme = getStoredTheme();
	let themeValue = (theme === 'light') ? 'dark' : 'light';
	setStoredTheme(themeValue);
	setTheme(themeValue);
	changeSVG(themeValue);
	
  const themeIcon = document.getElementById('themeIcon');

    if (themeValue === 'dark') {
        // Ícone de lua para modo escuro
        themeIcon.innerHTML = `
            <path d="M6 0a.5.5 0 0 1 .5.5V2a.5.5 0 0 1-1 0V.5A.5.5 0 0 1 6 0zm5.854 2.146a.5.5 0 1 1-.708.708L9.646 1.854a.5.5 0 1 1 .708-.708l1.5 1.5zM16 7.5a.5.5 0 0 1-.5-.5h-1.5a.5.5 0 0 1 0-1H15.5a.5.5 0 0 1 .5.5zM13.146 12.854a.5.5 0 1 1-.708-.708l1.5-1.5a.5.5 0 1 1 .708.708l-1.5 1.5zM8 14a.5.5 0 0 1 .5.5V16a.5.5 0 0 1-1 0v-1.5A.5.5 0 0 1 8 14zM2.354 13.646a.5.5 0 1 1-.708-.708l1.5-1.5a.5.5 0 1 1 .708.708l-1.5 1.5zM1 7.5a.5.5 0 0 1 .5-.5H3a.5.5 0 0 1 0-1H1.5a.5.5 0 0 1-.5.5z"/>
        `;
    } else {
        // Ícone de sol para modo claro
        themeIcon.innerHTML = `
            <path d="M8 3a5 5 0 1 0 0 10A5 5 0 0 0 8 3zM8 0a.5.5 0 0 1 .5.5V2a.5.5 0 0 1-1 0V.5A.5.5 0 0 1 8 0zM4.354 1.646a.5.5 0 1 1-.708.708L2.146 3.854a.5.5 0 1 1 .708.708l1.5-1.5zM15.5 7.5a.5.5 0 0 1-.5.5H13.5a.5.5 0 0 1 0-1H15a.5.5 0 0 1 .5.5zM10.354 1.646a.5.5 0 1 1-.708.708l1.5 1.5a.5.5 0 1 1 .708-.708l-1.5-1.5z"/>
        `;
    }
    
document.addEventListener("DOMContentLoaded", () => {
    const currentTheme = getStoredTheme() || getPreferredTheme();
    setTheme(currentTheme);
    changeSVG(currentTheme);
    switchTheme(); // Atualiza o ícone no carregamento
});


document.querySelector("#switchTheme").addEventListener("click", switchTheme);

	
	
}
