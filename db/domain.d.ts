interface Role {
  name: string;
  roleId?: string;
}

interface Account {
  login: string;
  password: string;
  rolesId: string[];
  accountId?: string;
}

interface Address {
  country: string;
  state?: string;
  city: string;
  streetAddress: string;
}

interface AggregatedCostRates {
  spot: string;
  port: string;
}

interface Area {
  name: string;
  ownerId: string;
  membersId: string[];
  areaId?: string;
}

interface PortType {
  socket: string;
  current: string;
  portTypeId?: string;
}

interface Vehicle {
  guid: string;
  model: string;
  kind: string;
  portTypeId: string;
  vehicleId?: string;
}

interface Client {
  guid: string;
  accountId: string;
  firstName: string;
  lastName: string;
  phones: string;
  vehicleId: string;
  clientId?: string;
}

interface BillingSettings {
  guid: string;
  clientId: string;
  cardNo: string;
  main?: boolean;
  billingSettingsId?: string;
}

interface Parking {
  guid: string;
  name: string;
  address: string;
  location: string;
  parkingId?: string;
}

interface ElectricCharger {
  guid: string;
  model: string;
  parkingId?: string;
  electricChargerId?: string;
}

interface ChargingPort {
  guid: string;
  available?: boolean;
  cost: string;
  typeId: string;
  power: string;
  stationId: string;
  chargingPortId?: string;
}

interface Location {
  latitude: number;
  longitude: number;
}

interface Message {
  areaId: string;
  fromId: string;
  text: string;
  messageId?: string;
}

interface Spot {
  guid: string;
  parkingId: string;
  floor: number;
  place: number;
  cost: string;
  available?: boolean;
  suitableFor: string;
  chargersId: string[];
  portsId: string[];
  spotId?: string;
}

interface Rent {
  guid: string;
  spotId: string;
  chargingPortId: string;
  clientId: string;
  started: string;
  finished?: string;
  freezedCostRates: string;
  totalPrice?: string;
  rentId?: string;
}

interface Payment {
  guid: string;
  rentId: string;
  billingSettingsId: string;
  amount: string;
  when: string;
  paymentId?: string;
}

interface Session {
  accountId: string;
  token: string;
  ip: string;
  data: string;
  sessionId?: string;
}

interface TypedStringValue {
  type: string;
  value: string;
}
