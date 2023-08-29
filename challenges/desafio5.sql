SELECT
    S.music_name AS cancao,
    COUNT(LH.music_id) AS reproducoes
FROM songs as S
    JOIN playback_history as LH ON S.music_id = LH.music_id
GROUP BY LH.music_id
ORDER BY
    reproducoes DESC,
    cancao
LIMIT 2;