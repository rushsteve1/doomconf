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
