function validateForm() {
    let idValue = document.querySelector("#id").value;
    let pwValue = document.querySelector("#password").value;
    let errorLogin = document.querySelector("#errorLogin");
    errorLogin.innerHTML = "";
        if(idValue == "") {
        errorLogin.innerHTML ="ID를 입력해주세요.";
        errorLogin.style.color ="red";
        return false;
    }
    errorLogin.innerHTML = "";
    if(pwValue == "") {
        errorLogin.innerHTML = "비밀번호를 입력해주세요.";
        errorLogin.style.color = "red";
        return false;
    }
    errorLogin.innerHTML = "";
    return true;
}