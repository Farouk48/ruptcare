const zoomingMarkerWhileScrolling = () => {
console.log("Coucou");
const pharmas = document.querySelectorAll('.pharma-display')
console.log(pharmas);
pharmas.forEach((pharma) => {
  pharma.addEventListener('mouseenter', (event) => {
    event.preventDefault();
    const id =  event.currentTarget.dataset.pharmaId;
    console.log(id);
    const dataMarker = "[data-marker-id='" + `${id}` +"']"
    const marker = document.querySelector(dataMarker)
    console.log(marker)
    marker.style.width = '35px'
    marker.style.height = '35px'
  })
  pharma.addEventListener('mouseleave', (event) => {
    event.preventDefault();
    const id =  event.currentTarget.dataset.pharmaId;
    console.log(id);
    const dataMarker = "[data-marker-id='" + `${id}` +"']"
    const marker = document.querySelector(dataMarker)
    console.log(marker)
    marker.style.width = '25px'
    marker.style.height = '25px'
  })
});
}

export { zoomingMarkerWhileScrolling }
