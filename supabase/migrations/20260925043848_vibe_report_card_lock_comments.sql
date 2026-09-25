-- Added by Vibe Report Card: closes database rules that let anyone change or delete rows.
-- Apply it in the Supabase SQL Editor, or with `supabase db push`.

drop policy if exists "Comments are editable" on public.comments;

create policy "comments: owners can insert their rows" on public.comments
  for insert to authenticated
  with check (auth.uid() = user_id);

create policy "comments: owners can update their rows" on public.comments
  for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "comments: owners can delete their rows" on public.comments
  for delete to authenticated
  using (auth.uid() = user_id);
