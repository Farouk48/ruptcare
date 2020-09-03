const initTabs = () => {
  const tabs = document.querySelectorAll('.drug-information-tabs li');
  tabs.forEach((tab) => {
    tab.addEventListener("click", (event) => {
      const currentTab = event.currentTarget;
      // J'enlève la classe active de toute mes tabs
      tabs.forEach(tab => tab.classList.remove("active"));
      // J'ajoute la classe active sur le li cliqué
      currentTab.classList.add("active");
      const tabContents = document.querySelectorAll('.drug-information-tab-content > p');
      tabContents.forEach(content => content.classList.remove("active"));
      const targetedContent = document.getElementById(currentTab.dataset.id);
      targetedContent.classList.add("active");
    });
  });
}

export { initTabs };
