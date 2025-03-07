# Ballerina SMS Notification on PR Opened

This project demonstrates the usage of a Ballerina program that sends an SMS notification to a mobile phone number when a pull request (PR) is opened in a specific GitHub repository. The SMS notification is sent using the Twilio connector, and the GitHub webhook is triggered using the `github/trigger` module.

## Features

- **GitHub Webhook Integration**: Listens for the `pull_request` event from a specified GitHub repository using the `github/trigger` module.
- **SMS Notification**: Sends an SMS to a predefined phone number using the Twilio connector when a PR is opened.

## Workflow

1. **GitHub Webhook**: The webhook listens for the `pull_request` event from a specific repository on GitHub.
2. **Ballerina Program**: Once a PR is opened, the program processes the webhook payload and sends an SMS notification to the specified phone number via the Twilio API.
3. **Twilio SMS Service**: The program uses the Twilio connector to send SMS messages with details about the PR.

## Setup

### Prerequisites

1. **Ballerina**: Ensure Ballerina is installed on your system. You can download it from [Ballerina's official site](https://ballerina.io/download/).
2. **Twilio Account**: Set up a Twilio account and get your API credentials (Account SID, Auth Token, and Twilio phone number).

### Steps to Run the Program

1. Clone this repository to your local machine.

   ```bash
   git clone `repository link`
   cd PR-message-check-ballerina
   ```

2. Open the Ballerina program file (`main.bal`) and update the Twilio connector configuration with your Twilio account details (Account SID, Auth Token, and phone numbers).
   
3. Run the Ballerina program:

   ```bash
   bal run
   ```

4. Set up the GitHub webhook to trigger on the `pull_request` event for the repository you want to monitor.

   - Go to the repository’s **Settings** > **Webhooks** > **Add webhook**.
   - Set the **Payload URL** to your Ballerina program’s endpoint.
   - Set the content type to `application/json`.
   - Select **Pull request events** as the trigger.

## Example

Once a PR is opened on the configured GitHub repository, an SMS will be sent to the predefined phone number with the following message:

```
A new PR opened: [PR Title] by [Sender Name]
```

## Contributing

Feel free to open issues or submit pull requests if you have any improvements or suggestions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


