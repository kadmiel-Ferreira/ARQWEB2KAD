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
    document.querySelectorAll('svg').forEach(svg => {
        svg.style.fill = theme === 'dark' ? 'rgb(255,255,255)' : 'rgb(0,0,0)';
    });
}

const applyTheme = (theme) => {
    document.documentElement.setAttribute('data-bs-theme', theme);
    changeSVG(theme);
}

const setTheme = (theme) => {
    setStoredTheme(theme);
    applyTheme(theme);
}

const toggleTheme = () => {
    const currentTheme = getStoredTheme() || getPreferredTheme();
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    setTheme(newTheme);
}

document.addEventListener('DOMContentLoaded', () => {
    applyTheme(getStoredTheme() || getPreferredTheme());
    const toggleButton = document.querySelector('#theme-toggle');
    if (toggleButton) {
        toggleButton.addEventListener('click', toggleTheme);
    }
});
