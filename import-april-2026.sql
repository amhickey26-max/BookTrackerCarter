-- April's books, January to June 2026, from the paper "Carter v. April Reading Competition" sheet.
-- Run once in Supabase (SQL Editor) AFTER supabase-setup.sql.
-- The sheet has no dates, so every book is dated 2026-06-30 (end of the January–June period).
-- Books marked (A) on the sheet use the halved page count written beside the crossed-out number.

insert into public.books (reader, title, author, pages, finished_on) values
  ('April', 'Problematic Summer Romance', 'Ali Hazelwood',                 397, '2026-06-30'),
  ('April', 'Game Changer',               'Rachel Reid',                   368, '2026-06-30'),
  ('April', 'Heated Rivalry',             'Rachel Reid',                   368, '2026-06-30'),
  ('April', 'The Long Game',              'Rachel Reid',                   364, '2026-06-30'),
  ('April', 'Role Model',                 'Rachel Reid',                   182, '2026-06-30'),
  ('April', 'Mister Charming',            'Piper Rayne',                   189, '2026-06-30'),
  ('April', 'The Shots You Take',         'Rachel Reid',                   168, '2026-06-30'),
  ('April', 'Girls Like Girls',           'Hayley Kiyoko',                 160, '2026-06-30'),
  ('April', 'So Gay for You',             'L. Hailey & K. Moennig',        254, '2026-06-30'),
  ('April', 'The Third Gilmore Girl',     'Kelly Bishop',                  239, '2026-06-30'),
  ('April', 'Tales of the City',          'Armistead Maupin',              374, '2026-06-30');
