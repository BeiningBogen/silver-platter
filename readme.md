<p align="center">
  <img height="300" src="https://github.com/BeiningBogen/silver-platter/blob/master/resources/Silver%20Platter5.png">
</p>

## Silver Platter for Xcode
Silver Platter contains useful Functional Reactive Programming (FRP) Xcode file templates and a script for creating a new FRP Xcode project from scratch. These templates are based on the open source Kickstarter iOS app way of laying out [ViewModels](https://github.com/kickstarter/native-docs/blob/master/vm-structure.md) as a pure mapping of input signals to output signals.

## How to use
 

### Installing file templates 
1. Clone or download this repository.
2. On the command line, cd into the silver-platter directory and run `make`
3. In the bottom of the new file dialogue in Xcode, there should be a new section with Silver Platter templates
<p align="center">
  <img src="https://github.com/BeiningBogen/silver-platter/blob/master/resources/newfile-silverplatter.png">
</p>

> For the controller template (which generates several files), you have to check off target membership manually if your project has multiple targets


### Creating a new functional reactive Xcode project
1. On the command line, cd into the silver-platter directory and run `./install.sh`
2. When first opening the generated new project, you should build all targets separately


## Like Functional Reactive Programming?

So do we. [Join us!](https://beiningbogen.no/om-oss/)

## License

MIT License
