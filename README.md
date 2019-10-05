# BSMRatingBar
Animated Rating bar 

![Alt text](Resources/screen1.png)


## Usage

```swift

import UIKit

class ViewController: UIViewController , AnimatedRatingStarDelegate{
    

    @IBOutlet weak var animatedRating: AnimatedRatingStar!
    @IBOutlet weak var ratinglabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.animatedRating.delegate = self
        
    }


    func onRated(_ rate: Float) {
        ratinglabel.text = "Rating is \(rate)"
    }
    
}

```

**It's recommended to create a UIView object**

See below example:

## Requirements

- Minimum iOS: 8.0
- Works for both iPhone and iPad


## Installation

```ruby
pod "BSMRatingBar"
```


## License

The MIT License (MIT)

Copyright (c) 2019 Bassam Fouad

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
