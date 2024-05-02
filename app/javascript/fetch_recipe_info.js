document.addEventListener("turbo:load", function() {
  const originalUrlField = document.getElementById("original_url");
  if (originalUrlField) {
    originalUrlField.addEventListener("paste", function(event) {
      const pastedText = (event.clipboardData || window.clipboardData).getData('text');

      // ペーストされたテキストをフィールドにセット
      originalUrlField.value = pastedText;

      // fetchRecipeInfo関数を呼び出す
      fetchRecipeInfo(pastedText);
    });
  } else {
    console.error("Original URL field not found.");
  }
});

function fetchRecipeInfo(url) {
  fetch(`/recipes/fetch_info?url=${encodeURIComponent(url)}`)
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        document.getElementById("recipe_title").value = data.title;
        document.getElementById("recipe_image_url").value = data.image_url;
        document.getElementById("recipe_description").value = data.description;
      } else {
        console.error("Failed to fetch recipe information:", data.error);
      }
    })
    .catch(error => {
      console.error("Error fetching recipe information:", error);
    });
}