({
  Entity: {
    note: 'Known charging port types descriptors',
  },

  socket: { type: 'string', length: { max: 64 } },
  // Describe string enum types
  current: { enum: ['DC', 'AC'], length: { min: 2, max: 2 } },

  // Define combined unique index on both parameters
  naturalKey: { unique: ['socket', 'current'] },
});
