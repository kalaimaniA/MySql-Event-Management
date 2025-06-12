1. List all events along with their venue name and city.
SELECT e.event_name, v.venue_name, v.city
FROM Events e
JOIN Venue v ON e.venue_id = v.venue_id;

2. Find the names of organizers who are managing 'Technology' category events.
SELECT DISTINCT o.name
FROM Organizers o
JOIN Events e ON o.organizer_id = e.organizer_id
WHERE e.category = 'Technology';

3. Get the names and ticket types of all confirmed registrations.
SELECT a.name AS audience_name, t.ticket_type
FROM Registration r
JOIN Audience a ON r.audience_id = a.audience_id
JOIN Ticket t ON r.ticket_id = t.ticket_id
WHERE r.status = 'Confirmed';

4. Find all events where the ticket price is more than 100.
SELECT DISTINCT e.event_name
FROM Ticket t
JOIN Events e ON t.event_id = e.event_id
WHERE t.price > 100;

5. Display all audience members who haven't provided an email.

SELECT name, phone
FROM Audience
WHERE email IS NULL;

6. Get total sponsorship amount per event.
SELECT e.event_name, SUM(s.sponsorship_amount) AS total_sponsorship
FROM Events e
JOIN Sponsors s ON e.event_id = s.event_id
GROUP BY e.event_name;

7. Find events and their total revenue from ticket sales (confirmed payments only).
SELECT e.event_name, SUM(p.amount) AS total_revenue
FROM Events e
JOIN Registration r ON e.event_id = r.event_id
JOIN Payment p ON r.registration_id = p.registration_id
WHERE p.status = 'Completed'
GROUP BY e.event_name;

8. List venues with capacity more than 500 and currently 'Available'.
SELECT venue_name, capacity
FROM Venue
WHERE capacity > 500 AND availability_status = 'Available';

9. Find the number of events organized in each city.
SELECT v.city, COUNT(e.event_id) AS event_count
FROM Events e
JOIN Venue v ON e.venue_id = v.venue_id
GROUP BY v.city;

10. Get a list of organizers with more than 5 years of experience.
SELECT name, role, experience_years
FROM Organizers
WHERE experience_years > 5;

11. Show all events that do not have a description.
SELECT event_name, event_date
FROM Events
WHERE description IS NULL;

12. Find out which events have more than 1 sponsor.
SELECT e.event_name, COUNT(s.sponsor_id) AS sponsor_count
FROM Events e
JOIN Sponsors s ON e.event_id = s.event_id
GROUP BY e.event_name
HAVING COUNT(s.sponsor_id) > 1;

13. Get the earliest and latest event dates.
SELECT MIN(event_date) AS earliest_event, MAX(event_date) AS latest_event
FROM Events;

14. List all payments that were not completed and show corresponding audience names.
SELECT a.name, p.amount, p.status
FROM Payment p
JOIN Registration r ON p.registration_id = r.registration_id
JOIN Audience a ON r.audience_id = a.audience_id
WHERE p.status != 'Completed';

15. Display audience names along with the event name and registration status.
SELECT a.name AS audience_name, e.event_name, r.status
FROM Registration r
JOIN Audience a ON r.audience_id = a.audience_id
JOIN Events e ON r.event_id = e.event_id;
