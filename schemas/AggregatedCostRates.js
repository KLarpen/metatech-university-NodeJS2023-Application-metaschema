({
  // Schema kind to describe domain models that not entity and might be stored as JSONB in DB
  Struct: {},

  spot: { type: 'double', length: { min: 0 } },
  port: { type: 'double', length: { min: 0 } },
});
