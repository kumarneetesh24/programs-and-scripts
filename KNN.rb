require 'matrix'

distance = ->(v1,v2){
  (v1-v2).magnitude
}

house_happiness = {
Vector[56, 2] => 'Happy',
Vector[3, 20] => 'Not Happy',
Vector[18, 1] => 'Happy',
Vector[20, 14] => 'Not Happy',
Vector[30, 30] => 'Happy',
Vector[35, 35] => 'Happy'
}

house_1 = Vector[10, 10]
house_2 = Vector[40, 40]

find_nearest = ->(house){
  p house_happiness.sort_by{|point,v|
    distance.(point,house)
  }.first
}

find_nearest_k = ->(house,k){
  p house_happiness.sort_by{|point , v|
    distance.(point,house)
  }.first(k)
}

find_nearest.(house_1)
find_nearest.(house_2)
find_nearest_k.(house_1,3)
find_nearest_k.(house_2,3)
