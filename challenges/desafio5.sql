SELECT
    s.music_name AS cancao,
    COUNT(ph.user_id) AS reproducoes
FROM SpotifyClone.songs s
LEFT JOIN SpotifyClone.playback_history ph ON s.music_id = ph.music_id
GROUP BY s.music_name
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;