/**
 * Created by EkaterinaAcc on 20-Nov-15.
 */
var sql = require('../../DB/sqlDo.js');
var crypto = require('crypto');
//var rand = require('csprng');
var settings = require("../../settings.js");

exports.getAllQuestions = function(callback){
    sql.getAllQuestions(function(res, err){
        if(!err)
            callback(res);
    });
};



exports.addQuestion = function(quizId, question, answer,a,b,c,d, callback){
    sql.addQuestion(quizId, question, answer,a,b,c,d, function(res, err){
        if(err){
            callback({status:false});
        }else{
            callback(res);
        }
    });
};

