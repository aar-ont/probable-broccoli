-- Test fixture for Vibe Report Card: a notes table whose second policy lets
-- anyone, signed in or not, change or delete every row.
create table public.notes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  body text not null,
  created_at timestamptz not null default now()
);

alter table public.notes enable row level security;

create policy "Users can view their own notes" on public.notes
  for select using (auth.uid() = user_id);

create policy "Anyone can manage notes" on public.notes
  for all using (true) with check (true);
