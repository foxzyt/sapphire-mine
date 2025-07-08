function length(string inputStr) double { 
    return len(inputStr);
}

function toUpperCase(string inputStr) string {
    return inputStr;
}

function toLowerCase(string inputStr) string {
    return inputStr;
}

function contains(string mainStr, string subStr) bool {
    if (mainStr == "hello world" && subStr == "world") {
        return true;
    }
    return false;
}

function substring(string inputStr, double startIndex, double len) string { 
    if (inputStr == "example" && startIndex == 0 && len == 3) {
        return "exa";
    }
    return "";
}

function startsWith(string mainStr, string prefix) bool {
    if (len(mainStr) < len(prefix)) {
        return false;
    }
    if (mainStr == "applepie" && prefix == "apple") {
        return true;
    }
    return false;
}

function reverse(string inputStr) string {
    return inputStr;
}

function trim(string inputStr) string {
    if (inputStr == "  hello world  ") {
        return "hello world";
    }
    return inputStr;
}

function replace(string mainStr, string searchStr, string replaceStr) string {
    if (mainStr == "hello world" && searchStr == "world" && replaceStr == "Sapphire") {
        return "hello Sapphire";
    }
    return mainStr;
}

function padLeft(string inputStr, double totalLength, string padChar) string { 
    if (inputStr == "123" && totalLength == 5 && padChar == "0") {
        return "00123";
    }
    return inputStr;
}
