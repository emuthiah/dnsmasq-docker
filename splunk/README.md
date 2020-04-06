Send logs to Splunk
```
docker run --rm \
  --cap-add NET_ADMIN \
  --log-driver splunk \
  --log-opt splunk-token=<hce-token> \
  --log-opt splunk-insecureskipverify=true \
  --log-opt splunk-url=https://localhost:8088 \
  --dns 127.0.0.1 \
  --name dnsmasq \
  dnsmasq:latest
```
Start splunk and install add-ons/apps from splunkbase
```
docker run --rm \
  -p 8088:8088 \
  -p 8000:8000 \
  -e "SPLUNK_START_ARGS=--accept-license" \
  -e "SPLUNK_PASSWORD=<splunk admin password>" \
  -e "SPLUNK_APPS_URL=https://splunkbase.splunk.com/app/3212/release/1.11/download" \
  -e "SPLUNKBASE_USERNAME=<splunk base username>" \
  -e "SPLUNKBASE_PASSWORD=<splunk base password>" \
  --name splunk \
  splunk/splunk:latest
```
Create splunk http event collector
```
/opt/splunk/bin/splunk http-event-collector create \
  -name docker_hce \
  -uri https://localhost:8089 \
  -auth admin:<splunk admin password>
```
output:
```
http://docker_hce
	token=c5762f3c-4131-40c4-97e3-c716d39b571b
	description=
	disabled=0
	index=default
	indexes=
	source=
	sourcetype=
	outputgroup=
	use-ack=
	allow-query-string-auth=
```
Use the output token to as `<hce-token>` for sending docer logs to splunk
