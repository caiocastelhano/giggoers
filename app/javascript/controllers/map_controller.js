import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#askForGeolocation()
    
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);

      // Create a custom marker element using an image
      const markerElement = document.createElement("div");
      const markerImage = document.createElement("img");
      markerImage.src = "/assets/logo.png"; // Map the Rails asset pipeline path
      markerImage.alt = "Custom Marker";
      // markerImage.style.width = "30px"; // Set the desired width
      // markerImage.style.height = "30px"; // Set the desired height
      markerElement.appendChild(markerImage);

      new mapboxgl.Marker(markerElement)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #askForGeolocation() {
    if (navigator.geolocation) {
      // Ask the user for permission to get their location
      navigator.geolocation.getCurrentPosition(
        (position) => {
          // On success, add the user's location to the map
          const userLocation = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          }

          this.#addUserMarker(userLocation)
          this.#fitMapToMarkers()
        },
        (error) => {
          console.error("Error fetching geolocation: ", error)
          alert("Unable to fetch your location. Please ensure location services are enabled.")
        }
      )
    } else {
      alert("Geolocation is not supported by your browser.")
    }
  }

  #addUserMarker(userLocation) {
    const popup = new mapboxgl.Popup().setHTML("Sua Localização");

    // Criar um elemento para o marcador com uma imagem
    const markerElement = document.createElement("div");
    const markerImage = document.createElement("img");
    markerImage.src = "/assets/user_marker.png"; // Caminho do asset
    markerImage.alt = "Localização do Usuário";
    markerImage.style.width = "30px";
    markerImage.style.height = "30px";
    markerElement.appendChild(markerImage);

    new mapboxgl.Marker(markerElement)
      .setLngLat([userLocation.lng, userLocation.lat])
      .setPopup(popup)
      .addTo(this.map);
  }

}
