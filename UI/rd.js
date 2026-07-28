window.addEventListener('message', function(event) {
  if (event.data.type === 'showTablet') {
      document.getElementById('tablet').style.display = 'flex';
      document.getElementById('background-overlay').style.display = 'block';
      document.body.style.cursor = 'default';
      document.getElementById('officerList').innerHTML = event.data.html; 
  } else if (event.data.type === 'hideTablet') {
      document.getElementById('tablet').style.display = 'none';
      document.getElementById('background-overlay').style.display = 'none';
      document.body.style.cursor = 'none'; 
  }
});

function closeTablet() {
  window.postMessage({ type: 'hideTablet' }, '*');
  fetch(`https://${GetParentResourceName()}/closeTablet`, {
      method: 'POST',
      body: JSON.stringify({})
  });
}

window.addEventListener('keydown', function(event) {
  if (event.key === 'Escape') {
      closeTablet();
  }
});
