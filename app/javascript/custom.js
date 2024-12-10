document.addEventListener('DOMContentLoaded', () => {
  const checkbox = document.getElementById('changePasswordCheckbox');
  const passwordFields = document.getElementById('passwordFields');

  if (checkbox) {
    checkbox.addEventListener('change', () => {
      if (checkbox.checked) {
        passwordFields.classList.remove('d-none');
      } else {
        passwordFields.classList.add('d-none');
      }
    });
  }
});
