// ---------------------------------
// Plugin: profile
// Versão: 1.3 
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
        print("ERRO: Usuario ou dados invalidos.");
        return;
    }

    print("Perfil encontrado!");
    print("");
    
    // Usando valueToString em TODOS os campos para segurança e robustez
    print("Nome: " + valueToString(data.name));
    print("Login: @" + valueToString(data.login));
    print("ID: " + valueToString(data.id));
    print("Localizacao: " + valueToString(data.location));
    print("Bio: " + valueToString(data.bio));
    print("");
    print("Repositorios Publicos: " + valueToString(data.public_repos));
    print("Seguidores: " + valueToString(data.followers));
    print("---------------------------------");
}

runProfileViewer();
