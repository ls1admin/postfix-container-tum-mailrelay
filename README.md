# postfix-container-tum-mailrelay
Postfix container preconfigured to use the TUM RBG Mail relays 


## Configuration 

- Adapt the `.env` file to reflect your hostname
- Adapt `config/main.cf` to resemble your intended configuration 


## Testing
To test the setup, you can use the provided `test.py` script in the `test-container` directory. This script sends a test email through the Postfix container. Please use the env variables `SENDER` and `RECEIVER` to configure the sender and receiver email addresses.

Make sure the Postfix container is running, then execute the test script:

```bash
docker compose --profile test up --build
```

To run Postfix **without** the test container, you can use the following command:

```bash
docker compose up --build
```

Check the logs of the Postfix container to verify that the email was sent successfully.

## Keeping the image up to date

The image is published as `ghcr.io/ls1admin/postfix`. The workflow `Build and Push` rebuilds `latest` from the `main` branch every Monday and can be started manually (Actions, `Build and Push`, `Run workflow`), so security updates of the base image reach the image without a code change. Consumers that pin the image by digest need to update the digest to pick up a new build.
