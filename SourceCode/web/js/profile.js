/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateForm() {
    var fullName = document.getElementById('fullName').value;
    var email = document.getElementById('email').value;
    var phone = document.getElementById('phoneNumber').value;

    var fullNamePattern = /^[a-zA-Z-' ]{3,50}$/;
    var emailPattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var phonePattern = /^0\d{9}$/;

    var errorFullNameMessage = document.getElementById('errorFullName');
    var errorEmailMessage = document.getElementById('errorEmail');
    var errorPhoneMessage = document.getElementById('errorPhone');

    if (!fullNamePattern.test(fullName)) {
        errorFullNameMessage.innerHTML = "<span style='color:red'>Invalid full name</span>";
        return false;
    } else {
        errorFullNameMessage.innerHTML = "";
    }

    if (!emailPattern.test(email)) {
        errorEmailMessage.innerHTML = "<span style='color:red'>Invalid email</span>";
        return false;
    } else {
        errorEmailMessage.innerHTML = "";
    }

    if (!phonePattern.test(phone)) {
        errorPhoneMessage.innerHTML = "<span style='color:red'>Invalid phone number</span>";
        return false;
    } else {
        errorPhoneMessage.innerHTML = "";
    }
    return true;
}