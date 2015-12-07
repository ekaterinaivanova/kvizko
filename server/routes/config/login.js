/**
 * Created by EkaterinaAcc on 07-Nov-15.
 */
var crypto = require('crypto');
//var rand = require('csprng');
var sql = require('../../DB/sqlDo.js');
var settings = require("../../settings.js");

exports.login = function(email,password, who, callback) {
    sql.returnIfExists(email, settings.tables_names.student, function(result, error){
        if(error){
            console.log(error);
            callback({'response':settings.messages.error,"result":false});
        }
        if (result == null){
            callback({'response':settings.messages.login_failed_user_does_not_exist,"result":false});
        }else {
            var user_id = result[0].id;
            var name = result[0].name;
            var lastname = result[0].lastname;
            var points = result[0].points;
            var hashed_password = result[0].pwd;
            var recieved_password = crypto.createHash('sha512').update(password).digest("hex");
            if (hashed_password == recieved_password) {
                callback({
                           'response': settings.messages.login_success,
                           "result": true,
                           "id": user_id,
                           'name': name,
                           'lastname': lastname,
                           'points': points
                });
            } else {
                callback({'response': settings.messages.login_failed_wrong_pwd, "result": false});
            }
        }
    });
};