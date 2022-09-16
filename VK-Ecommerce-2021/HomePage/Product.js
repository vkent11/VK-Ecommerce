$(document).ready(function () {
    $('.navbar-toggler').click(function () {
        $('.navbar-collapse').slideToggle(300);
    });

    smallScreenMenu();
    let temp;
    function resizeEnd() {
        smallScreenMenu();
    }

    $(window).resize(function () {
        clearTimeout(temp);
        temp = setTimeout(resizeEnd, 100);
        resetMenu();
    });
});


const subMenus = $('.sub-menu');
const menuLinks = $('.menu-link');

function smallScreenMenu() {
    if ($(window).innerWidth() <= 992) {
        menuLinks.each(function (item) {
            $(this).click(function () {
                $(this).next().slideToggle();
            });
        });
    } else {
        menuLinks.each(function (item) {
            $(this).off('click');
        });
    }
}

function resetMenu() {
    if ($(window).innerWidth() > 992) {
        subMenus.each(function (item) {
            $(this).css('display', 'none');
        });
    }
}




const allFilterItems = document.querySelectorAll('.filter-item');
const allFilterBtns = document.querySelectorAll('.filter-btn');

window.addEventListener('DOMContentLoaded', () => {
    allFilterBtns[0].classList.add('active-btn');
});

allFilterBtns.forEach((btn) => {
    btn.addEventListener('click', () => {
        showFilteredContent(btn);
    });
});

function showFilteredContent(btn) {
    allFilterItems.forEach((item) => {
        if (item.classList.contains(btn.id)) {
            resetActiveBtn();
            btn.classList.add('active-btn');
            item.style.display = "block";
        } else {
            item.style.display = "none";
        }
    });
}

function resetActiveBtn() {
    allFilterBtns.forEach((btn) => {
        btn.classList.remove('active-btn');
    });
}



