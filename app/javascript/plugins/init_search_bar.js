const initSearchBar = () => {
	const searchIcon = document.getElementById('search-icon')
	const searchInput = document.getElementById('search-input')
	const listHeader = document.getElementById('list-header')
	const sourceList = document.querySelector('.source-list')
	if (searchIcon) {
		searchIcon.addEventListener('click', () => {
			searchInput.focus()
		})
		searchInput.addEventListener('input', () => {
			if (searchInput.value == "") {
				listHeader.innerText = "This is your List"
			} else { listHeader.innerText = `Results for ${searchInput.value}` }
			fetch(`/api/v1/sources/?query=${searchInput.value}`)
			.then(response => response.json())
			.then((data) => {
				let html = ``
				data["sources"].forEach((source) => {
					html = html + 
					`
					<div id="${source["id"]}" data-collection-title="${source["collection"]["id"]}">
						<a class="row border rounded m-3 dropdown-toggle source pt-2" data-source-id="${source["id"]}" data-collection-id="${source["collection"]["id"]}" data-toggle="dropdown" id="navbarDropdown" aria-haspopup="true" aria-expanded="false" href="#">	
							<div class="col-12">
								<span style="font-size: 12px; color: red;">${source["collection"]["title"]}</span>
								<p class="h6 font-weight-bold source-title">${source["title"]}</p>			
								<span style="font-size: 12px;">${source["url"]}</span>			
							</div>
						</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="${source["url"]}">
								<i class="fas fa-rocket"></i>Go to URL
							</a>
						</div>
					</div>
					`
				})
				sourceList.innerHTML = html
			})
		});
	}
}

export { initSearchBar };