# Firebase Hosting CDN Caching

This project is a minnimum reproducible repo that aims to replicate a problem that we observed with 404's getting cached by the Firebase Hosting CDN when it was not explicitly instructed to.

## URL

Website: https://api-demo-94c7a.web.app
API: https://api-cdn-cache.web.app

## Testing

A testing script has been created to show that the responses are cached (specifically 404s) by checking the response headers.
Note that no `Cache Control` header is present in the response.

Our observations show that specifically GET 404 responses are the ones that get cached. To further support this investigation, we can purge the cache with the following request:

```
curl -X PURGE https://api-cdn-cache.web.app/date
```
