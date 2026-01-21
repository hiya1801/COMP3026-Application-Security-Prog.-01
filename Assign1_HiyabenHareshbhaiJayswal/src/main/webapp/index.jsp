<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>

<!-- Basic style for error messages -->
<style>
.error {
    color: red;
    font-size: 13px;
}
</style>

<script>
/*
 * Client-side JavaScript validation
 * Error messages are shown in red
 */
function validateForm() {

    // Clear previous errors
    document.querySelectorAll(".error").forEach(e => e.innerHTML = "");

    let userId = document.getElementById("userid").value;
    let password = document.getElementById("password").value;
    let name = document.getElementById("name").value;
    let country = document.getElementById("country").value;
    let zip = document.getElementById("zip").value;
    let email = document.getElementById("email").value;

    let sex = document.querySelector('input[name="sex"]:checked');
    let language = document.querySelector('input[name="language"]:checked');

    let valid = true;

    // User ID validation (5–12)
    if (userId.length < 5 || userId.length > 12) {
        document.getElementById("useridErr").innerHTML =
            "Required and must be of length 5 to 12.";
        valid = false;
    }

    // Password validation (7–12)
    if (password.length < 7 || password.length > 12) {
        document.getElementById("passwordErr").innerHTML =
            "Required and must be of length 7 to 12.";
        valid = false;
    }

    // Name validation (alphabets only)
    let namePattern = /^[A-Za-z]+$/;
    if (!namePattern.test(name)) {
        document.getElementById("nameErr").innerHTML =
            "Required and alphabets only.";
        valid = false;
    }

    // Country validation
    if (country === "") {
        document.getElementById("countryErr").innerHTML =
            "Required. Must select a country.";
        valid = false;
    }

    // ZIP validation (numeric)
    if (zip === "" || isNaN(zip)) {
        document.getElementById("zipErr").innerHTML =
            "Required. Must be numeric only.";
        valid = false;
    }

    // Email validation
    let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (!emailPattern.test(email)) {
        document.getElementById("emailErr").innerHTML =
            "Required. Must be a valid email.";
        valid = false;
    }

    // Sex validation
    if (!sex) {
        document.getElementById("sexErr").innerHTML = "Required.";
        valid = false;
    }

    // Language validation
    if (!language) {
        document.getElementById("langErr").innerHTML = "Required.";
        valid = false;
    }

    return valid;
}
</script>

</head>
<body>

<h2>Registration Form</h2>

<form action="RegisterServlet" method="post" onsubmit="return validateForm();">

User ID:
<input type="text" id="userid" name="userid">
<span id="useridErr" class="error"></span>
<br><br>

Password:
<input type="password" id="password" name="password">
<span id="passwordErr" class="error"></span>
<br><br>

Name:
<input type="text" id="name" name="name">
<span id="nameErr" class="error"></span>
<br><br>

Address:
<input type="text" name="address">
<span class="error">Optional</span>
<br><br>

Country:
<select id="country" name="country">
    <option value="">Please select a country</option>
    <option>India</option>
    <option>Canada</option>
    <option>USA</option>
</select>
<span id="countryErr" class="error"></span>
<br><br>

ZIP Code:
<input type="text" id="zip" name="zip">
<span id="zipErr" class="error"></span>
<br><br>

Email:
<input type="text" id="email" name="email">
<span id="emailErr" class="error"></span>
<br><br>

Sex:
<input type="radio" name="sex" value="Male">Male
<input type="radio" name="sex" value="Female">Female
<span id="sexErr" class="error"></span>
<br><br>

Language:
<input type="checkbox" name="language" value="English">English
<input type="checkbox" name="language" value="Non-English">Non-English
<span id="langErr" class="error"></span>
<br><br>

About:
<textarea name="about" rows="4" cols="30"></textarea>
<span class="error">Optional</span>
<br><br>

<input type="submit" value="Submit">

</form>

</body>
</html>