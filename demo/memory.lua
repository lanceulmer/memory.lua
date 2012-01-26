local random, cos = math.random, math.cos
local remove = table.remove
local search
search = function(table, v)
  for k, value in pairs(table) do
    if v == value then
      return k
    end
  end
end
local Memory = { }
Memory.count = 0
Memory.objects = { }
Memory.add = function(object)
  if object and type(object) == "table" then
    Memory.count = Memory.count + 1
    Memory.objects[#Memory.objects + 1] = object
  end
end
Memory.remove = function(object)
  if object and type(object) == "table" then
    remove(Memory.objects, search(Memory.objects, object))
    object.clean()
    if Memory.count > 0 then
      Memory.count = Memory.count - 1
      return Memory.count
    end
  end
end
Memory.kill = function()
  while #Memory.objects > 0 do
    Memory.objects[1].clean()
    remove(Memory.objects, 1)
  end
  Memory.objects = nil
  Memory.objects = { }
  Memory.count = 0
end
return Memory
