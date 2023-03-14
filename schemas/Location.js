({
  // Schema kind to describe domain models that not entity and might be stored as JSONB in DB
  Struct: {
    note: 'A geographical coordinate',
  },

  latitude: { type: 'number', length: { min: -90, max: 90 } },
  longitude: { type: 'number', length: { min: -180, max: 180 } },
});
