-- ONE-STEP SETUP: creates the books table, lets the website use it, and loads
-- April's January–June 2026 books. Safe to run again: it won't duplicate anything.
-- Supabase > SQL Editor > New query > paste ALL of this > Run.

-- 1. The table
create table if not exists public.books (
  id          bigint generated always as identity primary key,
  reader      text    not null,
  title       text    not null,
  author      text    not null,
  pages       integer not null check (pages > 0),
  finished_on date    not null,
  rating      smallint check (rating between 1 and 5),
  created_at  timestamptz not null default now()
);

-- 2. Let the website (anyone with the link) read, add, rate and remove books
grant usage on schema public to anon, authenticated;
grant select, insert, update, delete on public.books to anon, authenticated;
grant usage, select on all sequences in schema public to anon, authenticated;

alter table public.books enable row level security;
drop policy if exists "public read"   on public.books;
drop policy if exists "public insert" on public.books;
drop policy if exists "public update" on public.books;
drop policy if exists "public delete" on public.books;
create policy "public read"   on public.books for select using (true);
create policy "public insert" on public.books for insert with check (true);
create policy "public update" on public.books for update using (true) with check (true);
create policy "public delete" on public.books for delete using (true);

-- 3. April's books (skips any that are already there)
insert into public.books (reader, title, author, pages, finished_on)
select v.reader, v.title, v.author, v.pages, v.finished_on::date
from (values
  ('April', 'Problematic Summer Romance', 'Ali Hazelwood',          397, '2026-06-30'),
  ('April', 'Game Changer',               'Rachel Reid',            368, '2026-06-30'),
  ('April', 'Heated Rivalry',             'Rachel Reid',            368, '2026-06-30'),
  ('April', 'The Long Game',              'Rachel Reid',            364, '2026-06-30'),
  ('April', 'Role Model',                 'Rachel Reid',            182, '2026-06-30'),
  ('April', 'Mister Charming',            'Piper Rayne',            189, '2026-06-30'),
  ('April', 'The Shots You Take',         'Rachel Reid',            168, '2026-06-30'),
  ('April', 'Girls Like Girls',           'Hayley Kiyoko',          160, '2026-06-30'),
  ('April', 'So Gay for You',             'L. Hailey & K. Moennig', 254, '2026-06-30'),
  ('April', 'The Third Gilmore Girl',     'Kelly Bishop',           239, '2026-06-30'),
  ('April', 'Tales of the City',          'Armistead Maupin',       374, '2026-06-30')
) as v(reader, title, author, pages, finished_on)
where not exists (
  select 1 from public.books b where b.reader = v.reader and b.title = v.title
);

-- 4. Tell the website's connection to pick up the new table right away
notify pgrst, 'reload schema';

-- You should see 11 books for April here:
select reader, count(*) as books, sum(pages) as pages from public.books group by reader;
