# Tasting Notes 4 Kickoff

<img id="leftimage" src="images/tn-kick.png" width=200pt>

I originally created Tasting Notes in November 2008, this was one
of my first and most successful iPhone Apps. Tasting Notes was 
really a version 2 of my very first app Wine Pad.

## Tasting Notes History

The idea behind Wine Pad was simple, it was to be an
electronic version of those books that you buy at Barnes
and Nobles where you record your thoughts about the wines
you tried. These books are the kind of thing you might buy
a friend as a gift because you know they like wine but you 
don't think just a bottle of wine is a good enough birthday
gift.

With Wine Pad, you would snap pictures of wine labels and 
then fill in all the information that you wanted to remember
including wine type, color and name. You could also rate the
wine on a scale of 1-5 and write a detailed "Tasting Note".

Wine Pad was only one of set of about 20 initial wine note
app offerings. The initial response was enthusiatic and to 
capitalize on this I released clones of Wine Pad, the most
notable of which was Beer Pad. A lot of the feedback I got was
"I want Wine Pad, but for [name your vice]".

### One Pad to Rule Them All

I started planning a next generation of apps only a few months
after Wine Pad. This was partially due to technical problems caused
by being an early adopter - due to a software signing glitch I 
couldn't update Wine Pad. Each updated version of Wine Pad was
actually named Wine Pad 2.

Also, the notion of managing tons of Pad clones seemed to be
too much. So I wanted something new that was customizable. 
I could use a common framework to create many different types
of these note taking apps. Also, I could give my customers a way
to build their own note databases.

The framework I built was named **ASPad** and it was based on SQLite.
I spent a solid two months on this initial project. After the release
of the first app based on this, *Tasting Notes*, I would spent a few more
months iterating the design.

Tasting Notes was a success, but not a runaway success like the original
Pads. Tasting Notes had to compete with 15,000 apps while Wine Pad only had
to complete with 800. Still, the revenue from Tasting Notes was in the 
thousands (almost unheard of 2011 on).

Tasting Notes most notable feature was customization - this is something that
only Tasting Notes had. Customization is a feature that never made it into the
other wine note apps. However, instead of maintaining a fleet of apps
Tasting Notes because a generic catch all app.

## Middle to End of Lifecyle

As it became clear later on in 2010 and 2011 that Tasting Notes, or most
iPhone apps, wasn't going to support a full time salary I iterated the
app less and updates became rare. Often times, updates became a yearly occurance
while the norm for the App Store was monthly updates.

In the end, with the new visual standards based on iOS 7, Core Data,
the upcoming Swift release and other enhancements to Xcode Tasting Notes
became obsolete. A handful of people still used the app, but bug fixes
and updates became too much. So I pulled the app so I wouldn't have to 
throw good money at a product that didn't have much return.

## The Reboot

Now that it's 2015 I feel differently. I no longer see the App Store and
iPhone apps as a business opportunity to be exploited, but a hobby to 
enjoy. I want to start building things again on iOS and I think a great
project would be to reboot Tasting Notes.

## What is the Current State?

Do people even use wine note apps these days? What assets
do I have from Mobile App Mastery that I can put back into
this new project? Can I even use the name "Tasting Notes"
anymore?

### Source Code

I still have the source code for the iOS 6 version and the
iOS 7 version of Tasting Notes. These will still run on current
iPhones, and they are both written in Objective-C and depend on
low level SQLite integrations. You can see all the source code
for these yourself [since I now host Tasting Notes
source code on Github](https://github.com/MattjCamp/TastingNotes).

There is also a Core Data version of Tasting Notes [available on Github]
(https://github.com/MattjCamp/TastingNotes-Core-Data-Version) but this was
never finished or released.

I tested this code on my iPhone and it still works today, so one
option would be to simply re-release this app after doing some minor
bug checking.

### Tasting Notes Brand

Perhaps the strongest thing I have going is the right to use
the name "Tasting Notes" on the App Store. I looked into my
account and while the account is inactive, it appears that I still
have the Tasting Notes app there ready to go.

This is always the tricky part though, the code signing and app review
process can break you after you put months of work into an app.

However, I'm pretty sure this is fine and it also appears that the domains
I have had before are still available.

### Competition

There are wine note apps available now, the most notable is
[Wine Notes](http://winenotesapp.com/) followed by [Wine Album]
(http://zeode.com/winealbum/). There is also [Vino Cell]
(https://vinocell.com/en/app) which offers note taking, but also
more celler management. These apps range from free to 10 dollars.

There are some other apps like these as well: some are pretty
outdated and some are really just skins for websites (like CorkBin).

The fact that many wine apps are out there is a good sign: it
means interest in these kinds of apps is still there. 

### Supporting Assets

I still have the original 99Designs art for Tasting Notes and I
could resue this. The icons still look great and the resolutions are
high enough to use on a website cover.

### Bandwidth

My day job is pretty demanding still: I use a programming language that
I'm still getting to know, **R**, to essentially hack databases that I'm
still getting familiar with. Part of my job is building infrastructure
to automate some of this. I'm basically building an API in R.

On top of that I have tons of middle age responsbilities: namely a
house and family.

However, I made be able to scrape out an hour in the morning and an
hour or two in the evening to work on this project. This is prorably
the biggest challenge I face today.

## Thoughts on How to Proceed?

Here are my intital thoughts. I'm still in the planning
stages here but I don't want to just blindly start something
here.

### Technology

It's sort of tempting to just bring back the old code 
base, but let's be honest that's not what I really want to
do. I want something that I can confidently work on for the
next few years. Legecy code won't do it for me.

One of the biggest frustrations from last time was being
stuck with SQLite. This choice prevented me from using iCloud
for syncing and trapped the app on the mobile devices. Managing
the C level API for SQLite was also just error prone.

This time I have to stick to Core Data and iCloud. Tasting 
Notes will be an Apple only app and I'm going to leverage these
technologies.

Same goes for programming language. Let's face it, Objective-C
is unpleasent. I'm doing the next one in Swift obviously.

Also, I will do my best to use the most up to date UI patterns
including Storyboards. Some of this will depend on use and design
choices.

### Scope and Design

I'm still debating this one. Tasting Notes was about customization
and that feature did resonate with some people. But, this customization
added an incredible layer of complexity. It prevented me from offering
a truly compelling user experience and the customization was always
a bit confusing for people.

One option is to simply recreate the Wine Pad core experience but use
the Tasting Notes name. Honestly, this is what I'm leaning towards.

Another option is to try and build a completely customizable solution
like the original Tasting Notes. Or something in between.

### Prototyping

I am going to start with prototyping the Core Data layer in Swift
with a simple UI. Since I need to get up to speed with Swift and I'm
very familiar with the data layer I think this will be a good place to 
start.

At the same time, I want to move to a GitHub powered experience. As a 
hobby it would be nice to be transparent with this process and at some 
point I may decide that Tasting Notes development should be a more
social experience.

# The Plan

So, for how I am going to make sure to get up early and leave the house 
to code in a local coffee shop before work starts. I should be able to
get a good hour a day in this way.

