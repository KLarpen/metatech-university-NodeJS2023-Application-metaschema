INSERT INTO "Account" ("login", "password") VALUES
  ('admin', 'ypMEd9FwvtlOjcvH94iICQ==:V6LnSOVwXzENxeLCJk59Toadea7oaA1IxYulAOtKkL9tBxjEPOw085vYalEdLDoe8xbrXQlhh7QRGzrSe8Bthw=='),
  ('marcus', 'dpHw0OUNBz76nuqrXZbeYQ==:wpvUVgi8Yp9rJ0yZyBWecaWP2EL/ahpxZY74KOVfhAYbAZSq6mWqjsQwtCvIPcSKZqUVpVb13JcSciB2fA+6Tg=='),
  ('user', 'r8zb8AdrlPSh5wNy6hqOxg==:HyO5rvOFLtwzU+OZ9qFi3ADXlVccDJWGSfUS8mVq43spJ6sxyliUdW3i53hOPdkFAtDn3EAQMttOlIoJap1lTQ=='),
  ('iskandar', 'aqX1O4bKXiwC/Jh2EKNIYw==:bpE4TARNg09vb2Libn1c00YRxcvoklB9zVSbD733LwQQFUuAm7WHP85PbZXwEbbeOVPIFHgflR4cvEmvYkr76g==');

-- Examples login/password
-- admin/123456
-- marcus/marcus
-- user/nopassword
-- iskandar/zulqarnayn

INSERT INTO "Area" ("name", "ownerId") VALUES
  ('Metarhia', 2),
  ('Metaeducation', 2);

INSERT INTO "AreaAccount" ("areaId", "accountId") VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 2),
  (2, 3),
  (2, 4);

INSERT INTO "Role" ("name") VALUES
  ('admin'),
  ('support'),
  ('moderator'),
  ('member');

INSERT INTO "AccountRole" ("accountId", "roleId") VALUES
  (1, 1),
  (2, 1),
  (2, 2),
  (4, 3),
  (3, 4);

INSERT INTO "PortType" ("socket", "current") VALUES
  ('Schuko Type F', 'AC'),
  ('Type 1 (J1772)', 'AC'),
  ('Type 2 Mennekes', 'AC'),
  ('GB/T', 'AC'),
  ('CCS Type 1', 'DC'),
  ('CCS Type 2', 'DC'),
  ('Tesla', 'DC'),
  ('GB/T', 'DC'),
  ('CHAdeMO', 'DC');

INSERT INTO "Vehicle" ("guid", "model", "kind", "portTypeId") VALUES
  ('92e22596-da9b-43a4-bd42-84337285177e', 'Nissan LEAF 2015', 'car', 2),
  ('aa64aae1-f952-48b5-8926-30e1f72d4d3b', 'Hyundai IONIQ 5 Standard Range 2WD', 'car', 3),
  ('a90ee1a9-05b4-45c5-aea8-7e10800502b9', 'BYD ATTO 3', 'car', 6);

INSERT INTO "Client" ("guid", "accountId", "firstName", "lastName", "phones", "vehicleId") VALUES
  ('073daccb-e7f4-49af-8f26-850dc33c14c1', 3, 'Тест', 'Тестенко', '[{"type":"main", "value":"+380961112233"}, {"type":"work", "value":"+380504445566"}]'::json, 2);

INSERT INTO "BillingSettings" ("guid", "clientId", "cardNo", "main") VALUES
  ('b8c246cc-84af-436f-9849-535491e19bb7', 1, '0000-0000-0000-1234', TRUE);

INSERT INTO "Parking" ("guid", "name", "address", "location") VALUES
  ('d5103a5d-f720-46b5-84fa-32fd9358a5a7', 'First Point', '{"country":"Ukraine", "city":"Kyiv", "streetAddress":"vulytsia Vyprobna, 25"}'::json, '{"latitude":50.50535659577922, "longitude":30.414988747484568}'::json);

INSERT INTO "Spot" ("guid", "parkingId", "floor", "place", "cost", "suitableFor", "available") VALUES
  ('70092c87-1130-48a9-993a-c6414825db57', 1, 1, 1, 12, '{car, van, motorcycle}'::varchar[], FALSE),
  ('aceb8604-1806-4949-be53-4cc153e83bad', 1, 1, 2, 12, '{car, van, motorcycle}'::varchar[], TRUE),
  ('ed69db56-fcb1-470f-b8cd-6c4fd7e960da', 1, 1, 3, 12, '{car, van, motorcycle}'::varchar[], TRUE),
  ('ee1f8cd0-4803-44c1-a272-9d08031e51d1', 1, 1, 4, 12, '{car, van, motorcycle}'::varchar[], TRUE);

INSERT INTO "ElectricCharger" ("guid", "model", "parkingId") VALUES
  ('8e589ae8-e5bf-4ce1-a919-cfcea2afcf4b', 'ABB Multiport EV charging station', 1);

INSERT INTO "ChargingPort" ("guid", "typeId", "cost", "power", "available", "stationId") VALUES
  ('3f2a68f2-b057-4b29-90ad-0b909aa0a630', 6, 95, 50000, TRUE, 1),
  ('c27949d7-8399-4fca-a853-1be6dbd4173d', 3, 50, 22000, FALSE, 1),
  ('15d6d43e-0456-43b9-8ebf-35d7caf63544', 3, 50, 22000, TRUE, 1),
  ('c1ece3a1-0b86-469b-b55b-018dd10bb68a', 6, 95, 50000, TRUE, 1);

INSERT INTO "SpotElectricCharger" ("spotId", "electricChargerId") VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1);

INSERT INTO "SpotChargingPort" ("spotId", "chargingPortId") VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 2),
  (3, 3),
  (3, 4),
  (4, 3),
  (4, 4);

INSERT INTO "Rent" ("guid", "spotId", "chargingPortId", "clientId", "started", "finished", "freezedCostRates", "totalPrice") VALUES
  ('1090d5d5-e0c2-4880-9556-636270d7d6c8', 4, 3, 1, '2023-01-12T15:35:00.000Z'::timestamptz, '2023-01-12T18:35:00.000Z'::timestamptz, '{"spot":10, "port":45}'::json, 165),
  ('cb6f4fa4-3ff8-40b1-b6a7-148bf1cd66d4', 1, 2, 1, '2023-01-14T08:15:00.000Z'::timestamptz, null, '{"spot":12, "port":50}'::json, null);

INSERT INTO "Payment" ("rentId", "billingSettingsId", "amount", "when") VALUES
  (1, 1, 165, '2023-01-12T18:36:00.000Z'::timestamptz);
