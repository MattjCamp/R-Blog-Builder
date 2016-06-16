# R-Blog-Builder

>**NOTE** I've been working with this code builder for over a year now and while it works well enough for my website I think that it could use a rewrite and made a little bit more usuable.

A collection of R scripts that I am using to build the HTML pages for my blog.  It is nowhere near where I want to be and a work in progress, but I want to track my code here anyway.

So far all I have is the templates for the HTML files, the "staged files" that make up my website now and a start with an R script that will be adapted to automate the construction of the website.

## Scope

To automate the coding and maintenance of a blog using a template system and markdown coding.  This tool will be used to generated the files needed for the  [@MattjCamp](http://mattjcamp.com) blog.

### Workflow

Each page in the blog will have a template folder where the base HTML code will be saved.  When the blog is generated, the program will look to these files and use them to add content and construct each web page.  If a template is missing, the program will look to the parent folder to get the template.

## Tools

This project is created using R 3.1.1 and R Studio .98.

## Update 10-31-2015

Happy Halloween! So, today I'm spending a bit more time on this. I'm removing
my personal blog content to make R-Blog-Builder more generalizable. Next I'm 
going to refactor the Render function to make it more clear.

So, I hope to be able to automate most of the process of posting new
blog posts. I want to remove some of the friction involved with this process.
