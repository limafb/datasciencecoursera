library("httr")
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp = oauth_app("myApplication", key="b1cb4c2d9422dcdc67b3",secret="46f2923706005f32791cbaa643d7ee4fe6dc41af")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

#token319499f3e49695256186ab1c98f679779cc59a82 

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

dim(json2)

json2

sig = sign_oauth1.0(myapp, token="yourTokenHere", token_secret="yourTokenSecretHere")

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

names(json2)
names(json2$id)

head(json2)
