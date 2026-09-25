-- Test fixture for Vibe Report Card alerts: a comments table whose policy lets
-- anyone, signed in or not, change or delete every row.
create table public.comments (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  note_id uuid not null references public.notes (id) on delete cascade,
  body text not null
);

alter table public.comments enable row level security;

create policy "Users can read their comments" on public.comments
  for select using (auth.uid() = user_id);

create policy "Comments are editable" on public.comments
  for all using (true) with check (true);
