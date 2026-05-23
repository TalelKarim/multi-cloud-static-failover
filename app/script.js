async function loadRuntimeConfig() {
  const response = await fetch("/runtime-config.json");

  return response.json();
}

async function init() {
  const config = await loadRuntimeConfig();

  document.getElementById("cloud-provider").innerText =
    config.cloudProvider;
}

init();