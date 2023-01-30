# For assistance debugging failures

* The pact files have been stored locally in the following temp directory:
    /app/animal-service/tmp/pacts

* The requests and responses are logged in the following log file:
    /app/animal-service/log/pact.log

* Add BACKTRACE=true to the `rake pact:verify` command to see the full backtrace

* If the diff output is confusing, try using another diff formatter.
  The options are :unix, :embedded and :list

    Pact.configure do | config |
      config.diff_formatter = :embedded
    end

  See https://github.com/pact-foundation/pact-ruby/blob/master/documentation/configuration.md#diff_formatter for examples and more information.

* Check out https://github.com/pact-foundation/pact-ruby/wiki/Troubleshooting

* Ask a question on stackoverflow and tag it `pact-ruby`


The following changes have been made since the previous distinct version of this pact, and may be responsible for verification failure:

# Diff between versions f6bc146-1.0.2 and db3a20a-1.0.3 of the pact between Zoo App and Animal Service

The following changes were made about 1 hour ago (Mon 30 Jan 2023, 7:02pm +00:00)

 {
   "interactions": [
     {
-      "description": "a request for an alligator",
-      "providerState": "an error occurs retrieving an alligator",
+      "description": "a request for a seahawk",
+      "providerState": "there is a seahawk named Geno",
       "request": {
-        "path": "/alligators/Mary"
+        "path": "/seahawks/Geno"
       },
       "response": {
         "body": {
-          "error": "Argh!!!"
         },
-        "status": 500
+        "status": 200
       }
     },
     {
-      "description": "a request for an alligator",
-      "providerState": "there is an alligator named Mary",
+      "description": "a request for a seahawk",
+      "providerState": "there is not a seahawk named Mary",
       "request": {
-        "path": "/alligators/Mary"
+        "path": "/seahawks/Geno"
       },
       "response": {
-        "body": {
-          "name": "Mary"
-        },
         "headers": {
-          "Content-Type": "application/json;charset=utf-8"
         },
-        "status": 200
+        "status": 404
       }
     },
     {
-      "providerState": "there is not an alligator named Mary",
+      "providerState": "an error occurs retrieving an alligator",
       "response": {
-        "status": 404
+        "status": 500
       }
     },
     {
-      "description": "a request for an seahawk",
-      "providerState": "there is an seahawk named Geno",
+      "description": "a request for an alligator",
+      "providerState": "there is an alligator named Mary",
       "request": {
-        "path": "/seahawks/Geno"
+        "path": "/alligators/Mary"
       },
       "response": {
         "body": {
-          "name": "Geno"
+          "name": "Mary"
         }
       }
     },
     {
-      "description": "a request for an seahawk",
-      "providerState": "there is not an seahawk named Mary",
+      "description": "a request for an alligator",
+      "providerState": "there is not an alligator named Mary",
       "request": {
-        "path": "/seahawks/Geno"
+        "path": "/alligators/Mary"
       }
     }
   ]

## Links

pact-version:
  title: Pact
  name: Pact between Zoo App (db3a20a-1.0.3) and Animal Service
  href: http://pact-ruby-demo-pact-broker-1:9292/pacts/provider/Animal%20Service/consumer/Zoo%20App/version/db3a20a-1.0.3
comparison-pact-version:
  title: Pact
  name: Pact between Zoo App (f6bc146-1.0.2) and Animal Service
  href: http://pact-ruby-demo-pact-broker-1:9292/pacts/provider/Animal%20Service/consumer/Zoo%20App/version/f6bc146-1.0.2
