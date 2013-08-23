module AP where

{-
 Get n-th member of arithmetic progression (AP)
 a(n) = a(1) + (n-1)*d
-}

get_ap_member :: Int -> Int -> Int -> Int
get_ap_member a1 n d | n < 1 = error "min index of AP member is 1"
                     | otherwise = a1 + (n-1) * d

main = do
  print $ get_ap_member 1 10 2
