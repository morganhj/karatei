import { fetchWithToken } from "../utils/fetch_with_token";

const handleClick = (submitCollections, event) => {
	let forms = document.querySelectorAll('.edit_collection')
	forms.forEach((form) => {
		fetchWithToken(form.action, {
			method: "PATCH",
			headers: {
				"Accept": "application/json",
				"Content-Type": "application/json"
			},
			body: JSON.stringify({ collection: { percentage: form.lastElementChild.firstElementChild.value }})
		})
		.then(response => response.json())
		.then((data) => {
      	// handle JSON response from server
      	console.log("Collections Updated")
      });
	})
	document.getElementById('submit-collections').removeEventListener('click', handleClick)
}


const initSlider = () => {
	const submitCollections = document.getElementById('submit-collections')
	if (submitCollections) {
		submitCollections.addEventListener("click", handleClick)
	}
	const sliders = document.querySelectorAll('#collection_percentage')
	if (sliders) {
		sliders.forEach((slider) => {
			const sliderValue = document.querySelector(`span[data-collection-id="${slider.form.id}"`)
			sliderValue.innerHTML = `${slider.value}`
			slider.addEventListener('change', (e) => {
				submitCollections.addEventListener("click", handleClick)
				sliderValue.innerHTML = `${slider.value}`
			})
		})
	}
}

export { initSlider };