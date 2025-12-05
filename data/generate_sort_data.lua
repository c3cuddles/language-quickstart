JSON = require "json"

-- corner cases
local corner_cases = {
  {
    -- empty table
    given = {};
    expected = {};
  },
  {
    -- table of len = 1
    given = {0};
    expected = {0};
  },
  {
    -- already sorted table of len > 1
    given = {0, 1};
    expected = {0, 1};
  },
  {
    -- reverse sorted table
    given = {1, 0};
    expected = {0, 1};
  },
  {
    -- negative n positive
    given = {1, -1, 0};
    expected = {-1, 0, 1};
  },
  {
    -- decimal
    given = {0.4, 0.2, 0.6};
    expected = {0.2, 0.4, 0.6};
  },
}

function table.clone(x)
  return {table.unpack(x)}
end

-- generate random data of increasing sizes
SIZE_INIT = 10
-- SIZE_MAX = 1000000000 -- 1e9 (billion)
SIZE_MAX = 10
VALUE_MAX = 10000

local random_cases = {}
local size = SIZE_INIT
while size < SIZE_MAX+1 do
  print("Generating list of size", size)

  local new_given_float = {}
  local new_given_int = {}
  for i = 1, size, 1 do
    table.insert(new_given_float, math.random())
    table.insert(new_given_int, math.random(1, VALUE_MAX))
  end

  local new_expected_float = table.clone(new_given_float)
  table.sort(new_expected_float)
  local new_expected_int = table.clone(new_given_int)
  table.sort(new_expected_int)

  table.insert(random_cases, {given = new_given_float; expected = new_expected_float;})
  table.insert(random_cases, {given = new_given_int; expected = new_expected_int;})

  size = size * 10
end

print("corner cases (BEFORE MOVING!):")
for _, value in ipairs(corner_cases) do
  print("given:")
  for _, y in ipairs(value.given) do
    print(y)
  end
  print("expected:")
  for _, y in ipairs(value.expected) do
    print(y)
  end
end
print("random cases (BEFORE MOVING!):")
for _, value in ipairs(random_cases) do
  print("given:")
  for _, y in ipairs(value.given) do
    print(y)
  end
  print("expected:")
  for _, y in ipairs(value.expected) do
    print(y)
  end
end
-- combine the tables. confusing syntax... 
table.move(random_cases, 1, #random_cases, #corner_cases + 1, corner_cases)

print("corner cases (AFTER MOVING!):")
for _, value in ipairs(corner_cases) do
  print("given:")
  for _, y in ipairs(value.given) do
    print(y)
  end
  print("expected:")
  for _, y in ipairs(value.expected) do
    print(y)
  end
end
print("random cases (AFTER MOVING!):")
for _, value in ipairs(random_cases) do
  print("given:")
  for _, y in ipairs(value.given) do
    print(y)
  end
  print("expected:")
  for _, y in ipairs(value.expected) do
    print(y)
  end
end

-- TODO: write to json

