# Electronics Store — real online orders

This version keeps the original storefront and changes order handling so a checkout is saved to Supabase immediately.

## Included
- Customer checkout saved online.
- M-Pesa confirmation code saved with the order.
- Owner login using Supabase Auth.
- Owner Manage page showing orders, customer details, totals and payment code.
- Owner can mark orders Pending / Paid / Delivered / Cancelled.
- SMS and WhatsApp buttons remain available after checkout.

## Setup
1. Create a Supabase project: https://supabase.com/
2. Open SQL Editor and run `schema.sql`.
3. Go to Authentication -> Users and create the owner's email/password account.
4. Open `index.html` and replace the two placeholders under `CONFIG` with your Supabase Project URL and anon/publishable key.
5. Deploy `index.html` to Vercel or Netlify.

IMPORTANT: never put a Supabase service_role/secret key in the browser.

## Deployment
Vercel: import this folder/repository; no build command is required.
Netlify: deploy the folder as a static site; no build command is required.

## Next upgrade
Products can also be moved into Supabase so the owner can add/edit products, stock and prices from the online admin dashboard without editing HTML.
