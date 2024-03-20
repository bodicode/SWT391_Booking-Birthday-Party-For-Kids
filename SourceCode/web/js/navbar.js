function login() {
    document.getElementById("modal-login").style.display = "flex";
}

function signup() {
    document.getElementById("modal-signup").style.display = "flex";
    document.getElementById("modal-login").style.display = "none";
}

function closeModalLogin() {
    document.getElementById("modal-login").style.display = "none";
}

function closeModalSingup() {
    document.getElementById("modal-signup").style.display = "none";
}

function switchLogin() {
    document.getElementById("modal-login").style.display = "flex";
    document.getElementById("modal-signup").style.display = "none";
}
