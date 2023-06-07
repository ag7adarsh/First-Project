# What is this?
In this repo, you will find a simple Python - Flask Web App, which reads the current RAM and CPU usage and a React frontend which shows the statistics in the browser.

![](./img/readme.jpg)

# How to run the application?
## Prerequisites: 
Make sure that Terrform has been installed on your system. 
If you have not installed terraform then, [click here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) to go through the documentation for installation.
## You are few steps away to run the application
### Run follow the commands in your command prompt or terminal:  

> Git clone https://github.com/mahadevmt93/First-Project.git    
  
> terraform apply –auto-approve  
  
you will see the __Public_IP__ address of the instance in the console after successful execution of the above command. You enter the following URL to check for display of  
  
  > __Public_IP__:8080/stats
