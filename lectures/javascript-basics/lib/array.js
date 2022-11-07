const students = ["Bilhid", "Murad", "Maria", "Ajush"];

// C-Reate
students.push("Pierre");
console.log(students);

// R-ead
console.log(students[2]);

// U-pdate
students[2] = "Marie";
console.log(students);

// D-elete
students.splice(0, 1);
console.log(students);

// students.each do | student |
//   puts student
// end

students.forEach((student) => {
	console.log(student.toUpperCase());
});
