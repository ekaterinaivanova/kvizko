/**
 * Created by EkaterinaAcc on 07-Nov-15.
 */
var crypto = require('crypto');
//var rand = require('csprng');
var sql = require('../../DB/sqlDo.js');
var validator = require("email-validator");
var settings = require("../../settings.js");
exports.register = function(email, password,name,lastname, table, callback) {
    console.log(table + "++++");
        if (validator.validate(email) ){
            var hashed_password = crypto.createHash('sha512').update(password).digest("hex");
            sql.registerNew(email, hashed_password, name,lastname, table,  function(res, error) {
            if (error) {
                console.log(error);
                callback({result:false, response:settings.messages.error})
            } else {
                result = res.status;

                //if result AOK user has been registered
                //else if NOK user already have an account
                if (result == "AOK") {
                    return callback({'response': settings.messages.reg_success, "result": true});
                } else if(result == "UAE"){
                    return callback({'response': settings.messages.user_already_exists, "result": false});
                }else{
                    return callback({'response':  settings.messages.reg_failed, "result": false});
                 }
            }
        });
    }else{
            return callback({'response':  settings.messages.reg_failed_wrong_email_format, "result": false})
        }
};