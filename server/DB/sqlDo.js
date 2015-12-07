var settings = require("../settings.js");
var sql = require("./sqlDB.js");


//Check if user/company with email exists
//if exists return pwd and id_user
//else return null
var returnIfExists = function(email, where, callback){
    var query = 'SELECT  * from ' + where + '  where email Like ?';
    var insert = [email];
    console.log(query);
    sql.exacuteQueryWithArgs(query, insert, function(result, error){
        if(error){
            console.log(error)
        }else{
        console.log("Were found " + result.length +" rows.");
        if(result.length < 1){
            return callback(null);
        }else{

            return callback(result);
        }
        }
    });
};
var registerNew = function(email, password, name,lastname, where, callback){
    returnIfExists(email, where, function(res, err){
        if(err){
            //console.log("Error appeared " + err);
            callback({status:"NOK"});
        }else{
            if(res == null){
                //register a new user
                var query = "INSERT INTO "+ where +" (email, pwd, name,lastname) VALUES (?, ?,?,?);";
                var insert = [email, password,name,lastname];
                sql.exacuteQueryWithArgs(query, insert, function(result,error){
                    if(error){
                        //console.log(error + "****");
                        return callback({status:"NOK"});
                    }else{
                        //console.log(result.insertId);
                        return callback({status:"AOK"});
                    }
                });
            }else{
                return(callback("UAE"));
            }
        }
    })
};

var  addQuiz = function(id, name, callback){
    var query = "INSERT INTO "+ settings.tables_names.quiz +" (teacher_id, name) VALUES (?, ?);";
    var args = [id,name];

    sql.exacuteQueryWithArgs(query,args,function(res,err){
        if(err){
            callback({result:false})
        }else{
            var in_id = res.insertId;
            callback({result:true,insertId:in_id});
        }
    });
};

var addQuestion = function(q_id,question, answer,a,b,c,d, callback){
    var query ="INSERT INTO " + settings.tables_names.questions + " (quiz_id, question, answer,a,b,c,d) VALUES(?,?,?,?,?,?,?);" ;
    var insert = [q_id,question,answer,a,b,c,d];
    sql.exacuteQueryWithArgs(query,insert, function(res,err){
        if(err){
            callback({status:false});
        }else{
            callback({status:true,insertId:res.insertId});
        }
    });
};

var getAllQuestions = function(callback){
    var query = 'SELECT  * FROM ' + settings.tables_names.questions + ';';
    console.log(query);
    sql.exacuteQuery(query, function(res, err){
        if(err){
            callback({status:false});
        }else{
            callback({status:true, questions:res});
        }
    })
};
module.exports.getAllQuestions = getAllQuestions;
module.exports.addQuestion = addQuestion;
module.exports.addQuiz = addQuiz;
module.exports.registerNew=registerNew;
module.exports.returnIfExists = returnIfExists;
