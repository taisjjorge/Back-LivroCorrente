const express = require('express')                  // Genrenciador de rotas
const cors = require('cors')                        // Cors é uma extensão que libera acesso dos dados em outra pagina
const mysql = require('mysql')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const autentica = require('./Autenticador/autentica')

const app = express()
const PORT = process.env.PORT || 3001;

app.use(express.json())
app.use(cors())     // Usa o cors é permite o acesso dos dados

const conexao = mysql.createConnection({                         // Cria a conexão com o MYSQL  
    host:'localhost', // "localhost" = ip da maquina atual
    user:'root',                                     // "root" = usuario do banco de dados
    password:'',
    database:'livro_corrente'                              // "livro_corrente" = banco de dados
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

app.post('/livros', autentica, function(req, res) {
    conexao.query(`select * from pedidos inner join bibliotecas on id_biblioteca_fk=id_biblioteca WHERE id_biblioteca_fk = "${req.dados.usuario.id_biblioteca_fk}"`, function (error, results) {
        res.json(results)
    })
})

app.post('/funcionarios', autentica, function(req, res) {
    conexao.query(`SELECT * FROM funcionarios where id_biblioteca_fk = "${req.dados.usuario.id_biblioteca_fk}"`, function(error, results){
        if(error == null){
            res.json(results)
        }
    })
})
app.post('/alterar/funcionario', autentica, function(req, res) {
    const { id, estado } = req.body
    conexao.query(`UPDATE funcionarios SET valido_funcionario = "${estado}" where id_funcionario = "${id}"`, function(error, results){
        if(error == null){
            res.json({"Mensagem":"Atualizou"})
        }
    })
})


app.post('/adiciona/livros', autentica, function(req,res) {
    const { numeroExemplar, titulo, genero, autor } = req.body
    const { id_funcionario, id_biblioteca_fk } = req.dados.usuario
    conexao.query(`insert into pedidos(numeroExemplar_pedido, titulo_pedido, genero_pedido, autor_pedido, valido_pedido, id_biblioteca_fk, id_funcionario_fk) values ("${numeroExemplar}", "${titulo}", "${genero}", "${autor}", FALSE, ${id_biblioteca_fk}, ${id_funcionario})`, (error, results) => {
        if(error == null){
            res.json({"Mensagem": "Livro cadastrado"})
        }
    })
})

app.get('/bibliotecas', function(req, res) {
    conexao.query("Select * from rede_biblioteca inner join bibliotecas on id_biblioteca_fk = id_biblioteca inner join redes on id_rede_fk = id_rede", function (error, results) {
        res.json(results)
    })
})
app.post('/biblioteca', function(req, res) {
    let id= req.body.id
    conexao.query(`Select * from rede_biblioteca inner join bibliotecas on id_biblioteca_fk = id_biblioteca inner join redes on id_rede_fk = id_rede where id_biblioteca = "${id}"`, function (error, results) {
        res.json(results)
    })
})

app.post('/formulario', function(req, res) {
    let id= req.body.id
    conexao.query(`Select * from rede_biblioteca inner join bibliotecas on id_biblioteca_fk = id_biblioteca inner join redes on id_rede_fk = id_rede where id_rede = "${id}"`, function (error, results) {
        res.json(results)
    })
})


app.post('/cadastro/funcionario', async function(req, res){
    let { user, senha, nome, celular, email, cpf, vinculo, biblio, titulo, genero, qtde, solicitacao } = req.body.dados

    const hash = await bcrypt.hash(senha, 10)
    senha = hash

    if(solicitacao){
        conexao.query(`Insert into pedidos(numeroExemplar_pedido, titulo_pedido, genero_pedido, id_biblioteca_fk) value("${qtde}","${titulo}","${genero}","${biblio}")`)
    }
    conexao.query(`Select * from funcionarios where email_funcionario = "${email}"`, (error, results) => {
        if (results[0] == null){
            conexao.query(`insert into funcionarios(usuario_funcionario, senha_funcionario, nome_funcionario, telefone_funcionario, email_funcionario, cpf_funcionario, atividade_funcionario, id_biblioteca_fk) value ("${user}","${senha}","${nome}","${celular}","${email}","${cpf}","${vinculo}","${biblio}")`, (error,resuts) => {
                if(error == null){
                    res.json({"Mensagem": "Seu cadastro está em analise"})
                }
            })
        } else {
            res.json({"Mensagem": "Email já cadastrado"})
        }
    })
})

app.post('/login/funcionario', function(req,res){
    const { email, senha } = req.body.dados

    conexao.query(`Select * from funcionarios where email_funcionario = "${email}"`, async (error, results) => {
        if (results[0] != null){
            if (await bcrypt.compare(senha, results[0].senha_funcionario)){
                if (results[0].valido_funcionario == "Em Analise"){
                    res.json({"Mensagem":"Em Analise"})

                } else if (results[0].valido_funcionario == "Recusado"){
                    res.json({"Mensagem":"Recusado"})

                } else if (results[0].valido_funcionario == "Aceito"){
                    delete results[0].senha_funcionario
                    delete results[0].telefone_funcionario
                    delete results[0].cpf_funcionario
                    const token = jwt.sign({'usuario':results[0]},"RCD", {
                        expiresIn: 20000
                    })
                        res.json({"Mensagem": "Aceito", "token": token})
                }
            } else {
                res.json({"Mensagem": "Senha incorreta"})
            }
        } else {
            res.json({"Mensagem": "Email incorreto"})
        }

    })
})


app.post('/remover/card', autentica, function (req, res) {
    let { id } = req.body
    var valido
    conexao.query(`Select * from pedidos where id_pedido = "${id}"`, (error,results) => {
        if(results[0].valido_pedido.lastIndexOf(1) >= 0){
            valido = 0
        } 
        if(results[0].valido_pedido.lastIndexOf(1) == -1){
            valido = 1
        }
        conexao.query(`UPDATE pedidos SET valido_pedido = ${valido} where id_pedido = "${id}"`, function(error,results){
            if (error == null) {
                res.json({"Mensagem":"Foi"})
            } else { 
                res.json({"Mensagem":"Não atualizou"})
            }
        })
    })
})

app.post('/atualizar/card', autentica, function (req, res) {
    const { numeroExemplar, titulo, id, genero } = req.body
    conexao.query(`UPDATE pedidos Set numeroExemplar_pedido = "${numeroExemplar}", titulo_pedido= "${titulo}", genero_pedido= "${genero}" where id_pedido="${id}"`, (error, results)=>{
        if (error == null) {
            res.json({"Mensagem":"Foi"})
        } else { 
            res.json({"Mensagem":"Não atualizou"})
        }
    })
})

app.post('/deletar', autentica, function (req, res) {
    const { id } = req.body
    conexao.query(`DELETE FROM pedidos where id_pedido = "${id}"`, function(error,results){
        if (error == null) {
            res.json({"Mensagem":"Deletou"})
        }
    })
})


app.listen(PORT, () => console.log(`Rodando na porta ${PORT}`));