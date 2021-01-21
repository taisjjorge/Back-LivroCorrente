const express = require('express')                  // Genrenciador de rotas
const cors = require('cors')                        // Cors é uma extensão que libera acesso dos dados em outra pagina
const mysql = require('mysql')


const app = express()
const PORT = process.env.PORT || 3000;

app.use(express.json())
app.use(cors())     
                                // Usa o cors é permite o acesso dos dados
const conexao = mysql.createConnection({        // Cria a conexão com o MYSQL  
    host:'bezr3by2ublvbfahsffb-mysql.services.clever-cloud.com',                           // "localhost" = ip da maquina atual
    user:'uusq0dhdo8blstjy',                                // "root" = usuario do banco de dados
    password:'ebW3XZLGrLry84S9N0ZI',
    database:'bezr3by2ublvbfahsffb'                   // "livro_corrente" = banco de dados
})

app.get('/cards', function(req, res) {
    conexao.query(`select * from pedidos inner join bibliotecas on id_biblioteca_fk=id_biblioteca WHERE valido_pedido = 1`, function (error,results)  {        
        res.json(results)
    })
})

app.post('/inativos', function(req, res) {
    let id = req.body.id
    conexao.query(`select * from pedidos inner join bibliotecas on id_biblioteca_fk=id_biblioteca WHERE id_biblioteca_fk = "${id}" and valido_pedido = 1`, function (error, results) {
        res.json(results)
    })
})

app.get('/bibliotecas', function(req, res) {
    conexao.query("Select * from rede_biblioteca inner join bibliotecas on id_biblioteca_fk = id_biblioteca inner join redes on id_rede_fk = id_rede", function (error, results) {
        res.json(results)
    })
})

app.post('/formulario', function(req, res) {
    let id= req.body.id
    conexao.query(`Select * from rede_biblioteca inner join bibliotecas on id_biblioteca_fk = id_biblioteca inner join redes on id_rede_fk = id_rede where id_rede = "${id}"`, function (error, results) {
        res.json(results)
    })
})

app.post('/cadastro/funcionario', function(req, res) {
    let dados= req.body.dados
    conexao.query(`insert into funcionarios(usuario_funcionario, senha_funcionario, nome_funcionario, telefone_funcionario, email_funcionario, cpf_funcionario, atividade_funcionario, id_biblioteca_fk) value ("${dados.user}","${dados.senha}","${dados.nome}","${dados.celular}","${dados.email}","${dados.cpf}","${dados.vinculo}","${dados.biblio}")`, function(error,resuts){
        if (error== null){
            conexao.query(`insert into pedidos(numeroExemplar_pedido, titulo_pedido, genero_pedido, id_biblioteca_fk) value ("${dados.qtde}","${dados.titulo}","${dados.genero}","${dados.biblio}")`, function(error, results){
                if (error == null) {
                    res.json({"resp":"Foi"})
                } else {
                    res.json({"resp":"Erro no cadastro do pedido"})
                }
            })
        } else {
            res.json({"resp":"Erro no cadastro funcionario"})
        }
    })
})
app.post('/remover/card', function (req, res) {
    let titulo = req.body.titulo
    console.log(titulo)
    conexao.query(`UPDATE pedidos SET valido_pedido = 0 where titulo_pedido = "${titulo}"`, function(error,results){
        if (error == null) {
            res.json({"resp":"Foi"})
        } else { 
            res.json({"resp":"Não atualizou"})
        }
    })
})


app.listen(PORT, () => console.log(`Rodando na porta ${PORT}`));