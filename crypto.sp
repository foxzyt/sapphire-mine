JsonObject last_result = nil;
string last_error = nil;

function get_prices(string[] coin_ids, string currency) void {
    last_result = nil;
    last_error = nil;

    string ids_param = "";
    int i = 0;
    while (i < len(coin_ids)) {
        ids_param = ids_param + coin_ids[i];
        if (i < len(coin_ids) - 1) {
            ids_param = ids_param + ",";
        }
        i = i + 1;
    }
    
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
