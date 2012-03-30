# Health Timeline Project

### What it is
MedLog is a symptom log for the 21st century.


### Known Issues:

####Response#chunked = true
not a problem:
http://stackoverflow.com/questions/7082364/what-does-warn-could-not-determine-content-length-of-response-body-mean-and-h

####Sorting episodes on the index doesn't list user-owned episodes first
Database-side fixes to this will probably involve a second query which will
introduce extra overhead. Consider server-side or client-side fixes
