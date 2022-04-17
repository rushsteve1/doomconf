function dateString(startTimestamp, endTimestamp) {
  start = new Date(startTimestamp + 'Z').toLocaleString(
    'en-gb',
    {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
      hour: 'numeric',
      minute: 'numeric'
    }
  );

  end = new Date(endTimestamp + 'Z').toLocaleString(
    'en-gb',
    {
      hour: 'numeric',
      minute: 'numeric'
    }
  );

  let timeElem = document.querySelector("#time")
  timeElem.innerHTML = `[[${start} to ${end}]]`
}

function renderTime() {
  let timesToRender = document.getElementsByClassName("singleTime");

  for (const elem of timesToRender) {
    let time = elem.innerHTML + 'Z';

    elem.innerHTML = new Date(time).toLocaleString(
      'en-gb',
      {
        hour: 'numeric',
        minute: 'numeric'
      }
    );
  }
};

renderTime();
