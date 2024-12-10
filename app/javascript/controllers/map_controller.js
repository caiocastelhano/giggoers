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
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      // Determine marker color based on marker type
      const color = marker.marker_type === "user" ? "blue" : "red"

      // Create a custom marker element
      const markerElement = document.createElement("div")
      markerElement.className = "custom-marker"
      markerElement.style.backgroundColor = color
      markerElement.style.width = "20px"
      markerElement.style.height = "20px"
      markerElement.style.borderRadius = "50%"

      new mapboxgl.Marker(markerElement)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
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
    // Create a popup for the user's location
    const popup = new mapboxgl.Popup().setHTML("Your Location")

    // Create a blue marker for the user's location
    const markerElement = document.createElement("div")
    markerElement.className = "custom-marker"
    markerElement.style.backgroundColor = "blue"
    markerElement.style.width = "20px"
    markerElement.style.height = "20px"
    markerElement.style.borderRadius = "50%"

    // Add the user's marker to the map
    new mapboxgl.Marker(markerElement)
      .setLngLat([userLocation.lng, userLocation.lat])
      .setPopup(popup)
      .addTo(this.map)

    // Dynamically add the user's location to the bounds
    this.markersValue.push({
      lat: userLocation.lat,
      lng: userLocation.lng,
      marker_type: "user"
    })
  }
}
