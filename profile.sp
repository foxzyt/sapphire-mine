// ---------------------------------
// Plugin: profile
// Descrição: Busca e exibe informações de um perfil do GitHub usando as APIs nativas.
// Autor: Bernardo Alvim
// Versão: 1.2 (final, com correção para todos os valores)
// ---------------------------------

function runProfileViewer() void {
    string username = "torvalds"; 

    print("---------------------------------");
    print(" Sapphire Profile Viewer v1.0");
    print("---------------------------------");
    print("Buscando perfil de '" + username + "'...");

    string url = "https://api.github.com/users/" + username;
    
    string jsonResponse = HTTP.get(url);

    if (jsonResponse == nil) {
        print("ERRO: Falha ao contatar a API do GitHub.");
        return;
    }

    var data = JSON.parse(jsonResponse);

    if (data == nil or data.message == "Not Found") {
        print("ERRO: Usuario '" + username + "' nao encontrado.");
        return;
    }

    print("Perfil encontrado!");
    print("");
    
    // --- CORREÇÃO APLICADA EM TODAS AS LINHAS ---
    print("Nome: " + valueToString(data.name));
    print("Login: @" + valueToString(data.login));
    print("ID: " + valueToString(data.id));
    print("Localizacao: " + valueToString(data.location));
    print("Bio: " + valueToString(data.bio)); // A correção principal
    
    print("");
    print("Repositorios Publicos: " + valueToString(data.public_repos));
    print("Seguidores: " + valueToString(data.followers));
    print("---------------------------------");
}

runProfileViewer();
