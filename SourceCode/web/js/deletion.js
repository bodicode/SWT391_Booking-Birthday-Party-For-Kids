/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateForm() {
    var currentPassword = document.getElementById('currentPassword').value;
    var sessionPassword = document.getElementById('userPassword').value;
    var errorCurrentPasswordMessage = document.getElementById('errorCurrentPassword');

    if (currentPassword !== sessionPassword) {
        errorCurrentPasswordMessage.innerHTML = "<span class='text-red-600'>Enter a valid password and try again.</span>";
        return false;
    }
    return true;
}
