;; Generated by boxworld generator
;; http://www.cs.rutgers.edu/~jasmuth/boxworld.tar.gz
;; by John Asmuth (jasmuth@cs.rutgers.edu)

(define (domain bx-c5-b10-pc)
 (:requirements :typing :equality :disjunctive-preconditions
                :probabilistic-effects :existential-preconditions
                :conditional-effects :negative-preconditions
                :universal-preconditions :rewards)
 (:types city box truck plane)
 (:predicates (box-at-city ?b - box ?c - city)
              (truck-at-city ?t - truck ?c - city)
              (box-on-truck ?b - box ?t - truck)
              (plane-at-city ?p - plane ?c - city)
              (box-on-plane ?b - box ?p - plane)
              (destination ?b - box ?dst - city)
              (can-drive ?src - city ?dst - city)
              (wrong-drive1 ?src - city ?wrongdst - city)
              (wrong-drive2 ?src - city ?wrongdst - city)
              (wrong-drive3 ?src - city ?wrongdst - city)
              (can-fly ?src - city ?dst - city))
 (:action load-box-on-truck-in-city
  :parameters (?b - box ?t - truck ?c - city)
  :precondition (and (box-at-city ?b ?c)
                     (not (destination ?b ?c))
                     (truck-at-city ?t ?c)
                )
  :effect (and (decrease (reward) 1)
               (box-on-truck ?b ?t)
               (not (box-at-city ?b ?c))
          )
 )
 (:action unload-box-from-truck-in-city
  :parameters (?b - box ?t - truck ?c - city)
  :precondition (and (box-on-truck ?b ?t)
                     (truck-at-city ?t ?c)
                )
  :effect (and (box-at-city ?b ?c)
               (not (box-on-truck ?b ?t))
          )
 )
 (:action load-box-on-plane-in-city
  :parameters (?b - box ?p - plane ?c - city)
  :precondition (and (box-at-city ?b ?c)
                     (not (destination ?b ?c))
                     (plane-at-city ?p ?c)
                )
  :effect (and (decrease (reward) 1)
               (box-on-plane ?b ?p)
               (not (box-at-city ?b ?c))
          )
 )
 (:action unload-box-from-plane-in-city
  :parameters (?b - box ?p - plane ?c - city)
  :precondition (and (box-on-plane ?b ?p)
                     (plane-at-city ?p ?c)
                )
  :effect (and (box-at-city ?b ?c)
               (not (box-on-plane ?b ?p))
          )
 )
 (:action drive-truck
  :parameters (?t - truck ?src - city ?dst - city)
  :precondition (and (truck-at-city ?t ?src)
                     (can-drive ?src ?dst)
                )
  :effect (and (decrease (reward) 5)
               (not (truck-at-city ?t ?src))
               (probabilistic
                0.2 (forall (?wrongdst1 - city)
                    (when (wrong-drive1 ?src ?wrongdst1)
                    (forall (?wrongdst2 - city)
                    (when (wrong-drive2 ?src ?wrongdst2)
                    (forall (?wrongdst3 - city)
                    (when (wrong-drive3 ?src ?wrongdst3)
                     (probabilistic
                      1/3 (truck-at-city ?t ?wrongdst1)
                      1/3 (truck-at-city ?t ?wrongdst2)
                      1/3 (truck-at-city ?t ?wrongdst3)
                     )
                    ))))))
                0.8 (truck-at-city ?t ?dst)
               )
          )
 )
 (:action fly-plane
  :parameters (?p - plane ?src - city ?dst - city)
  :precondition (and (plane-at-city ?p ?src)
                     (can-fly ?src ?dst)
                )
  :effect (and (decrease (reward) 25)
              (not (plane-at-city ?p ?src))
               (plane-at-city ?p ?dst)
          )
 )
)
(define
 (problem bx-c5-b10-pc)
  (:domain bx-c5-b10-pc)
  (:objects box0 - box
            box1 - box
            box2 - box
            box3 - box
            box4 - box
            box5 - box
            box6 - box
            box7 - box
            box8 - box
            box9 - box
            truck0 - truck
            truck1 - truck
            plane0 - plane
            truck2 - truck
            truck3 - truck
            plane1 - plane
            city0 - city
            city1 - city
            city2 - city
            city3 - city
            city4 - city
  )
  (:init (box-at-city box0 city0)
         (destination box0 city4)
         (box-at-city box1 city0)
         (destination box1 city4)
         (box-at-city box2 city0)
         (destination box2 city2)
         (box-at-city box3 city1)
         (destination box3 city4)
         (box-at-city box4 city1)
         (destination box4 city3)
         (box-at-city box5 city2)
         (destination box5 city4)
         (box-at-city box6 city4)
         (destination box6 city3)
         (box-at-city box7 city3)
         (destination box7 city1)
         (box-at-city box8 city0)
         (destination box8 city3)
         (box-at-city box9 city1)
         (destination box9 city0)
         (truck-at-city truck0 city0)
         (truck-at-city truck1 city0)
         (plane-at-city plane0 city0)
         (truck-at-city truck2 city1)
         (truck-at-city truck3 city1)
         (plane-at-city plane1 city1)
         (can-drive city0 city3)
         (can-drive city0 city4)
         (can-drive city0 city2)
         (can-drive city0 city1)
         (wrong-drive1 city0 city3)
         (wrong-drive2 city0 city4)
         (wrong-drive3 city0 city2)
         (can-fly city0 city1)
         (can-drive city1 city3)
         (can-drive city1 city0)
         (can-drive city1 city2)
         (wrong-drive1 city1 city3)
         (wrong-drive2 city1 city0)
         (wrong-drive3 city1 city2)
         (can-fly city1 city0)
         (can-drive city2 city0)
         (can-drive city2 city1)
         (can-drive city2 city4)
         (can-drive city2 city3)
         (wrong-drive1 city2 city0)
         (wrong-drive2 city2 city1)
         (wrong-drive3 city2 city4)
         (can-drive city3 city0)
         (can-drive city3 city1)
         (can-drive city3 city2)
         (can-drive city3 city4)
         (wrong-drive1 city3 city0)
         (wrong-drive2 city3 city1)
         (wrong-drive3 city3 city2)
         (can-drive city4 city0)
         (can-drive city4 city2)
         (can-drive city4 city3)
         (wrong-drive1 city4 city0)
         (wrong-drive2 city4 city2)
         (wrong-drive3 city4 city3)
  )
  (:goal (forall (?b - box)
                 (exists (?c - city)
                         (and (destination ?b ?c)
                              (box-at-city ?b ?c)
                         )
                 )
         )
  )
  (:goal-reward 500)
)
