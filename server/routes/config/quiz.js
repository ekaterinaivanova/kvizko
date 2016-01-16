/**
 * Created by EkaterinaAcc on 20-Nov-15.
 */
var sql = require('../../DB/sqlDo.js');
var settings = require("../../settings.js");

exports.addQuiz = function(id, name,callback){
    sql.addQuiz(id, name, function(res, err){
        if(err){
            callback({status:false});
        }else{
            callback(res);
        }
    })
};
exports.getAllQuizzes = function(callback){
    sql.getAllQuizzes(function(res, err){
        if(err){
            callback({status:false});
        }else{
            callback(res);
        }
    })
};


