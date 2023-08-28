SELECT
    CASE
        WHEN U.user_age <= 30 THEN 'Até 30 anos'
        WHEN U.user_age BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
        WHEN U.user_age > 60 THEN 'Maior de 60 anos'
    END as faixa_etaria,
    COUNT(DISTINCT U.user_id) AS total_pessoas_usuarias,
    COUNT(F.music_id) AS total_favoritadas
FROM
    SpotifyClone.users AS U
    LEFT JOIN SpotifyClone.favorites AS F ON U.user_id = F.user_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;