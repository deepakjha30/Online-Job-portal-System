<?php
include '../includes/session.php';
include '../includes/jobportal.php'; // Ensure your DB connection is included

// Check if login button was clicked
if (isset($_POST['loginbtn'])) {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $acctype = $_POST['acctype'];

    // Determine role ID
    $role_id = ($acctype === "Applicant") ? 1 : (($acctype === "Employer") ? 2 : 3);

    // Use prepared statements to prevent SQL injection
    if ($role_id == 1) {
        $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
    } elseif ($role_id == 2) {
        $stmt = $conn->prepare("SELECT * FROM company WHERE email = ?");
    } else {
        $stmt = $conn->prepare("SELECT * FROM admin WHERE email = ?");
    }

    $stmt->bind_param("s", $email);
    $stmt->execute();
    $query = $stmt->get_result();

    if ($query->num_rows < 1) {
        $_SESSION['message'] = 'Cannot find account with this email.';
        $_SESSION['messagetype'] = 'warning';
        header('location: ../login.php');
        exit();
    } else {
        $row = $query->fetch_assoc();

        if (password_verify($password, $row['password'])) {
            $_SESSION['email'] = $row['email'];
            $_SESSION['role_id'] = $row['role_id'];
            $_SESSION['lastActive'] = time();

            if ($row['role_id'] == 1) {
                $_SESSION['id_user'] = $row['id_user'];
                if (empty($row['headline']) || empty($row['contactno']) || empty($row['dob']) || empty($row['gender']) || 
                    empty($row['state_id']) || empty($row['city_id']) || empty($row['address']) || empty($row['career_id']) || 
                    empty($row['education_id'])) {
                    header('location: ../index.php');
                } else {
                    $_SESSION['message'] = 'You have logged in successfully';
                    $_SESSION['messagetype'] = 'success';
                    header('location: ../index.php');
                }
                exit();
            } elseif ($row['role_id'] == 2) {
                $_SESSION['id_company'] = $row['id_company'];
                if (empty($row['aboutme']) || empty($row['industry_id']) || empty($row['contactno']) || empty($row['esta_date']) ||
                    empty($row['empno']) || empty($row['state_id']) || empty($row['city_id']) || empty($row['address'])) {
                    $_SESSION['message'] = 'You have logged in successfully. Click on Edit Details to update your profile.';
                    $_SESSION['messagetype'] = 'success';
                    header('location: ../index.php');
                } else {
                    $_SESSION['message'] = 'You have logged in successfully';
                    $_SESSION['messagetype'] = 'success';
                    header('location: ../index.php');
                }
                exit();
            } elseif ($row['role_id'] == 3) {
                $_SESSION['id_admin'] = $row['id_admin'];
                if (empty($row['fullname']) || empty($row['gender']) || empty($row['dob']) || empty($row['address'])) {
                    $_SESSION['message'] = 'You have logged in successfully. Click on Edit Details to update your profile.';
                    $_SESSION['messagetype'] = 'success';
                    header('location: ../index.php');
                } else {
                    $_SESSION['message'] = 'You have logged in successfully.';
                    $_SESSION['messagetype'] = 'success';
                    header('location: ../index.php');
                }
                exit();
            }
        } else {
            $_SESSION['message'] = 'Email or Password is Incorrect!';
            $_SESSION['messagetype'] = 'warning';
            header('location: ../login.php');
            exit();
        }
    }
} else {
    $_SESSION['message'] = 'Invalid request!';
    $_SESSION['messagetype'] = 'warning';
    header('location: ../login.php');
    exit();
}
