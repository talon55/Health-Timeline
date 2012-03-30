# Health Timeline Project

### What it is
To keep our Rails skills sharp, we recently began building MedLog.  In its completed form, we envision it allowing users to conveniently catalog their medical symptoms as audio clips, images, videos, and concise text descriptions.  Rather than having to rely on fuzzy memories about when symptoms first appeared or how they progressed over time, users could use MedLog to explain to their physicians precisely what occurred and when (and even under what circumstances).  A cough can be documented through audio samples, an injured ankle through pictures, an infant’s behavior through videos, etc.  Since we think the idea would work best as a smartphone app, we’re also both using the project as motivation to learn Android (Eric) and iOS (Akshay) development.


### Known Issues:

####Response#chunked = true
not a problem:
http://stackoverflow.com/questions/7082364/what-does-warn-could-not-determine-content-length-of-response-body-mean-and-h

####Sorting episodes on the index doesn't list user-owned episodes first
Database-side fixes to this will probably involve a second query which will
introduce extra overhead. Consider server-side or client-side fixes
