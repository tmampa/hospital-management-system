// app/javascript/appointments.js

document.addEventListener('DOMContentLoaded', function() {
    // Get all "Book Appointment" buttons
    const bookButtons = document.querySelectorAll('[data-modal-target="crud-modal"]');

    bookButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Get the doctor's ID from the data attribute
            const doctorId = this.getAttribute('data-doctor-id');

            // Log the doctorId to the console for debugging
            console.log('Doctor ID:', doctorId);

            // Set the doctor's ID in the hidden input field in the form within the modal
            const doctorIdInput = document.getElementById('doctor_id');
            doctorIdInput.value = doctorId;
        });
    });
});