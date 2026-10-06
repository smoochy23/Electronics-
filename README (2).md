# Electronics Store — full online admin version

## Customer side
- Products and stock are loaded from Supabase.
- Checkout saves orders immediately to the online database.
- M-Pesa confirmation code is saved with the order.
- SMS and WhatsApp contact buttons remain available.

## Owner dashboard
Sign in through **Manage** using a Supabase Auth user.

You can:
- View all orders
- See customer details and delivery address
- See order items and totals
- See M-Pesa confirmation codes
- Mark orders Pending / Paid / Delivered / Cancelled
- Add products
- Edit product name, price, category, stock, description, icon and photo URL
- Delete products

## Setup
1. Create a Supabase project at https://supabase.com/
2. Open SQL Editor and run `schema.sql`.
3. Authentication -> Users -> create the owner's email/password.
4. Open `index.html`.
5. Replace:
   `PASTE_YOUR_SUPABASE_PROJECT_URL_HERE`
   `PASTE_YOUR_SUPABASE_ANON_KEY_HERE`
6. Deploy the project to Vercel or Netlify.

Use only the Supabase anon/publishable key in the browser. Never expose a service_role/secret key.

## Product photos
The admin currently accepts a public image URL. This keeps the first version simple. Supabase Storage can be added next for direct upload from the dashboard.

## Important
The current RLS policies treat any authenticated Supabase user as an owner. For a single-owner store this is usually sufficient, but if you add staff accounts later, add a proper roles/owner table and restrict policies to those users.
