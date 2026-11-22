# Our Reading Log

A small website for logging finished books: reader, title, author, pages, date finished and an optional 1 to 5 star rating. Tap the stars on any book in the list to rate it later; tap the same star again to clear it. It shows each reader's book and page totals for the year and a list you can filter by reader and year.

## Files

- `index.html`: the app itself. You normally don't need to touch it.
- `config.js`: **the file to edit for small changes.**
  - `appTitle`: the heading at the top.
  - `readers`: the names in the Reader dropdown. Add a name to add a person.
  - `accentColor`: the button and heading color.
  - `supabaseUrl` and `supabaseAnonKey`: the shared database connection, filled in when the app goes online.
- `supabase-setup.sql`: run once in Supabase to create the books table.

## Preview mode

When the database keys in `config.js` are blank, the app saves books in your browser only. That's useful for trying it out, but your nephew won't see those entries. Once the keys are filled in, everyone with the link shares one list.

## Note on access

There's no login. Anyone with the link can add or remove books, so share the link only with the people you want using it.
