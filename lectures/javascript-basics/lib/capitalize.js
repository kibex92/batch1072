const capitalize = (word) => {
	// Take the first letter and upcase it
	const firstLetter = word[0].toUpperCase();
	console.log(firstLetter);
	// Take substring of rest of the letters and lowercase it
	const restOfWord = word.substring(1).toLowerCase();
	// Interpolate the two variables
	return `${firstLetter}${restOfWord}`;
};

capitalize("bORIs");
console.log(capitalize("bORIs"));
