// this file is for functions for passwords

//Creates and sets a new password
void setNewPassword(String newPass) 
{
  password = newPass;
}

//Displays the authentication screen before the main program
void showAuthenticationScreen() 
{
  
  welcome = new GLabel(this, 460, 100, 200, 100, "Welcome!");
  welcome.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  welcome.setFont(UIFont);
  
  input = new GPassword(this, 405, height / 2 - 80, 200, 30);
  input.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  
  if (firstTime)
  {
    println("First time user, needs to confirm password");
        
    createLabel = new GLabel(this, 435, 222, 200, 50, "Create Password: ");
    createLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
    createLabel.setFont(UIFont);
    
    confirm = new GPassword(this, 405, height/2 - 10, 200, 30);
    confirm.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
    
    confirmLabel = new GLabel(this, 430, 306, 200, 30, "Confirm Password: ");
    confirmLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
    confirmLabel.setFont(UIFont);
  } else {
    inputLabel = new GLabel(this, 440, 222, 200, 50, "Enter Password: ");
    inputLabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
    inputLabel.setFont(UIFont);
  }
  
  submit = new GButton(this, 450, height / 2 + 80, 100, 30, "Submit");
  submit.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  submit.addEventHandler(this, "submitPassword1");
  submit.setFont(UIFont);
  
  warning = new GLabel(this, 430, height / 2 + 150, 300, 50, "");
  warning.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  warning.setFont(UIFont);
  
}

//Used to submit the password that the user has entered to check if its true or false
public void submitPassword1(GButton source, GEvent event) 
{
  
  if (firstTime)
  {
    if (!input.getPassword().equals(confirm.getPassword()))
    {
      warning.setText("Passwords don't match. Try again.");
    }
    else if (input.getPassword().length() < 3)
    {
      warning.setText("Password has to be at least 3 characters in length");
    }
    else
    {
      authenticated = true;
      password = input.getPassword();
      
    }
  }
  else
  {
    if (!input.getPassword().equals(password))
    {
      warning.setText("Incorrect Password");
    }
    else
    {
      authenticated = true;
    }
  }
  
  if (authenticated) 
  {
    // Cleanup authentication screen
    welcome.dispose();
    
    input.dispose();
    if (firstTime)
      createLabel.dispose();
    
    if (!firstTime)
      inputLabel.dispose();
    
    if (confirm != null)
      confirm.dispose();
      
    if (confirmLabel != null)
      confirmLabel.dispose();
    
    submit.dispose();
    warning.dispose();

    println("Authentication successful!");

    startApp();
  } 
  
}
