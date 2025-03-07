import ballerinax/trigger.github;
import ballerina/io;


listener github:Listener webhookListener = new (listenOn= 8090);

function printMessage(string message) returns error? {
    io:println(message);
    return;
}
service  github:PullRequestService on webhookListener {
    remote function onAssigned(github:PullRequestEvent payload) returns error? {
        return ;
    }

    remote function onClosed(github:PullRequestEvent payload) returns error? {
        return;
    } 

    remote function onLabeled(github:PullRequestEvent payload) returns error? {
        return;
    }

    remote function onOpened(github:PullRequestEvent payload) returns error? {
        _=check printMessage("Pull Request Opened");
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
