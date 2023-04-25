const createImageHTML = (blob) => {
  const imageElement = document.getElementById('new-image');
  const blobImage = document.createElement('img');
  blobImage.setAttribute('class', 'new-img');
  blobImage.setAttribute('src', blob);

  imageElement.appendChild(blobImage);
};

function selectImageIfPresent() {
  const inputElement = document.getElementById('recipe_recipe_image');
  if (inputElement.files && inputElement.files[0]) {
    const file = inputElement.files[0];
    const blob = window.URL.createObjectURL(file);
    createImageHTML(blob);
  }
}

if (document.URL.match(/recipes\/new/) || document.URL.match(/recipes\/\d+\/edit/)) {
  document.addEventListener('turbolinks:load', () => {
    document.getElementById('recipe_recipe_image').addEventListener('change', (e) => {
      const imageContent = document.querySelector('img');
      if (imageContent) {
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });

    // ページの読み込みが完了したときに画像を選択
    selectImageIfPresent();
  });
}
