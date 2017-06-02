#!/usr/bin/env perl -w
 use strict;
 use warnings;
 use MIME::Base64;
 
 # http://search.cpan.org/~mcrawfor/REST-Client/lib/REST/Client.pm
 # Example install using cpanm:
 #   sudo cpanm -i REST::Client
 use REST::Client;
 
 # Set the request parameters
 my $host = 'https://dev26773.service-now.com/';
 my $user = 'admin';
 my $pwd = 'Now@123##';
 my $sys_id = 'd71f7935c0a8016700802b64c67c11c6';
 
 my $client = REST::Client->new(host => $host);
 
 my $encoded_auth = encode_base64("$user:$pwd", '');
 
 # Get the incident with sys_id declared above
 $client->GET("/api/now/table/incident/$sys_id",
              {'Authorization' => "Basic $encoded_auth",
               'Accept' => 'application/json'});
 
 print 'Response: ' . $client->responseContent() . "\n";
 print 'Response status: ' . $client->responseCode() . "\n";
 foreach ( $client->responseHeaders() ) {
   print 'Header: ' . $_ . '=' . $client->responseHeader($_) . "\n";
 }