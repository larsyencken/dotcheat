(use 'cascalog.api)

; write a map operator
(defmapcatop tokenise [line]
  "reads in a line of string and splits it by a regular expression"
  (clojure.string/split line #"[\[\]\\\(\),.)\s]+"))

; perform a word count
(?<- (stdout) [?word]
     (sentence :> ?line)
     (tokenise :< ?line :> ?word))

(require '[cascalog.ops :as c])
(?- (stdout)
    (<- [?word ?count]
        (sentence :> ?line)
        (tokenise :< ?line :> ?word)
        (c/count :> ?count)))

; inner join between age and gender sources
(?<- (stdout)
     [?name ?age ?gender]
     (age ?name ?age)
     (gender ?name ?gender))

; full outer join between age and gender sources
(?<- (stdout)
     [?name !!age !!gender]
     (age ?name !!age)
     (gender ?name !!gender))

; left outer join: 1+ instances of person1, 0+ instances of person2
(?<- (stdout)
     [?person1 !!person2]
     (person ?person1)
     (follows ?person1 !!person2))
