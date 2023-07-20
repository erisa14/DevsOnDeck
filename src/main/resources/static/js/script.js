var selectedCount = 0;

function limitSelection() {
    var checkboxes = document.getElementsByName('jobSkill');
    var checkedCount = 0;

    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            checkedCount++;
        }
    }

    if (checkedCount > 5) {
        alert('You can select a maximum of 5 checkboxes.');
        event.preventDefault(); // Prevent further selection
    }
}