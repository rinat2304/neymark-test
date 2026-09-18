-- Следующие 15 отправлений с заданной остановки.
--
-- Параметры:
-- :stop_id   — ID остановки
-- :from_time — момент, начиная с которого ищем отправления

SELECT
    ts.departure_at,
    r.name AS route_name,
    b.plate_number
FROM trip_stops ts
JOIN trips t
    ON t.id = ts.trip_id
JOIN routes r
    ON r.id = t.route_id
JOIN buses b
    ON b.id = t.bus_id
WHERE ts.stop_id = :stop_id
  AND ts.departure_at >= :from_time
ORDER BY
    ts.departure_at,
    ts.trip_id
LIMIT 15;