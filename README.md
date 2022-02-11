# Xresources Translator for Framebuffer 

XTF is a simple script to translate the theme from Xresources file to a script able to implement that theme. the script works by executing `echo` and the right shell escapes characters. 

It works for the themes found [here](https://github.com/janoamaral/Xresources-themes/tree/fd59f8977e2b522422e153aade456aa811914abc), just be sure colors are used directly and there is no `#define`d variable. See also Possible Troubles section below

## Usage

```
$> change-theme.sh infile outfile
```

## Files

In the repository you find:
+ `change-theme.sh`: this is the main script that translate; should have execution permissions
+ `hexa`: this is the assistant script that makes numbers in hexadecimal form; should have execution permissions and stay in the same directory of `change-theme.sh`
+ `pop-os.Xresources`: an example for a dark Xresources file
+ `pop-os.sh`: an example of the output of `change-theme.sh`
+ `xcolors-baskerville-ivorylight.Xresources`: an example for a light Xresources file
+ `baskerville-ivorylight.sh`: an example of the output of `change-theme.sh`

## Possible Troubles 

+ `base16` themes have the `#define` setting of colors, so XTX won't work in those cases
+ if a Xresources has variables like `urxvt.colorXX` the script won't work. Replace `urxvt` with `*`
+ colors like `colorBD` won't be parsed by the script; only numbered colors are parsed
+ same thing for `.foregroud` or `.backgroud` since there is no need for them in the framebuffer
