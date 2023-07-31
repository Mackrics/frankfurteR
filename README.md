# frankfurteR

This package retrieve the exchange rate from the ECB via the
[frankfurter.app](https://frankfurter.app) api.

## Get latest exchange rate between DKK and SEK

```r
get_latest_exr("dkk", "sek")
```

## Get time-series between DKK and SEK
```r
get_latest_exr("dkk", "sek", "2020-01-01", "2022-01-01")
```
