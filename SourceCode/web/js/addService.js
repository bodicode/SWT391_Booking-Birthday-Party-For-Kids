function addService() {
    document.getElementById("modal-add").style.display = "flex";
    event.preventDefault();
}

function closeModalAddService() {
    document.getElementById("modal-add").style.display = "none";
}

//function confirmUpdate(serviceID){
//    document.getElementById("confirm-update").style.display = "flex";
//     document.getElementById('serviceID').value = serviceID;
//    event.preventDefault();
//}

//function confirmDelete() {
//    document.getElementById("confirm-delete").style.display = "flex";
//    event.preventDefault();
//}

function closeUpdateModal() {
    document.getElementById("update-modal").style.display = "none";
}

function closeDeleteModal() {
    document.getElementById("delete-modal").style.display = "none";
}
function closeUpdateConfirm() {
    document.getElementById("update-confirm").style.display = "none";
}

function closeDeleteConfirm() {
    document.getElementById("confirm-delete").style.display = "none";
}

