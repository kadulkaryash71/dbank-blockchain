import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
	const currentValue = await dbank.checkBalance();
	const displayBox = document.getElementById("value");
	displayBox.innerText = currentValue.toFixed(2);
});

document.querySelector("form").addEventListener("submit", async (e) => {
	e.preventDefault();
	
	const button = e.target.querySelector("#submit-btn");
	button.setAttribute("disabled", true);

	let inputAmount = document.getElementById("input-amount").value;
	let withdrawAmount = document.getElementById("withdrawal-amount").value;
	if (inputAmount.length > 0) {
		console.log("Got Input");
		await dbank.topUp(parseFloat(inputAmount));
	}

	if (withdrawAmount.length > 0) {
		await dbank.withdraw(parseFloat(withdrawAmount));
	}

	await dbank.compound();

	inputAmount = "";
	withdrawAmount = "";
	
	button.removeAttribute("disabled");
	location.reload();
}) 