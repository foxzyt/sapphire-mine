function fetch_user(string username) var {
    if (username == nil or username == "") {
        return nil; 
    }

    string url = "https://api.github.com/users/" + username;

    string jsonResponse = HTTP.get(url);
    if (jsonResponse == nil) {
        return nil;
    }

    var data = JSON.parse(jsonResponse);
    if (data == nil or data.message == "Not Found") {
        return nil;
    }

    return data;
}
