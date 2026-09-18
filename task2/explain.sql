-- Индекс для поиска ближайших отправлений с конкретной остановки.
CREATE INDEX idx_trip_stops_stop_departure
    ON trip_stops (stop_id, departure_at, trip_id);

-- Пример параметров для анализа.
SET @stop_id = 5;
SET @from_time = '2026-10-01 08:00:00';

EXPLAIN
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
WHERE ts.stop_id = @stop_id
  AND ts.departure_at >= @from_time
ORDER BY
    ts.departure_at,
    ts.trip_id
LIMIT 15;
