directory<- getwd()
data_set<- read.csv(paste0(directory,"/","data.txt"), header = TRUE, as.is=TRUE)

# this data contains information regarding flags of
# 194 countries (194rows) and 30 of their attributes (30 columns)

colnames(data_set)
# [1] "country"        "landmass"       "zone"          
# [4] "area"           "population"     "language"      
# [7] "religion"       "bars"           "stripes"       
# [10] "colours"        "red"            "green"         
# [13] "blue"           "gold"           "white"         
# [16] "black"          "orange"         "dominantcolour"
# [19] "circles"        "crosses"        "saltires"      
# [22] "quarters"       "sunstars"       "crescent"      
# [25] "traingle"       "icon"           "animate"       
# [28] "text"           "topleftcolour"  "botrightcolor" 


# it can be seen that flag colours belong to the columns 11 to 16

flag_colours <- data_set[,11:16]

# we want to see how many countries have white in their flag
sum(data_set$white)
# [1] 146

# we want to see which colour is represented in the most flags

lapply(flag_colours,sum)

# we can simplify this into a list

sapply(flag_colours,sum)
# red green  blue  gold white black 
# 153    91    99    91   146    52 

# we are now concerned with the shapes on the flags ie columns 19 to 23
# with each count representing the number of representations

flag_shapes <- data_set[,19:23]

# we now want the min and max repsentations of each shape

sapply(flag_shapes,range)
#        circles crosses saltires quarters sunstars
#[1,]       0       0        0        0        0
#[2,]       4       2        1        4       50

# unique() returns a vector with all duplicate elements removed

unique_vals<- sapply(data_set,unique)

# in order to get the summary of the data, we can use unique()

sapply(unique_vals,length)
#   country       landmass           zone           area 
#    194              6              4            136 
#   population       language       religion           bars 
#    48             10              8              5 
#   stripes        colours            red          green 
#    12              8              2              2 
    #blue           gold          white          black 
#     2              2              2              2 
    #orange dominantcolour        circles        crosses 
#     2              8              4              3 
#   saltires       quarters       sunstars       crescent 
#     2              3             14              2 
#   traingle           icon        animate           text 
#     2              2              2              2 
#   topleftcolour  botrightcolor 
#     7              8 


# we need to see the how many countries with red on their flag have any animations as well

sum(data_set$red)
# [1] 153
tapply(data_set$red,data_set$animate,sum)
#  0   1 
# 118  35 

# hence, there are total of 153 flags with red on them
# out of 153, 118 have no animations
