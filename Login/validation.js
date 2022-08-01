const name = document.getElementById('username')
const password = document.getElementById('password')
const form = document.getElementById('form')
form.addEventListener('submit', (e) => {
    let messages = []
    if (name.value === '' || name.value == null)
    {
        alert('Name is Required')
    }

    if (password.value.length <= 8) {
        alert('Password must be longer than 8 characters')
    }

    if (password.value.length >= 20) {
        alert('Password must be less than 20 characters')
    }

    if (password.value === 'password') {
        alert('Password cannot be password')
    }

    if (messages.length > 0) {
        e.preventDefault()
        errorElement.innerText = messages.join(', ')
    }
})