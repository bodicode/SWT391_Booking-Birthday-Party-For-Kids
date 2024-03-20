/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateForm() {
    var oldPassword = document.getElementById('oldPassword').value;
    var sessionPassword = document.getElementById('userPassword').value;
    var newPassword = document.getElementById('newPassword').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var errorOldPasswordMessage = document.getElementById('errorOldPassword');
    var errorNewPasswordMessage = document.getElementById('errorNewPassword');

    if (oldPassword !== sessionPassword) {
        errorOldPasswordMessage.innerHTML = "<span style='color:red'>Password is incorrect</span>";
        errorNewPasswordMessage.innerHTML = "";
        return false;
    }

    if (newPassword === oldPassword && oldPassword === sessionPassword) {
        errorNewPasswordMessage.innerHTML =
                "<span style='color:red'>\n\
                                                                            New password must be different from current password\n\
                                                                        </span>";
        return false;
    }

    if (newPassword !== confirmPassword) {
        return false;
    }

    return true;
}

function checkPasswordMatch() {
    var newPassword = document.getElementById('newPassword').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var errorMessage = document.getElementById('errorMessage');

    if (newPassword !== confirmPassword || confirmPassword === "") {
        errorMessage.innerHTML = "<span style='color:red'>Passwords do not match</span>";

    } else {
        errorMessage.innerHTML = "<span style='color:green'>Passwords match</span>";
    }
}

function checkPasswordStrength() {
    var newPassword = document.getElementById('newPassword').value;
    var strengthBar = document.getElementById('passwordStrength');
    var strength = 0;

    if (newPassword.match(/[a-z]+/)) {
        strength += 1;
    }
    if (newPassword.match(/[A-Z]+/)) {
        strength += 1;
    }
    if (newPassword.match(/[0-9]+/)) {
        strength += 1;
    }
    if (newPassword.match(/[$@#&!]+/)) {
        strength += 1;
    }

    switch (strength) {
        case 0:
            strengthBar.innerHTML = "";
            break;
        case 1:
            strengthBar.innerHTML = "<span style='color:red'>Password strength: Weak</span>";
            break;
        case 2:
            strengthBar.innerHTML = "<span style='color:orange'>Password strength: Good</span>";
            break;
        case 3:
            strengthBar.innerHTML = "<span style='color:lightgreen'>Password strength: Strong</span>";
            break;
        case 4:
            strengthBar.innerHTML = "<span style='color:green'>Password strength: Very strong</span>";
            break;
    }
}


