({
  // Schema kind to describe domain models that not entity and might be stored as JSONB in DB
  Struct: {},

  country: 'string',
  state: '?string',
  city: 'string',
  streetAddress: 'string',
});
