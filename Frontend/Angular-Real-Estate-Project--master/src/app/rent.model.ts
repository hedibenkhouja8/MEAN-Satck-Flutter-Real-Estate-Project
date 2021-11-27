export interface Rent {
  id: string;
  title: string;
  owner: string;
  description: string;
  image: string;
  size: number;
  room_number: number;
  location: string;
  price_per_month: number;
  start_date_available:Date;
  end_date_available:Date;
}
