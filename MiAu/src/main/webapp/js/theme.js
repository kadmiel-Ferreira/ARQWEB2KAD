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

document.addEventListener("DOMContentLoaded", () => {
    const savedTheme = localStorage.getItem("theme") || "light";
    document.documentElement.setAttribute("data-theme", savedTheme);

    const toggleButton = document.querySelector("#theme-toggle");
    if (toggleButton) {
        toggleButton.addEventListener("click", () => {
            const currentTheme = document.documentElement.getAttribute("data-theme");
            const newTheme = currentTheme === "dark" ? "light" : "dark";
            document.documentElement.setAttribute("data-theme", newTheme);
            localStorage.setItem("theme", newTheme);
        });
    }
});

document.addEventListener('DOMContentLoaded', () => {
    applyTheme(getStoredTheme() || getPreferredTheme());
    const toggleButton = document.querySelector('#theme-toggle');
    if (toggleButton) {
        toggleButton.addEventListener('click', toggleTheme);
    }
});



// theme.js

function switchTheme() {
    let body = document.body;
    let currentTheme = body.getAttribute("data-theme");

    if (currentTheme === "dark") {
        body.setAttribute("data-theme", "light");
        localStorage.setItem("theme", "light");
    } else {
        body.setAttribute("data-theme", "dark");
        localStorage.setItem("theme", "dark");
    }
}




