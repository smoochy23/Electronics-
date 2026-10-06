-- Run this whole file in Supabase SQL Editor.

create table if not exists public.orders (
  id text primary key,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  name text not null,
  phone text not null,
  address text not null,
  note text default '',
  items jsonb not null,
  fee numeric not null default 0,
  total numeric not null,
  payment_method text not null check (payment_method in ('mpesa','delivery')),
  mpesa_code text,
  status text not null default 'pending'
    check (status in ('pending','paid','delivered','cancelled'))
);

alter table public.orders enable row level security;

drop policy if exists "Anyone can place an order" on public.orders;
create policy "Anyone can place an order"
on public.orders for insert to anon, authenticated
with check (true);

drop policy if exists "Authenticated owner can read orders" on public.orders;
create policy "Authenticated owner can read orders"
on public.orders for select to authenticated
using (true);

drop policy if exists "Authenticated owner can update orders" on public.orders;
create policy "Authenticated owner can update orders"
on public.orders for update to authenticated
using (true)
with check (true);

create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists orders_set_updated_at on public.orders;
create trigger orders_set_updated_at
before update on public.orders
for each row execute function public.set_updated_at();

-- Then create the owner login:
-- Supabase Dashboard -> Authentication -> Users -> Add user.
