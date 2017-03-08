# gilded-rose-tech-test

## Index
* [Task] (#Task)
* [Installation] (#Install)
* [Usage] (#Usage)
* [Approach] (#Approach)

## <a name="Task">Task</a>
Complete the GildedRose refactoring kata, outlined [here](https://github.com/emilybache/GildedRose-Refactoring-Kata)

## <a name="Install">Installation</a>
* Clone from github
```
$ git clone https://github.com/BenJohnCarson/gilded-rose-tech-test.git
```

* Switch to ruby 2.3.3
```
$ rvm use 2.3.3
```

* Install gems
```
$ gem install bundler
$ bundle
```

## <a name="Usage">Usage</a>
* Running tests
```
$ rspec
```

## <a name="Approach">Approach</a>

To begin, I decided that my first step before adding any additional functionality or refactoring, was to create a comprehensive test suite that I could rely on. I made a spec file for each unqiue item and one for a 'normal' item where I passed in the name 'item'.

Once I'd setup my tests, I put a return in the legacy code such that when an item was passed in with the name 'item', it would return an empty update\_item method I created. This made all the tests for the normal\_item\_spec red so I could start test driving the development of the update_item method.

I then repeated the above for each unique item, untill I got to the point where the legacy update\_quality method simply returns one of my methods based on the items name.

From here, I extracted each of these methods out into their own class and named the method update in each class. This allowed me to simply call ```item.update``` inside the legacy update\_quality method.

Next I created a DefaultItem class that contained any empty update method (which allowed me to remove the sulfuras class) and a constant MAX_QUALITY, this inherited from the untouchable Item class and all my other item classes inherited from it. Had I been allowed to change the Item class, I would've just popped the constant and the update method in there and had the classes inherit from that instead.

At this point it was easy to add the conjured item; I created some tests for it, then TDD-ed the creation of a new conjured_item class.
