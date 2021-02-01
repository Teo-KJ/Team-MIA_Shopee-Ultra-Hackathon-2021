import urllib3
import json

HACKATHON_API_ROOT = 'https://api.hackathon2021.shopee.sg'
HACKATHON_TOKEN = 'YSmUdKDR2UzWreoQtkb2'

http = urllib3.PoolManager()

r = http.request(
    'GET',
    HACKATHON_API_ROOT + '/item/search',
    fields = {
        'keyword': 'cat'
    },
    headers = {
        'X-Hackathon-Token': HACKATHON_TOKEN
    }
)

#print(r.data)
collectedData = r.data
dataDict = json.loads(collectedData.decode("utf-8"))
print(dataDict["data"]["items"])
items = dataDict["data"]["items"]
print()
count = 0
for item in items:
    print()
    count += 1
    print("#"+str(count))
    print(item)
