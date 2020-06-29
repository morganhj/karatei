window.refresh = (querySelector,innerHTML) => {
  const element = document.querySelector(querySelector);
  element.innerHTML = innerHTML
}

window.refreshParent = (querySelector,innerHTML) => {
  const elementParent = document.querySelector(querySelector).parentElement;
  elementParent.innerHTML = innerHTML
}

window.refreshById = (id,innerHTML) => {
  const element= document.getElementById(id);
  element.innerHTML = innerHTML
}