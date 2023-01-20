let isFin = false;
function validateForm(test) {
    if(test !=null) {
        isFin = test;
    }
    if(isFin) {
        return true;
    }
    let idValue = document.querySelector("#id").value;
    let pwValue = document.querySelector("#pw").value;
    let nameValue = document.querySelector("#name").value;
    let ageValue = document.querySelector("#age").value;
    let numberValue = document.querySelector("#number").value;
    let emailValue = document.querySelector("#email").value;
    
    if(nameValue == "") {
        let nameError = document.querySelector("#nameError");
        nameError.innerHTML="이름을 입력해주세요";
        nameError.style.color = "red";
        return false;
    }
    nameError.innerHTML="";

    if(ageValue == "") {
        let ageError = document.querySelector("#ageError");
        ageError.innerHTML="나이를 입력해주세요";
        ageError.style.color = "red";
        return false;
    }
    ageError.innerHTML="";
    if(numberValue == "") {
        let numberError = document.querySelector("#numberError");
        numberError.innerHTML="번호를 입력해주세요";
        numberError.style.color = "red";
        return false;
    }
    numberError.innerHTML="";
    if(emailValue == "") {
        let emailError = document.querySelector("#emailError");
        emailError.innerHTML="이메일을 입력해주세요";
        emailError.style.color = "red";
        return false;
    }
    emailError.innerHTML="";
    if(idValue == "") {
        let idError = document.querySelector("#idError");
        idError.innerHTML="아이디를 입력해주세요";
        idError.style.color = "red";
        return false;
    }
    idError.innerHTML="";
    if(pwValue == "") {
        let pwError = document.querySelector("#pwError");
        pwError.innerHTML="비밀번호를 입력해주세요";
        pwError.style.color = "red";
        return false;
    }
    pwError.innerHTML="";
    
    return true;

    
    

}
// 여기서 중요한 점은 src 경로인데, spring boot는 기본적으로  
// /META-INF/resources/, /resources, /static, /public 경로를 기본탐색 한다고 합니다.
