# xkcd comics

A simple bash script that gets random comics images from [xkcd](https://xkcd.com) and displays 
in a fullscreen mode on a screen.

## how it works?

 - generate random integer $image_id
 - get a json object from a following url https://xkcd.com/$image_id/info.0.json
 - parse the json with grep looking for the image url
 - curl that image
 - display with feh

# usage

```
$ source xkcd.sh
```

# requirements

 - [curl](https://cran.r-project.org/web/packages/curl/index.html)
 - [feh](https://feh.finalrewind.org/)

# TODOs

 - [x] initial version 
 - [ ] get rid of python script and only use pipes

## author

* **Vladimir Korzinov** - *Initial work* - [vvkorz](https://github.com/vvkorz)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
