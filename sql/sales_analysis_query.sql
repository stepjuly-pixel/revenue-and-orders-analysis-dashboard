SELECT
    s.date,
    sp.country,
    sp.device,
    p.category,
    p.name AS product,
    SUM(p.price) AS revenue,
    COUNT(o.ga_session_id) AS order_cnt
FROM `DA.order` o
JOIN `DA.session` s
    ON o.ga_session_id = s.ga_session_id
JOIN `DA.product` p
    ON o.item_id = p.item_id
JOIN `DA.session_params` sp
    ON o.ga_session_id = sp.ga_session_id
GROUP BY
    s.date,
    sp.country,
    sp.device,
    p.category,
    p.name