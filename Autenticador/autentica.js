const jwt = require('jsonwebtoken')

module.exports = (req, res, next) =>{

    try{
        const token = req.headers.authorization.split(' ')[1]
        const decodificador = jwt.verify(token, "RCD")
        req.dados = decodificador
        next()
    } catch (e) {
        console.log(e)
        res.json({"Mensagem": "Token Invalido"})
    }


}