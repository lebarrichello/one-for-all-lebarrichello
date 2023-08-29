SELECT
    U.user_name AS pessoa_usuaria,
    COUNT(LH.music_id) AS musicas_ouvidas,
    ROUND(SUM(S.music_time / 60), 2) AS total_minutos
FROM SpotifyClone.users AS U
    JOIN SpotifyClone.playback_history as LH ON U.user_id = LH.user_id
    JOIN SpotifyClone.songs as S ON S.music_id = LH.music_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;

