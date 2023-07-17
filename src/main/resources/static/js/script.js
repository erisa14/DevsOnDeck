var selectedSkills = [];

function toggleSkillSelection(imageElement, skillId) {
    var index = selectedSkills.indexOf(skillId);
    if (index > -1) {
        // Skill already selected, remove it from the array
        selectedSkills.splice(index, 1);
        imageElement.classList.remove('selected');
    } else {
        // Skill not selected, add it to the array
        if (selectedSkills.length >= 5) {
            alert("You can only select up to 5 skills.");
            return;
        }
        selectedSkills.push(skillId);
        imageElement.classList.add('selected');
    }
    // Update the hidden input value with the selected skill IDs
    document.getElementById('selectedSkills').value = selectedSkills.join(',');
}