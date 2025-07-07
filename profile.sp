// ---------------------------------
// Plugin: profile
// Descrição: Busca e exibe informações de um perfil do GitHub usando as APIs nativas.
// Autor: Bernardo Alvim
// Versão: 1.0
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
        print("Verifique sua conexao com a internet ou se a URL esta correta.");
        return;
    }

    var data = JSON.parse(jsonResponse);

    if (data == nil) {
        print("ERRO: Nao foi possivel entender a resposta da API.");
        return;
    }

    if (data.message == "Not Found") {
        print("ERRO: Usuario '" + username + "' nao foi encontrado.");
        return;
    }

    print("Perfil encontrado!");
    print("");
    print("Nome: " + data.name);
    print("Login: @" + data.login);
    print("ID: " + valueToString(data.id)); 
    print("Localizacao: " + data.location);
    print("Bio: " + data.bio);
    print("");
    print("Repositorios Publicos: " + valueToString(data.public_repos));
    print("Seguidores: " + valueToString(data.followers));
    print("---------------------------------");
}

runProfileViewer();
