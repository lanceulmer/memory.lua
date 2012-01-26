import random, cos from math
import remove from table

-- search borrowed from the amazing crawlspacelib: https://github.com/AdamBuchweitz/CrawlSpaceLib
search = (table, v) ->
  for k,value in pairs(table)
    return k if v == value

Memory = {}
Memory.count = 0
Memory.objects = {}

Memory.add = (object) ->
  if object and type(object) == "table"
    Memory.count += 1
    Memory.objects[#Memory.objects+1] = object

Memory.remove = (object) ->
  if object and type(object) == "table"
    remove Memory.objects, search(Memory.objects, object)
    object.clean!
    Memory.count -= 1 if Memory.count > 0

Memory.kill = ->
  while #Memory.objects > 0
    Memory.objects[1].clean!
    remove Memory.objects, 1

  Memory.objects = nil
  Memory.objects = {}
  Memory.count   = 0

return Memory