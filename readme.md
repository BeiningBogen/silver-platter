<p align="center">
  <img height="300" src="https://github.com/BeiningBogen/silver-platter/blob/master/resources/Silver%20Platter5.png">
</p>

## Silver Platter for Xcode
Silver Platter contains useful Functional Reactive Programming (FRP) Xcode file templates and a script for creating a new FRP Xcode project from scratch. These templates are based on the open source Kickstarter iOS app way of laying out [ViewModels](https://github.com/kickstarter/native-docs/blob/master/vm-structure.md) as a pure mapping of input signals to output signals.

## How to use
 

### Installing file templates 
1. Clone or download this repository.
2. In the command line, `cd` into the silver-platter directory and run `make`.
3. In the bottom of the new file dialogue in Xcode, there should now be a new section with Silver Platter templates.
<p align="center">
  <img src="https://github.com/BeiningBogen/silver-platter/blob/master/resources/newfile-silverplatter.png">
</p>

> The controller and tableview templates generate several files. If your project has multiple targets, you have to alter the target membership manually on these files.


### Creating a new functional reactive Xcode project
1. In the command line, `cd` into the silver-platter directory and run `./install.sh`.
2. When first opening the newly generated project, you should build all targets separately.


## Do you like Functional Reactive Programming?

So do we. [Join us!](https://beiningbogen.no/om-oss/)

## License

MIT License
