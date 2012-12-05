-- `map` self realization

my_map :: (a -> b) -> [a] -> [b]
my_map f list = my_map' f list []

my_map' :: (a -> b) -> [a] -> [b] -> [b]
my_map' _ [] acc = reverse acc
my_map' f (x:xs) acc = my_map' f xs (f(x):acc)

self_test :: Bool
self_test =
  all id list
    where
      list = replicate 1000000 expr
        where
          expr = map (^2) [1..5] == my_map (^2) [1..5]
