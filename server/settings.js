/**
 * Created by EkaterinaAcc on 07-Nov-15.
 */
exports.sqlSettings = {

    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'kvizko'

};
exports.port = 8080;
exports.tables_names = {
    teacher : 'teacher',
    student: 'student',
    quiz: 'quiz',
    questions:"questions",
    student_questions:"student_questions"
};
exports.messages = {
    login_failed_user_does_not_exist : "Login failed. Email does not exists",
    login_success: "Login Sucess",
    login_failed_wrong_pwd: "Login Failed, wrong password",
    login_failed_internal_error: "Login Failed, intearnal error!",
    reg_success:"Registration Sucess",
    reg_failed: "Registration failed",
    reg_failed_wrong_email_format: "Registration Failed, wrong email format",

    question_add_success: "question was added successfully!",
    question_already_exists: "question Already exists!",
    user_already_exists: "User Already exists!",

    question_update_success: "Question was updated successfully!",
    question_update_failed:"Question update wasn't  successful!",
    question_update_access_failed:"Question update wasn't  successful! You are not allowed to update the  it",
    error: "An error has occurred!",
    update_quiz_failed: "We couldn't update the quiz. It doesn't exists or you don't have access to it!"
};