-- Run this once in Supabase: Project > SQL Editor > New query > paste > Run.
-- It creates the table that holds every book and lets the website read and write it.

create table if not exists public.books (
  id          bigint generated always as identity primary key,
  reader      text    not null,
  title       text    not null,
  author      text    not null,
  pages       integer not null check (pages > 0),
  finished_on date    not null,
  rating      smallint check (rating between 1 and 5),  -- optional, 1 to 5 stars
  created_at  timestamptz not null default now()
);

alter table public.books enable row level security;

-- Anyone with the website link can view, add, rate and remove books.
-- (Fine for a family log; the link is the "key".)
create policy "public read"   on public.books for select using (true);
create policy "public insert" on public.books for insert with check (true);
create policy "public update" on public.books for update using (true) with check (true);
create policy "public delete" on public.books for delete using (true);
