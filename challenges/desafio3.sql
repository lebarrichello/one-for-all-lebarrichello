SELECT
    U.user_name AS pessoa_usuaria,
    COUNT(H.music_id) AS musicas_ouvidas,
    ROUND(SUM(M.music_time) / 60, 2) AS total_minutos
FROM
    SpotifyClone.users U
JOIN
    SpotifyClone.playback_history H ON U.user_id = H.user_id
JOIN
    SpotifyClone.songs M ON H.music_id = M.music_id
GROUP BY
    U.user_name
ORDER BY
    pessoa_usuaria;