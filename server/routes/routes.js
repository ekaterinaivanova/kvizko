/**
 * Created by EkaterinaAcc on 07-Nov-15.
 */
//var chgpass = require('config/chgpass');
var register = require('./config/register.js');
var login = require('./config/login.js');
var quiz = require('./config/quiz.js');
var questions = require('./config/questions.js');

var settings = require('../settings.js');

module.exports = function(app) {


    app.get('/', function (req, res) {

        res.end("Kvizko");
    });


    app.post('/student/login/:email/:pwd', function (req, res) {
        var email = req.params.email;
        var password = req.params.pwd;
        login.login(email, password,settings.tables_names.student, function (found) {
            res.json(found);
        });
    });

    app.post('/teacher/login/:email/:pwd', function (req, res) {
        var email = req.params.email;
        var password = req.params.pwd;
        login.login(email, password,settings.tables_names.teacher, function (found) {
            res.json(found);
        });
    });


    app.post('/student/register/:email/:pwd/:name/:lastname', function (req, res) {
        var email = req.params.email;
        var password = req.params.pwd;
        var name = req.params.name;
        var lastname = req.params.lastname;
        register.register(email, password, name, lastname, settings.tables_names.student, function (found) {
            console.log(found);
            res.json(found);
        });
    });



    app.post('/teacher/register/:email/:pwd/:name/:lastname', function (req, res) {
        var email = req.params.email;
        var password = req.params.pwd;
        var name = req.params.name;
        var lastname = req.params.lastname;
        register.register(email, password, name, lastname, settings.tables_names.teacher, function (found) {
            //console.log(found);
            res.json(found);
        });
    });

    app.post("/quiz/add/:teacherId/:quizName", function(req, res){
       //add quiz
        var qName = req.params.quizName;
        var teacherId = req.params.teacherId;
        quiz.addQuiz(teacherId, qName, function(result, error){
            if(error){
                res.json({status:false});
            }else{
                res.json(result);
            }
        });
    });
    app.get("/questions/all", function(req, res){
        //add quiz

        questions.getAllQuestions(function(result, error){
            if(error){
                res.json({status:false});
            }else{
                res.json(result);
            }
        });
    });
    app.post("/questions/a/:teacherId/:quizId/:quest/:answer", function(req, res){
        var quest = req.params.quest;
        var answer = req.params.answer;
        var quizId = req.params.quizId;
        var teacherId = req.params.teacherId;
        //var a =  req.params.a;
        //var b =  req.params.b;
        //var c =  req.params.c;
        //var d =  req.params.d;

        questions.addQuestion(quizId,quest,answer,null,null,null,null, function(result, error){
            if(error){
                res.json({status:false});
            }else{
                res.json(result);
            }
        });
    });
    app.post("/questions/b/:teacherId/:quizId/:quest/:a/:b/:c/:d/:answer", function(req, res){
        //add question  type b
    });



};