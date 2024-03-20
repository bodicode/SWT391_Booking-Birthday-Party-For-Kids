/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Sidebar toggle
const sidebarToggle = document.querySelector("#sidebar-toggle");
sidebarToggle.addEventListener("click", function () {
    document.querySelector("#sidebar").classList.toggle("collapsed");
});


//Dark mode switch
document.querySelector(".theme-toggle").addEventListener("click", () => {
    toggleLocalStorage();
    toggleRootClass();
});

function toggleRootClass() {
    const current = document.documentElement.getAttribute('data-bs-theme');
    const inverted = current == 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-bs-theme', inverted);
}

function toggleLocalStorage() {
    if (isLight()) {
        localStorage.removeItem("light");
    } else {
        localStorage.setItem("light", "set");
    }
}

function isLight() {
    return localStorage.getItem("light");
}

if (isLight()) {
    toggleRootClass();
}


//SPA for sidebar Element
// Check if the sidebar has already been initialized
//if (!document.querySelector(".js-sidebar-initialized")) {
//    console.log("Initializing sidebar...");
//    // Add a class to mark that the sidebar has been initialized
//    document.querySelector("#sidebar").classList.add("js-sidebar-initialized");
//
//    window.onload = function () {
//        const sidebarLinks = document.querySelectorAll(".sidebar-link");
//
//        // Load default page
//        loadPage("admin");
//
//        // Add click event listeners to sidebar links
//        sidebarLinks.forEach(link => {
//            link.addEventListener("click", function (event) {
//                event.preventDefault(); // Prevent default link behavior
//                const page = link.getAttribute("data-page");
//                loadPage(page);
//            });
//        });
//
//        function loadPage(page) {
//            const container = document.querySelector(".main");
//
//            const request = new XMLHttpRequest();
//            request.open("GET", page + ".jsp"); // Assuming JSP files are in the same directory
//            request.send();
//
//            request.onload = function () {
//                if (request.status === 200) {
//                    container.innerHTML = request.responseText;
////                    document.title = page; // Update document title if needed
//
//                    // If "Back to Homepage" link is clicked, navigate to home.jsp
//                    if (page === "home") {
//                        window.location.href = "home.jsp";
//                    }
//                }
//            };
//        }
//    };
//}


