-- Added by Vibe Report Card: closes database rules that let anyone change or delete rows.
-- Apply it in the Supabase SQL Editor, or with `supabase db push`.

drop policy if exists "Anyone can manage notes" on public.notes;

create policy "notes: owners can insert their rows" on public.notes
  for insert to authenticated
  with check (auth.uid() = user_id);

create policy "notes: owners can update their rows" on public.notes
  for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "notes: owners can delete their rows" on public.notes
  for delete to authenticated
  using (auth.uid() = user_id);
