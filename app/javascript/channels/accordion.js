const cardHeaders = document.querySelectorAll(".card-header");

cardHeaders.forEach(cardHeader => {
  cardHeader.addEventListener("click", event => {
    cardHeader.classList.toggle("active");
  });
});
