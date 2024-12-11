import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {
  static targets = ['link']
  connect() {
  }
  geolocate(){
    if (!navigator.geolocation) {
      this.linkTarget.textContent = 'Geolocalização não suportada'
    } else {
      navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error.bind(this));
    }
  }

  success(position) {
    const geolocation = {
      'latitude': position.coords.latitude,
      'longitude': position.coords.longitude,
    }
    this.linkTarget.textContent = 'Procurando eventos perto de você';

    this.search(geolocation)
  }

  error() {
    this.linkTarget.textContent = 'Não foi possível identificar sua localização';
  }

  search(geolocation){
    const token = document.getElementsByName("csrf-token")[0].content

    fetch('/events/user_geolocation',{
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        "X-CSRF-Token": token
      },
      body: JSON.stringify(geolocation)
    })
    .then((data)=>{
      console.log(data)
    })
  }
}
