SELECT
    u.user_name AS pessoa_usuaria,
    CASE
        WHEN MAX(ph.reproduction_date) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    SpotifyClone.users u
LEFT JOIN
    SpotifyClone.playback_history ph ON u.user_id = ph.user_id
GROUP BY
    u.user_name
ORDER BY
    pessoa_usuaria;