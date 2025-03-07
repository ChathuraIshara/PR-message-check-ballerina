import ballerina/io;
import ballerinax/trigger.github;
import ballerinax/twilio;

listener github:Listener webhookListener = new (listenOn = 8090);

configurable string accountSid = "test";
configurable string authToken = "test";

twilio:ConnectionConfig twilioConfig = {
    auth: {
        accountSid,
        authToken
    }
};

twilio:Client twilio = check new (twilioConfig);

function printMessage(string message) returns error? {
    io:println(message);
    return;
}

service github:PullRequestService on webhookListener {
    remote function onAssigned(github:PullRequestEvent payload) returns error? {
        return;
    }

    remote function onClosed(github:PullRequestEvent payload) returns error? {
        return;
    }

    remote function onLabeled(github:PullRequestEvent payload) returns error? {
        return;
    }

    remote function onOpened(github:PullRequestEvent payload) returns error? {
        // Use safe handling of optional field with null check
        string senderName = payload.sender.name is string ? payload.sender.name ?: "" : "unknown";
        string message = string `PR opened: ${payload.pull_request.title} by ${senderName}`;

        _ = check printMessage(string `PR opened: ${payload.pull_request.title} by ${senderName}`);
        twilio:CreateMessageRequest messageRequest = {
            To: "+94774733245", // Phone number that you want to send the message to
            From: "+12184439410", // Twilio phone number
            Body: message
        };

        twilio:Message response = check twilio->createMessage(messageRequest);

        // Print the status of the message from the response
        io:println("Message Status: ", response?.status);
        return;
    }

    remote function onReopened(github:PullRequestEvent payload) returns error? {
        return;
    }

    remote function onUnassigned(github:PullRequestEvent payload) returns error? {
        return;
    }

    remote function onEdited(github:PullRequestEvent payload) returns error? {
        return;
    }

    remote function onReviewRequestRemoved(github:PullRequestEvent payload) returns error? {
        return;
    }

    remote function onReviewRequested(github:PullRequestEvent payload) returns error? {
        return;
    }

    remote function onUnlabeled(github:PullRequestEvent payload) returns error? {
        return;
    }

}
