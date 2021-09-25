import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById(`trainer_location`);

  if (addressInput) {
    const places = require(`places.js`);
    const placesAutocomplete = places({ container: addressInput });
  }
};

export { initAutocomplete };
