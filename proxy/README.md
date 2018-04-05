PROXY configuration example

## Getting started

Follow instruction to clone main repository and load docker containers:
    https://github.com/shotgunsoftware/shotgun-docker-example

## HAProxy configuration

haproxy.cfg is a main configuration file.

### Basic http Auth
Allows you to enable simple http auth in front of shotgun app.
1. Uncommens lines to enable authentication.

	userlist SiteUsers
    	    user test password $6$7075aba42953b669$J5tqLycE0txyWFHT8dUBsBxBASeqNs2mA1izPeOEXz.ccSDj9ty0hePmXDn5H8IKk8b0nvlZfALRUDdGcTvoB0

    Use test/password as username and password for testing.

2. Uncomment following lines to enable http Auth in required backend.

	acl auth_check http_auth(SiteUsers)
	http-request auth realm Access if !auth_check

### URL mapping
If you have 2 or more sites on same server and want use 80 default port to connect to them you need use `host mapping` feature.

mapping.map file contains pairs of `hostname` `backend`.

E.g.

    shotgun.mystudio.test production		- redirects you to production backend if url match http://shotgun.mystudio.test
    shotgun-staging.mystudio.test staging	- redirects you to staging backend if url match http://shotgun-staging.mystudio.test

Make sure that IP is set in backend in haproxy.cfg

E.g.
    
    server production 192.168.0.100:8080 check
where 192.168.0.100 is IP of the host and 8080 is a exposed port of shotgun app container.

