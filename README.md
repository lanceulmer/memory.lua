# memory.lua #

A simple way to keep track of objects in lua. Not only can each object destroy itself. Also all objects can be freed and cleaned at the same time. This is done with one line of code. Memory keeps track of the objects itself. This means an entire set of objects can be cleaned from an entirely separate file or location without knowing anything about the objects that are being cleaned.

## Functions ##

The following functions are included in memory:

*   memory.add(object)
    -- Add one object to memory. This object must have a clean function to work properly with memory.
*   memory.remove(object)
    -- Remove one object from memory. This calls the object's clean function.
*   memory.kill()
    -- This runs the clean function on all remaining objects and removes them from memory.

## Installation ##

Drop memory.lua into your project and load it with:
    
    local memory = require("memory")

## Usage ##

The best way to learn about memory is the attached coronaSDK project. Each "particle" can be tapped to clean it by itself. Also, the clean button can remove all of the "particles" at the same time.

Here is a basic example:

    -- load memory
    local memory = require("memory")

    -- add an object with a clean() function
    local object1 = {}
    object1.clean = function()
      print("clean")
    end

    memory.add(object1)

    -- clean the object from memory
    memory.remove(object1)


    -- add another object
    local object2 = {}
    object2.clean = function()
      print("clean")
    end

    memory.add(object2)

    -- clean all objects from memory
    memory.kill()