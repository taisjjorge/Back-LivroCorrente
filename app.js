const express = require('express')                  // Genrenciador de rotas
const cors = require('cors')                        // Cors é uma extensão que libera acesso dos dados em outra pagina
const mysql = require('mysql')


const app = express()
app.use(express.json())
app.use(cors())                                     // Usa o cors é permite o acesso dos dados
const conexao = mysql.createConnection({        // Cria a conexão com o MYSQL  
    host:'localhost',                           // "localhost" = ip da maquina atual
    user:'root',                                // "root" = usuario do banco de dados
    password:'',
    database:'livro_corrente'                   // "livro_corrente" = banco de dados
})

app.get('/cards', function (req, res) {
    conexao.query("Select * from cards WHERE valido_pedido = 1", function (error,results)  {        
        res.json(results)
    })
})

app.post('/inativos', function (req, res ) {
    let id = req.body.id
    conexao.query(`Select * from cards WHERE id_biblioteca_fk = ${id}`, function (error, results) {
        res.json(results)
    })
})

app.get('/bibliotecas', function(req, res) {
    conexao.query("Select * from infoRB", function (error, results) {
        res.json(results)
    })
})

const porta = 3001
app.listen(porta, function (){
    console.log(`Rodando na porta: ${porta}...`)
})