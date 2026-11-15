-- Run in Supabase SQL Editor. Public reads/submissions are enabled by design.
create table if not exists public.stories (
  id uuid primary key default gen_random_uuid(),
  title text not null check (char_length(title) between 1 and 80),
  nickname text not null default '익명' check (char_length(nickname) <= 40),
  category text not null check (category in ('사업','사이드 프로젝트','기획·공모','기타')),
  story text not null check (char_length(story) between 1 and 1000),
  lesson text not null default '' check (char_length(lesson) <= 180),
  created_at timestamptz not null default now()
);
create table if not exists public.cheers (
  story_id uuid not null references public.stories(id) on delete cascade,
  visitor_id uuid not null,
  created_at timestamptz not null default now(),
  primary key (story_id, visitor_id)
);
alter table public.stories enable row level security;
alter table public.cheers enable row level security;
revoke all on public.stories from anon, authenticated;
revoke all on public.cheers from anon, authenticated;
grant select, insert on public.stories to anon, authenticated;
grant select, insert on public.cheers to anon, authenticated;
create policy "Anyone can read stories" on public.stories for select to anon, authenticated using (true);
create policy "Anyone can submit a story" on public.stories for insert to anon, authenticated with check (true);
create policy "Anyone can read cheers" on public.cheers for select to anon, authenticated using (true);
create policy "Anyone can cheer" on public.cheers for insert to anon, authenticated with check (true);

