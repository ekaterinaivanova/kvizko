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



exports.getRandomQuestion = function(callback){
    sql.getOneQuestions(function(res, err){
        if(!err){
            callback(res);
        }
    })
};

exports.addQuestion = function(quizId, question, answer,a,b,c,d,hint, callback){
    sql.ifQuizExists(quizId, function(result, err){
        if(result.status){
            sql.addQuestion(quizId, question, answer,a,b,c,d,hint, function(res, err){
                if(err){
                    callback({status:false});
                }else{
                    callback(res);
                }
            });
        }else{
            callback({status:false,
                response:"Wrong quiz id!"})

        }
    });
};

