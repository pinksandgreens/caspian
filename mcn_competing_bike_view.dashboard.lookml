- dashboard: mcn_competing_bike_view
  auto_run: true
  show_applied_filters: true
  title: Mcn Competing Bike View
  layout: tile
  tile_size: 100

#  filters:

  
  filters:
  
  - name: BIKE_FILTER
    title: 'Choose Focus Bike'
    type: string_filter
    explore: mcn_competing_bike_view
    field: mcn_competing_bike_view.BIKE
