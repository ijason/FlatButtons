Flat Buttons
=====================

**Class to create flat buttons.**

![Glossy Button Example](http://ijasoneverett.com/assets/img/FlatButtonsSS.png)

## Requirements

* ARC
* QuartzCore.framework

## Usage

Copy FlatButton.h and FlatButton.m into your project.

Import `#import "FlatButton.h"` where you plan to create the buttons.

Implementation code below:

```smalltalk
FlatButton *flatBtn = [[FlatButton alloc] initWithFrame:CGRectMake(10,10,148,100) withBackgroundColor:[UIColor grayColor]];
[self.view flatBtn];
```

There are more implementation examples in the attached project.

## Contact

Jason Everett

- https://github.com/ijason
- http://twitter.com/ijayson66

##License
MIT License - fork, modify and use however you want.