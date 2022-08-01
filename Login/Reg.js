const Fname = document.getElementById('fname')
const Lname = document.getElementById('lname')
const Email = document.getElementById('email')
const form = document.getElementById('form')
const UFname = document.getElementById('update_fname')
const ULname = document.getElementById('update_lname')
const UEmail = document.getElementById('update_email')
form.addEventListener('submit', (e) => {
    let messages = []
    if (Fname.value === '' || Fname.value == null) {
        alert('First Name is required')
    }
    if (Lname.value === '' || Lname.value == null) {
        alert('Last Name is required')
    }
    if (Email.value === '' || Email.value == null) {
        alert('Email Address is required')
    }
    if (UFname.value === '' || UFname.value == null) {
        alert('First Name is required')
    }
    if (ULname.value === '' || ULname.value == null) {
        alert('Last Name is required')
    }
    if (UEmail.value === '' || UEmail.value == null) {
        alert('Email Address is required')
    }
    if (messages.length > 0) {
        e.preventDefault()
        errorElement.innerText = messages.join(', ')
    }
})