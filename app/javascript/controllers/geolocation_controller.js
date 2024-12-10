import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {
  static targets = ['link']
  connect() {
  }
  geolocate(){
    if (!navigator.geolocation) {
      this.linkTarget.textContent = 'geolocalizacao nao suportada'
    } else {
      navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error.bind(this));
    }
  }

  success(position) {
    const geolocation = {
      'latitude': position.coords.latitude,
      'longitude': position.coords.longitude,
    }
    this.linkTarget.textContent = 'Procurando eventos perto de voce';

    this.search(geolocation)
  }

  error(){
    this.linkTarget.textContent = 'Nao foi possivel pegar a localizacao';
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
