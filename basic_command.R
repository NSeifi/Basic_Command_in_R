library(tidyverse)
library(lubridate)
library(ggplot2)
library(here)
library(skimr)
library(janitor)
library(palmerpenguins)
#here is the commnet
print("Hello")
first_variable <- "hi"
second <- 12.4
vector <- c(1, 2, 3)
vec1 <- c(1L,2L,3L)
typeof(second)
length(vec1)
is.integer(vector)
names(vec1) <- c("a", "b", "c")
first_list <- list("a", 1, 1L)
str(first_list)
second_list <- list(chicago=1L, "a"=2.5, '4' = 5)
str(second_list)
#pip %>%

mdy("january 20th, 2023")
dmy("20 january 2023" )
# return yyyymmdd format
ymd_hms("2021-01-20 20:11:59")
ymd_h("2021-01-20 20")
as_datetime(now())
data.frame(x=c(10,20), y=c(22,45L))
dir.create("newtest")
file.create("newtest2.csv")
#delete file
unlink("newtest2.csv")
file.exists("newtwst2.csv")
matrix(c(3:8), ncol=2 ,nrow=3)
x <- 5
y <- 3
if (x>y){
  x<- x+1
  print(x)
}else if (y>x){ y <- y+1
print(y)
}else{print("nothing")}
  
k<-c(1,1,2,4,3,5)
x<- matrix(k, ncol=2)
x

data("diamonds")
view(diamonds)
as_tibble(diamonds)
read_csv(readr_example("mtcars.csv"))

library(readxl)
read_excel(readxl_example("type-me.xlsx"))
excel_sheets(readxl_example("type-me.xlsx"))
read_excel(readxl_example("type-me.xlsx"), sheet = "date_coercion" )

penguins %>% 
  select(-species)
penguins %>%
  rename(island_2=island)

rename_with(penguins, toupper)
clean_names(penguins)

penguings2 <- penguins %>% arrange(-bill_depth_mm)
view(penguings2)

penguins %>% group_by(island) %>% drop_na() %>% summarise(mean_bill= mean(bill_depth_mm))

penguins %>% group_by(island,species) %>% drop_na() %>% summarise(mean_bill=mean(bill_length_mm),
                                                                  max_bill=max(bill_length_mm))
penguins %>% filter(species=="Adelie")

id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", 
          "Christy Hickman", "Johnson Harper", "Candace Miller", 
          "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical",
               "Developer", "Programmer", "Management", "Clerical", 
               "Developer", "Programmer")
employee <- data.frame(id,name,job_title)
print(employee)

separate(employee, name, into = c('first_name','last_name'),sep = ' ')
unite(employee,'name',first_name,last_name,sep = ' ')
penguins %>% mutate(flipper_m=flipper_length_mm/1000,body_mass_kg=body_mass_g/1000)
library(Tmisc)
data("quartet")
quartet %>% group_by(set) %>% summarize(mean(x),sd(x),mean(y),sd(y),cor(x,y))

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,
                           color=species, shape=species, size=species))

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,
                           ), color="purple")

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g,
                           alpha=species)) + 
  geom_smooth(mapping = aes(x=flipper_length_mm, y= body_mass_g))

ggplot(data = penguins) + 
  geom_smooth(mapping = aes(x=flipper_length_mm, y= body_mass_g,linetype=species))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=cut,color=cut,fill=clarity))

ggplot(data = penguins, aes(x=flipper_length_mm, y= body_mass_g)) +
  geom_point()

ggplot(data = penguins, aes(x=flipper_length_mm, y= body_mass_g)) +
  geom_point() + geom_smooth(method= 'loess')


ggplot(data = penguins, aes(x=flipper_length_mm, y= body_mass_g)) +
  geom_point(aes(color=species)) +
  facet_wrap(~species)

ggplot(data = diamonds)+
  geom_bar(aes(x=cut, color=cut)) +
  facet_wrap(~clarity)

ggplot(data = penguins, aes(x=flipper_length_mm, y= body_mass_g)) +
  geom_point(aes(color=species)) +
  facet_grid(sex~species)

ggplot(data = penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y= body_mass_g))+
  labs(title = 'new penguins', subtitle = 'it is a subtitle', caption = 'caption')+
  annotate('text', x=220, y=3500, label='biggest', color='purple',
           fontface='bold', size=4.5, angle=45)

p<- ggplot(data = penguins)+
  geom_point(mapping=aes(x=flipper_length_mm, y= body_mass_g))

p1<- p+ labs(title = 'new penguins', subtitle = 'it is a subtitle', caption = 'caption')

p1+annotate('text', x=220, y=3500, label='biggest', color='purple',
            fontface='bold', size=4.5, angle=45)
ggsave("three penguins.png")
