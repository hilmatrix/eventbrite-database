INSERT INTO users (
    user_id,
    name,
    email,
    password_hash,
    pin,
    is_event_organizer,
    referral_code,
    profile_image_url,
    is_onboarding_finished,
    created_at,
    updated_at
) VALUES 
(
    1, 
    'Organizer', 
    'organizer@gmail.com', 
    '$2a$10$WHGbKIOYOlUX/wJYKlhLM.qlzS5jMd/2iAjU5.VHlzadV1gwHyheC', 
    '1234', 
    true, 
    'ABCDEFGHIJKL',  -- replace with actual 12-character alphanumeric code
    'https://example.com/images/organizer.png', 
    false, 
    CURRENT_TIMESTAMP, 
    CURRENT_TIMESTAMP
),
(
    2, 
    'Customer', 
    'customer@gmail.com', 
    '$2a$10$WHGbKIOYOlUX/wJYKlhLM.qlzS5jMd/2iAjU5.VHlzadV1gwHyheC', 
    '5678', 
    false, 
    'MNOPQRSTUVWX',  -- replace with actual 12-character alphanumeric code
    'https://example.com/images/customer.png', 
    false, 
    CURRENT_TIMESTAMP, 
    CURRENT_TIMESTAMP
);

