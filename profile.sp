// ---------------------------------
// Plugin: profile
// Descrição: Busca e exibe informações de um perfil do GitHub usando as APIs nativas.
// Autor: [Seu Nome]
// Versão: 1.1 (com correção para valores nulos)
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
    print("Nome: " + valueToString(data.name));
    print("Login: @" + valueToString(data.login));
    print("ID: " + valueToString(data.id));
    print("Localizacao: " + valueToString(data.location));
    
    // --- CORREÇÃO AQUI ---
    // Usamos valueToString para converter 'nil' na string "nil" de forma segura.
    print("Bio: " + valueToString(data.bio));
    
    print("");
    print("Repositorios Publicos: " + valueToString(data.public_repos));
    print("Seguidores: " + valueToString(data.followers));
    print("---------------------------------");
}

runProfileViewer();
