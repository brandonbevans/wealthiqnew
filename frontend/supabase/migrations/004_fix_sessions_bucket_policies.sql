-- Update storage policies to match per-user folder paths (without bucket prefix)
DROP POLICY IF EXISTS "Users can read their session audio" ON storage.objects;
DROP POLICY IF EXISTS "Users can upload their session audio" ON storage.objects;
DROP POLICY IF EXISTS "Users can delete their session audio" ON storage.objects;

CREATE POLICY "Users can read their session audio"
  ON storage.objects FOR SELECT TO authenticated
  USING (
    bucket_id = 'sessions'
    AND name LIKE auth.uid()::text || '/%'
  );

CREATE POLICY "Users can upload their session audio"
  ON storage.objects FOR INSERT TO authenticated
  WITH CHECK (
    bucket_id = 'sessions'
    AND name LIKE auth.uid()::text || '/%'
  );

CREATE POLICY "Users can delete their session audio"
  ON storage.objects FOR DELETE TO authenticated
  USING (
    bucket_id = 'sessions'
    AND name LIKE auth.uid()::text || '/%'
  );

