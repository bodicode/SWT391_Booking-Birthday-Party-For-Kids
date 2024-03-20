function addFood() {
    document.getElementById("modal-add").style.display = "flex";
    event.preventDefault();
}

function closeModalAddFood() {
    document.getElementById("modal-add").style.display = "none";
}

function closeUpdateModal() {
    document.getElementById("update-modal").style.display = "none";
}

function closeDeleteModal() {
    document.getElementById("delete-modal").style.display = "none";
}
