create table if not exists public.salon_progress (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.salon_progress enable row level security;

drop policy if exists "salon_progress_public_read" on public.salon_progress;
create policy "salon_progress_public_read"
on public.salon_progress
for select
to anon
using (true);

drop policy if exists "salon_progress_public_insert" on public.salon_progress;
create policy "salon_progress_public_insert"
on public.salon_progress
for insert
to anon
with check (true);

drop policy if exists "salon_progress_public_update" on public.salon_progress;
create policy "salon_progress_public_update"
on public.salon_progress
for update
to anon
using (true)
with check (true);
