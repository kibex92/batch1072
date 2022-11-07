const person = {
	name: "Elvis",
	age: 30,
};

// C-reate
person.skills = "Hacking";
console.log(person);
// R-ead
console.log(person.name);

//  U-pdate
person.name = "Elvis";

// D-elete
delete person.age;
console.log(person);
