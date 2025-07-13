
## To Use

`swift run` in this directory.


## Notes

It's a little deceptive to call this a single build because there is a emitted module in the build folder that does not get rebuilt if there are no changes to the module but SPM makes that so invisible and the module just uses the main's build settings so I'm just going to call it Single. 

If I include and example of a SPM calling a different SPM Package that is still sort of the same because it isn't a precompiled library either typically.

I'd have to do some kind of binary package to make it similar to the StaticFirst_ options. 

