import React, { useState } from 'react';
import { MapIcon } from 'lucide-react';
import { Card, CardHeader, CardTitle, CardContent } from '@/components/ui/card';
import { Alert, AlertDescription } from '@/components/ui/alert';

const VenueMap = ({ markers }) => {
  const [selectedVenue, setSelectedVenue] = useState(null);

  React.useEffect(() => {
    import('mapbox-gl').then(mapboxgl => {
      mapboxgl.accessToken = process.env.NEXT_PUBLIC_MAPBOX_API_KEY;

      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v12',
        center: [-46.6333, -23.5505], // São Paulo
        zoom: 12
      });

      map.addControl(new mapboxgl.NavigationControl());

      map.on('load', () => {
        markers.forEach(marker => {
          // Criar elemento HTML customizado para o marcador
          const el = document.createElement('div');
          el.className = 'custom-marker';
          el.style.width = '25px';
          el.style.height = '25px';
          el.style.backgroundColor = '#FF0000';
          el.style.borderRadius = '50%';
          el.style.border = '2px solid white';

          // Criar popup com o HTML fornecido pelo Rails
          const popup = new mapboxgl.Popup({ offset: 25 })
            .setHTML(marker.info_window_html);

          // Adicionar marcador ao mapa
          new mapboxgl.Marker(el)
            .setLngLat([marker.lng, marker.lat])
            .setPopup(popup)
            .addTo(map);

          // Evento de clique no marcador
          el.addEventListener('click', () => {
            setSelectedVenue({
              name: marker.name,
              address: marker.address,
              capacity: marker.capacity
            });
          });
        });

        // Ajustar o mapa para mostrar todos os marcadores
        const bounds = new mapboxgl.LngLatBounds();
        markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
        map.fitBounds(bounds, { padding: 70 });
      });

      return () => map.remove();
    }).catch(error => {
      console.error('Error loading Mapbox:', error);
    });
  }, [markers]);

  if (!markers?.length) {
    return (
      <Alert>
        <AlertDescription>
          Nenhum local encontrado.
        </AlertDescription>
      </Alert>
    );
  }

  return (
    <div className="space-y-4">
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <MapIcon className="h-6 w-6" />
            Locais de Eventos em São Paulo
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div id="map" className="h-96 w-full rounded-md" />
        </CardContent>
      </Card>

      {selectedVenue && (
        <Card>
          <CardHeader>
            <CardTitle>{selectedVenue.name}</CardTitle>
          </CardHeader>
          <CardContent className="space-y-2">
            <p className="text-sm text-gray-600">Endereço:</p>
            <p>{selectedVenue.address}</p>
            <p className="text-sm text-gray-600">Capacidade:</p>
            <p>{selectedVenue.capacity} pessoas</p>
          </CardContent>
        </Card>
      )}
    </div>
  );
};

export default VenueMap;
