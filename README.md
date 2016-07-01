# R Website Builder

I use these scripts to automate generating content for static websites. The basic idea is to keep content in markdown format and then use these scripts to build the website.

Today, I'm revamping the structure and usage of this code but the general idea is to use templates for the structure of the HTML page. Dynamic content is substituted into the HTML page at key points using tags.

## Concepts

I'm going to organize this code around these concepts and workflows.

### Definitions

**Template** == HTML structure that doesn't usually change. IE: all blog post pages would have the same format (main body content, sidebar, header, navigation bar).

**Content** == This is the stuff that changes for each page. The main thing is the post content (the story) but it can also be the title, meta tags, etc.

**Token** == This is text that the program will search for and then replace with different content. For example, you may have a token in a webpage template that looks like this [%HEADER%].

**Link Structure**

