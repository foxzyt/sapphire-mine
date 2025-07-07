JsonObject last_result = nil;
string last_error = nil;

function get_prices(string ids_param, string currency) void {
    last_result = nil;
    last_error = nil;
    
    string url = "https://api.coingecko.com/api/v3/simple/price?ids=" + ids_param + "&vs_currencies=" + currency;

    string jsonResponse = HTTP.get(url);
    if (jsonResponse == nil) {
        last_error = "Falha ao acessar a API da CoinGecko.";
        return;
    }

    JsonObject data = JSON.parse(jsonResponse);
    if (data == nil) {
        last_error = "Nao foi possivel decodificar a resposta da API.";
        return;
    }

    last_result = data;
}
