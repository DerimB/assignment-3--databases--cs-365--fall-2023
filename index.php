<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>CRUD Operations via a Web Interface</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <h1>CRUD Operations via a Web Interface</h1>
</header>
<form id="clear-results" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
    <input id="clear-results__submit-button" type="submit" value="Clear Results">
</form>

<?php
const SEARCH = 'SEARCH';
const UPDATE = 'UPDATE';
const INSERT = 'INSERT';
const DELETE = 'DELETE';

require_once "includes/config.php";
require_once "includes/helpers.php";

$option = (isset($_POST['submitted']) ? $_POST['submitted'] : null);

if ($option != null) {
    switch ($option) {
        case SEARCH:
            if ("" == $_POST['search']) {
                echo '<div id="error">Search query empty. Please try again.</div>' . "\n";
            } else {
                $result = search($_POST['search']);
                if ($result === 0) {
                    echo '<div id="error">Nothing found.</div>' . "\n";
                }
            }
            break;

        case UPDATE:
            if ((0 == $_POST['new-attribute']) && ("" == $_POST['pattern'])) {
                echo '<div id="error">One or both fields were empty, ' .
                    'but both must be filled out. Please try again.</div>' . "\n";
            } else {
                update($_POST['current-attribute'], $_POST['new-attribute'],
                    $_POST['query-attribute'], $_POST['pattern']);
            }
            break;

        case INSERT:
            if (("" == $_POST['first_name']) || ("" == $_POST['last_name']) || ("" == $_POST['email'])) {
                echo '<div id="error">At least one field in your insert request ' .
                    'is empty. Please try again.</div>' . "\n";
            } else {
                insert($_POST['first_name'], $_POST['last_name'], $_POST['email']);
            }
            break;

        case DELETE:
            if (("" == $_POST['current-attribute']) || ("" == $_POST['pattern'])) {
                echo '<div id="error">At least one field in your delete procedure ' .
                    'is empty. Please try again.</div>' . "\n";
            } else {
                delete($_POST['current-attribute'], $_POST['pattern']);
            }
            break;
    }
}
?>

<section>
    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <fieldset>
            <legend>Search</legend>
            <input type="text" name="search" autofocus required>
            <input type="hidden" name="submitted" value="SEARCH">
            <p><input type="submit" value="Search"></p>
        </fieldset>
    </form>
</section>

<section>
    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <fieldset>
            <legend>Update</legend>
            UPDATE users SET
            <select name="current-attribute" id="current-attribute">
                <option>first_name</option>
                <option>last_name</option>
            </select>
            = <input type="text" name="new-attribute" required> WHERE
            <select name="query-attribute" id="query-attribute">
                <option>user_id</option>    <!-- This is the dropdown menu options, add the rest of the attributes -->
                <option>email</option>
            </select>
            = <input type="text" name="pattern" required>
            <input type="hidden" name="submitted" value="UPDATE">
            <p><input type="submit" value="Update"></p>
        </fieldset>
    </form>
</section>

<section>
    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <fieldset>
            <legend>Insert</legend>
            INSERT INTO users VALUES ( <input type="text" name="first_name" placeholder="First Name" required>, <input type="text" name="last_name" placeholder="Last Name" required>, <input type="text" name="email" placeholder="Email" required> );
            <input type="hidden" name="submitted" value="INSERT">
            <p><input type="submit" value="Insert"></p>
        </fieldset>
    </form>
</section>

<section>
    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <fieldset>
            <legend>Delete</legend>
            DELETE FROM users WHERE
            <select name="current-attribute" id="current-attribute">  <!-- This is the dropdown menu -->
                <option>user_id</option>
                <option>email</option>  <!-- This is the dropdown menu options, add the rest of the attributes -->
            </select>
            = <input type="text" name="pattern" required>
            <input type="hidden" name="submitted" value="DELETE">
            <p><input type="submit" value="Delete"></p>
        </fieldset>
    </form>
</section>

</body>
</html>
