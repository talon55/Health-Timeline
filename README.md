# Health Timeline Project

### What it is
  Originally Planned as a health-related project for a design class,
this site is also our first real foray into rails development from
start to finish


### Known Bugs:

####Response#chunked = true
not a problem:
http://stackoverflow.com/questions/7082364/what-does-warn-could-not-determine-content-length-of-response-body-mean-and-h

####Sorting episodes on the index doesn't list user-owned episodes first
Database-side fixes to this will probably involve a second query which will
introduce extra overhead. Consider server-side or client-side fixes
