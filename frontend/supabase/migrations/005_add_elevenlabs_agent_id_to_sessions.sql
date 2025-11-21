-- Add ElevenLabs agent ID to the sessions table
ALTER TABLE public.sessions
  ADD COLUMN IF NOT EXISTS elevenlabs_agent_id TEXT NOT NULL;

-- Index on agent_id might be useful for filtering sessions by agent
CREATE INDEX IF NOT EXISTS idx_sessions_agent_id
  ON public.sessions(elevenlabs_agent_id);

