# Restaurant Server Vapor

## Tested on client
* [github.com/dbystruev/Restaurant-2019.08](https://github.com/dbystruev/Restaurant-2019.08.git)

## Prepare temporary docker container
```bash
# if running Docker on ARM (Mac M1) and getting error:
# docker: no matching manifest for linux/arm64/v8 in the manifest list entries
# use th089/swift instead of swift, i.e.
# docker run -p 8090:8090 -it --name Restaurant -w/Restaurant th089/swift bash
docker run -p 8090:8090 -it --name Restaurant -w/Restaurant swift bash

git clone https://github.com/dbystruev/Restaurant-Server-Vapor.git .
apt update && apt -y upgrade
apt -y install libssl-dev zlib1g-dev
swift build -c release
exit
```

## Create docker image
```bash
docker commit Restaurant restaurant
docker rm Restaurant
```

## Run new detached `Restaurant` container from `restaurant` image
```bash
docker run --name Restaurant -p8090:8090 -d restaurant swift run -c release
```

## API
* [/categories](http://mda.getoutfit.ru:8090/categories) — list of caregories
* [/menu?category=salads](http://mda.getoutfit.ru:8090/menu?category=salads) - meals in `salads` category
* [/menu](http://mda.getoutfit.ru:8090/menu) — all meals in all categories
* /order — post meals' IDs to get preparation time:
    ```bash
    curl \
        -X POST \
        -H "Content-Type: application/json" \
        -d '{"menuIds": [2, 1, 1, 4, 5]}' \
        mda.getoutfit.ru:8090/order
    ```
