JsonObject last_result = nil;

function fetch_user(string username) void {
    if (username == nil or username == "") {
        last_result = nil;
        return;
    }

    string url = "https://api.github.com/users/" + username;
    string jsonResponse = HTTP.get(url);

    if (jsonResponse == nil) {
        last_result = nil;
        return;
    }

    JsonObject data = JSON.parse(jsonResponse);
    if (data == nil or data.message == "Not Found") {
        last_result = nil;
        return;
    }

    last_result = data;
}
