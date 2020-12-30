document.addEventListener("turbolinks:load", function() {
  const task_ja = document.querySelector('.task_ja');
  const task_en = document.querySelector('.task_en');

    translate.addEventListener('change', function() {
      const url = "https://script.google.com/macros/s/AKfycbwMfVWHciY9Q6mw2eMpVIA-569em9ggdt3er5x75Nm-di5N8Jg/exec?text="+task_ja.value+"&source=ja&target=en";
      const request = new XMLHttpRequest();
      request.open("GET", url);

      request.addEventListener("load", (e) => {
        task_en.innerHTML= e.currentTarget.response;
      });
      task_en.innerHTML= "loading...";
      request.send();
    })
})