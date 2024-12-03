Geocoder.configure(
  lookup: :mapbox,
  api_key: ENV['MAPBOX_API_KEY'],
  always_raise: [
    Geocoder::OverQueryLimitError,
    Geocoder::RequestDenied,
    Geocoder::InvalidRequest,
    Geocoder::InvalidApiKey
  ],
  timeout: 3,
  units: :km
)
