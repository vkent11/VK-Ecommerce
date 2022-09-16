/*
=============
Navigation
=============
 */
let menu = document.querySelector('#menu-bar');
let navbar = document.querySelector('.nav-bar ');

// for the behavior of the page// toggles
menu.addEventListener('click', () => {
    menu.classList.toggle('fa-times');
    navbar.classList.toggle('actives1');
});





// Smooth Scroll
Array.from(scrollLink).map(link => {
    link.addEventListener("click", e => {
        // Prevent Default
        e.preventDefault();

        const id = e.currentTarget.getAttribute("href").slice(1);
        const element = document.getElementById(id);
        const navHeight = navBar.getBoundingClientRect().height;
        const fixNav = navBar.classList.contains("fix__nav");
        let position = element.offsetTop - navHeight;

        if (!fixNav) {
            position = position - navHeight;
        }

        window.scrollTo({
            left: 0,
            top: position,
        });
        navContainer.style.left = "-30rem";
        document.body.classList.remove("active");
    });
});