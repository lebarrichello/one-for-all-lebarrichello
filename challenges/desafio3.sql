SELECT
    u.user_name AS pessoa_usuaria,
    COUNT(DISTINCT ph.music_id) AS musicas_ouvidas,
    ROUND(SUM(s.music_time) / 60, 2) AS total_minutos
FROM SpotifyClone.users u
LEFT JOIN SpotifyClone.playback_history ph ON u.user_id = ph.user_id
LEFT JOIN SpotifyClone.songs s ON ph.music_id = s.music_id
GROUP BY u.user_name
ORDER BY u.user_name;


