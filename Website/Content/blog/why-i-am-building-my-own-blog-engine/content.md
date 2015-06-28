---
output: 
  html_document: 
    css: ~/Dropbox/Code/Tools/R-Blog-Builder/Website/Staged/style.css
    highlight: null
    theme: null
---
# Why I'm Writing My Own Blogging Engine

<img id="leftimage" src="images/blog.jpg" width=200pt>

When I started an online business back in 2008, everyone told me:

>"Don't go and try to build your own blog from scratch. Even if you know you can. Use WordPress.  Better yet, hire a *virtual assistant* and outsource your blog for only $5 an hour."

Their point was: don't let yourself get distracted over trivial details that will keep you from focusing on the goal which was building a business. Not building websites.

So while I was running my businesses (first App Shop and then Mobile App Mastery), that is exactly what I did. For the most part it worked.  My websites ran on WordPress, I could sell training and charge clients and I was even SEO friendly without having to do much about it myself.

## Wait, Isn't this Article About Rolling Your Own Blog Engine?

Yes, and I'll get to that.

Here's the problem with the business guru's advice. It sucks when you find out that your $5/hour VA doesn't know anything about building websites outside of using your web host self-service tool that builds websites. It sucks worse when you want to customize your website and find out that those high end $15, $30 and even $50 per hours VA can't help much.

It really sucks once you do take a look at customizing something like WordPress and realize that you need to suddenly learn **PHP, MySQL, HTML, CSS, XML, WordPress API, Plug-ins** to do any significant work. No wonder those VAs weren't website gurus.

It really, really sucks when your budget can no longer support the fast hosting required to support such a complex system while maintaining a decent response time (key for e-commerce and SEO).

There comes a point when *good enough* isn't good enough. That point came for my business when I wanted more meaningful data collection to fuel my marketing efforts. I needed to really fine tune, do A/B testing and more. My WordPress system became too cumbersome. I couldn't re-build from scratch without losing too many features that were essential.

## The Arguement for Rolling Your Own

While the business didn't outlive my legacy WordPress system, I still knew I wanted a home online. I sure as hell wasn't going to just throw up another WordPress (or Square Space or Blogger or whatever) website. I certainly didn't want to pay big hosting fees or even that $5/hour VA when no revenue was coming in.

I won't lie, losing my business still stings even after a year has passed. But, there are some liberating aspects. At least now, I don't have to use WordPress.

Fuck it - I can go ahead and write my own HTML and CSS code and post it however I like. No worrying about SEO or automatically spamming Twitter or any of it.

A blog doesn't need a plug-in system, a database, a PHP powered presentation system or any of it. A blog only needs a text file that people can read and link to with a web browser. If the text file is formatted with HTML and CSS then **Big Bonus**!

## So Here is My System

Without a business to worry about, I'm free to worry about the trivial things like building a website. This website in fact. There isn't nothing about this website that can't be recreated with a text editor, but I do have a system that builds the text for my website (I'm not insane after all).

### Values

I want to make the user experience be the driving force behind the design of this website. In many ways, I align and am inspired by this blogger Matt Gemmell (see this article [Matt Gemell - Respect Metrics](http://mattgemmell.com/respect-metrics/)).

For me, it's not about any high minded ideals though. I honestly just hate that everything on the internet has to be monitized for tiny amounts of money ruining the entire experience. I hate ads and I really hate pop-overs. My site is going to be for me as a writer and you as a reader. **Content first, as few distractions as possible.**

### Implementation

At it's core, this website really is just HTML and CSS files arranged in directories on my web hosting provider. You can see the current state of the website by looking at the GitHub repository where I keep it:

[Staged @MattjCamp Website](https://github.com/MattjCamp/R-Blog-Builder/tree/master/Website/Staged)

### Workflow

I do have a system in place for writing and publishing new articles. It involved writing the blog post in markdown and storing it in a folder named **Content/Blog**. You can see this as well in the repository above if you look around a little.

Each blog article gets it's own folder with an images directory and a place to put custom css. Usually, the css simply points to the css file in the parent folder.

The content is always stored in a file named **content.md**. There is also a content.md file in the blog parent directory that I will update with a link to the new blog post.

As I'm writing the blog post, I use scripts to convert the markdown and add the new post to a local version of the website I have running on my Mac. The scripts are in **R** because that's what I'm learning right now and because R programming doesn't have all the baggage that an application programming language like C# or Swift would have.

The R scripts use a templating system where the core HTML structure is stored (this part is sort of like WordPress sigh, but they got lots of things right after all...). Take a look at the **Template** folder to see what these look like. They are simple on purpose and I wanted a straightforward way to change the presentation as needed.

Here is all the R code that I used to build this website:

[R Blog Builder](https://github.com/MattjCamp/R-Blog-Builder)

Look, I know it's not really pretty or particulary automated. It's in R, but the code is really just text manipulation and calling the R markdown package. I'm sure you could do the same thing in your current language of choice.

If you were to try and use this code, you would want to open the **render-all.R** file and replace the lines with the content you were rendering. I recommending using **[RStudio](http://www.rstudio.com/products/rstudio/download/)** while working on R.

## Thoughts

So, does this work for my personal blog. Sure. It loads fast and reliably for users even though I only have a cheap commodity hosting package. I can control the content and every page can look the way I want it. I plan on publishing books here and more and it would all work for. At least as far as I can tell.

Maybe you have another opinion. If so, I want to know...


