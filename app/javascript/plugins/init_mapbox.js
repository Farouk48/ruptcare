import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


// const map = new mapboxgl.Map({
//   container: 'map',
//   style: 'mapbox://styles/vbolta/ckea30aj04zzf1anzpph5ntrq' // <-- use your own!
// });


//const fitMaptoDescription => {
  //const positions = document.getElementById('pharma-display');
  //positions.addEventListener

//};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    const mapMarkers = []
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
      const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '25px';
        element.style.height = '25px';
      const newMarker = new mapboxgl.Marker(element)

        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(map);
        mapMarkers.push(newMarker)
        newMarker.getElement().dataset.markerId = marker.id;
        newMarker.getElement().addEventListener('mouseenter', (e) => togglePharmaHighlighting(e) );
        newMarker.getElement().addEventListener('mouseleave', (e) => togglePharmaHighlighting(e) );
      });
      console.log(mapMarkers);
     const mainMarker = new mapboxgl.Marker()
      .setLngLat([2.3837872, 48.8666236])
      .addTo(map);

      //test

    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,mapboxgl: mapboxgl }));

    openInfoWindow(mapMarkers)
  }
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const openInfoWindow = (markers) => {
  const pharmas = document.querySelectorAll('.pharma-display')
  console.log(pharmas);
  pharmas.forEach((pharma,index) => {
    pharma.addEventListener('mouseenter', () => {
      markers[index].togglePopup();
      });
    pharma.addEventListener('mouseleave',() => {
      markers[index].togglePopup();
    });
  });
}

const togglePharmaHighlighting = (event) => {
  const pharma = document.querySelector(`[data-pharma-id="${event.currentTarget.dataset.markerId}"]`);
  pharma.classList.toggle('highlight');
}


export { initMapbox };

