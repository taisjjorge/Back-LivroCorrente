const jwt = require('jsonwebtoken')

module.exports = (req, res, next) =>{

    try{
        const token = req.headers.Authorization.split(' ')[1]
        const decodificador = jwt.verify(token, "RCD")
        req.dados = decodificador
        next()
    } catch {
        res.json({"Mensagem": "Token Invalido"})
    }


}