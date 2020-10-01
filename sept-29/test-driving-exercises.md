# TDD Exercises - Sept 29th - Oct. 1st

## Exercise 1:

***["Imagine how to use it" challenge]***

"An IRB application that stores the names of people I meet, 
so that I can remember peoples' names as a student."

```
>save_name("Robert")
"Name saved!"
```

```
>show_names
=> Robert
```

```
>save_name("Sir Duckins")
"Name saved!"
```

```
>show_names
=> Robert
=> Sir Duckins
```

## Exercise 2:

***["Imagine how to use it" challenge]***

"An IRB application that stores my motivation ratings, 
and I want to see the average of my last 3 ratings, 
so that I can understand my recent motivation as a student."

```
>save_motivation(2)
"Motivation rating saved!"
```

```
>show_recent_motivation_avg
=> 2
```

```
>save_motivation(4)
"Motivation rating saved!"
```

```
>show_recent_motivation_avg
=> 3
```

```
>save_motivation(10)
"Motivation rating saved!"
```

```
>show_recent_motivation_avg
=> 5.3
```

```
>save_motivation(4)
"Motivation rating saved!"
```

```
>show_avg_recent_motivation
=> 6
```

## Exercise 3:

***Use exercise 1 to write tests***

```
>save_name("Robert")
"Name saved!"
```

```
describe "the save_name method" do
    it "tells you the name has been saved" do
        expect(save_name("Robert")).to eq("Name saved!")
    end
end
```

```
>show_names
=> Robert

>save_name("Sir Duckins")
"Name saved!"

>show_names
=> Robert
=> Sir Duckins
```

```
describe "the show_names method" do
    save_name("Robert")

    it "returns one saved name" do
        expect(show_names).to eq("Robert")
    end

    it "returns multiple saved names" do
        save_name("Sir Duckins")
        expect(show_names).to eq("Robert\nSir Duckins\n")
    end
end
```
