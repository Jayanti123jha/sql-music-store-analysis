Q.9. Return all the track names that have a song length longer than 
the average song length. Return the Name and Milliseconds
for each track. Order by the song length with the longest songs first.


select track.name,track.milliseconds from track
where milliseconds > (
select avg(milliseconds) from track
)
group by track.name, track.milliseconds
order by milliseconds desc;
