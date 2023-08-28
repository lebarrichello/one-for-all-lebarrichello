SELECT
    COUNT(*) AS musicas_no_historico
FROM SpotifyClone.playback_history ph
INNER JOIN SpotifyClone.users u ON ph.user_id = u.user_id
WHERE u.user_name = 'Barbara Liskov';
