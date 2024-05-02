chrome.runtime.onMessage.addListener((request, sender, sendResponse) => {
    // Perform an asynchronous operation here
    fetch('https://api.example.com/data')
      .then(response => response.json())
      .then(data => {
        // Send the response after the asynchronous operation is complete
        sendResponse(data);
      })
      .catch(error => {
        console.error('Error:', error);
        sendResponse({ error: 'An error occurred' });
      });
  
    // Return true to indicate that you will respond asynchronously
    return true;
  });