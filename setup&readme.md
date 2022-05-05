## TIAGo Task (BehaviorTree)

#1) Verification of Pkg navigation

- roslaunch navigation aip_tiago_mapping.launch : Ok
- roslaunch navigation aip_tiago_mapping.launch : Ok
- rosservice call /sri22/move_base "x: 0.0 y: 0.0 theta: 0.0":Ok 

2) Coordonnates on Map :
Initial Pose : Posi : x=0.0 ; y=0.0 / Ori : O=0
Finale  Pose : Posi : x=-3.431 ; y=-4.019 / Ori : O= ?? Try to correct 

3) Mapping of the full office (done)

4) Navigation with move_base and actionlib (done)

5) RDV 1&2

# Behavior tree vs State machine 

1) Behavior tree:

_ Task switching structure( hierachy of task )
Behavior Trees are an interesting alternative to State Machines. Actions between states in a SMACH become leaves in a tree, and moving between states in a SMACH is handles by the root of the tree in Behavior Tree based planning. For more details, visit this overview.
(https://uos.github.io/mbf_docs/tutorials/advanced/behavior_tree/)

2) Summary : 

_Tick : means to invoke the callback tick() of the tree node 

_The callback must return :

  .success
  .failure
  .running

_Sequence : ticks all its children as long as they return Success.If any child returns Failures , the sequence is aborted :

 . Sequence 
 . SequenceStar 
 . ReactiveSequence
 
_Decorators :

 .A decorator is a node that can have only a single child.
It is up to the Decorator to decide if, when and how many times the child should be ticked.

 .The node Inverter is a Decorator that inverts the result returned by its child .

_ Fallback :

Currently the framework provides two kinds of nodes:

    Fallback
    ReactiveFallback

They share the following rules:

  . Before ticking the first child, the node status becomes RUNNING.

  . If a child returns FAILURE, the fallback ticks the next child.

  . If the last child returns FAILURE too, all the children are halted and the fallback returns FAILURE.

  . If a child returns SUCCESS, it stops and returns SUCCESS. All the children are halted.

_ Action Node and condition have no child 

_ inputs ports :

 . a static string which can be parsed by the Node, or
 . a "pointer" to an entry of the Blackboard, identified by a key.

_ Loggers
  A Logger is a mechanism to display, record and/or publish any state change in the tree.


3) C++ vs python 

behaviorTreeCPP vs py_trees
 Try a tuto with py_tree or behaviorTreeCPP

4) Implement a simple example 

7) State machines 

1)Tuto with Smach(python lib )

1-1)Summary of the state mahine creating :

_ Creating a state  :

 . function "init" method to initialise your method 
 . In the function "excute" all work is done 
 . return outcome =['succeded','failed','awesome'] , it describes how the a state finishes .

_ Adding states to state machine :
Def:
 . A state machine is a container that holds a number of states. When adding a state to a state machine container, you specify the transitions between the states
 . Every state machine container is also a state. So you can next state machines by adding a state machine container to another state machine container.    

1-2) State library :

_SimpleActionState(call action actions) , 
_ServiceState( call ROS services) , 
_MonitorState

1-3) Container library :

_StateMachine: generic state machine container
_Concurrence : that can run states in parallel
_Sequence : that makes it easy to excute a set of states in a sequence 

1-4) Container notion ??? (research)

2) Navigation realised with smach 


8) Comparison state machine vs behaviorTree for applications (https://robohub.org/introduction-to-behavior-trees/ 3)

1)Specific to BTs vs. FSMs, there is a tradeoff between modularity and reactivity. Generally, BTs are easier to compose and modify while FSMs have their strength in designing reactive behaviors.

2) Comparison with diagram (see link )

3) To compensate the lack of transition in behavior , we have the notion of reactive sequence that allows to tick a  previous child in a sequence even it return success .
4) State machine is used to manage high-level operation mode but behavior tree is used to build a complex sequence of behaviors 
5) (https://www.youtube.com/watch?v=gXrKGTPwfO8 2)
table 

State machine :

_ Easy to Implement and understand
_ Not scall well with more transitions
_Thinking in term of actions and conditions
_ Analogy problem 
_ Optimal state feeback :Next action should only depend on current world state , not on curent action 
_Library : smach for Python and smacc for C++
=> Good for smaller problem

Behavior Tree (BT):

_Modular (weak dependence between subtrees )
_ easier to read 
_easier to modified and extend 
_Thinking in term of state and event 
_ Function call analogy 
_ Generalizes : decision trees , subsumption architecture , teleo-reactive approach
_ Behavior Tree allows to isolate better modules . BT has not transition => It does not need a source node fulfill a condition to continue with the process 
_Library : py_trees for Python and behaviorTreeCPP for C++

=> Good for larger problems 

Conclusion : 

Toutes les deux méthodes ont beaucoup de contributeurs sur github plus pour les behaviorsTree . On remarque tout de meme que la complexité des machines à états vient du fait qu'il faut bien gérer  les transitions entre les états et concernant le behaviorTree plus simple à implémenter par contre un certain nombre de concept doivent etre compris et maitriser pour l'implémenter . 

9) Bibliothèque py_trees 
_ ressources :

 http://docs.ros.org/en/kinetic/api/py_trees_ros/html/tutorials.html#tutorial-3-blackboards

_ https://readthedocs.org/projects/py-trees/downloads/pdf/devel/

Skelton of code explain:
. The initialise() method kicks in only when the behaviour is not already running
. The parent tick() method is responsible for determining when to call initialise() , stop() and terminate() methods . 
. The parent tick() method always calls update() . 
. The update() method method is responsible for deciding the behavior Status . 

9.1) initialisation : 
_ The function __init__ should instantiate the behavior sufficiently for offline dot graph generation 
_ The function initialise configure and reset the behavior ready for (repeated) execution . Initialisation here is about getting ready for immediate execution of a task .

9.2) Status 

=> py_trees.common.Status[FAILURE,INVALID,RUNNING,SUCCESS]
_FAILURE : Behaviour check has failed, or execution of its action finished with a failed result.
_INVALID: Behaviour is uninitialised and inactive, i.e. this is the status before first entry, and after a higher priority switch has occurred . 
_RUNNING: Behaviour is in the middle of executing some action, result still pending.
_SUCCESS: Behvaior check has passed , or execution of its action has finished with a successful result . 

The update() method must return of RUNNING,SUCCESS,FAILURE . 

9.3) Feedback Message 
Alter a feedback message when significant events occur .

9.4) Loggers 
These are used throughout the demo program . 

9.5) Composites :
You will never need to subclass or create a new composites
The three composites of library are as follows:
. Selector : select a child to execute based on cascading priorities
. Sequence : execute children sequentially 
. Parallel : execute children concurrently

9.4.1) Selector 
=> py_trees.composites.Selector(name=’Selector’, memory=False, children=None) 
A selector execute each of its child behaviors in turn one of them succeeds(itself returns RUNNING or Success or FAILURE) . 

The Selector is the decision makers . 

9.4.2) Sequence 
=> py_trees.composites.Sequence(name=’Sequence’, memory=True, children=None)
A sequence will progressively tick over each of its children  so  long as each child returns SUCCESS . If any child returns FAILURE or RUNNING the sequence will halt and the parent will adopt the result of this child . If it reaches the last child , it reurns with that result regardless . 

The Sequence are the factory lines of behavior Trees . 

9.4.3) Parallel
=> py_trees.composites.Parallel(name=<Name.AUTO_GENERATED:’AUTO_GENERATED’>, pol-
icy=<py_trees.common.ParallelPolicy.SuccessOnAllobject>, children=None)

The Parallels enable a kinf of concurrency . 

9.5) Decoraters are behavior that manage a single child and provide common modifications to their underlying child behavior . 
Decorators functionnality:
 => py_trees.decorators.Condition
 .
 .
 => py_trees.decorators.SuccessIsRunning 

9.6) Blackboards
 => py_trees.blackboard.Client(*, name=None, namespace=None)
 => py_trees.display.unicode_blackboard()
9.7) Trees 

 => py_trees.trees.BehaviourTree(root)
 Parameters root (Behaviour) – root node of the tree
Variables
• count – number of times the tree has been ticked.
• root – root node of the tree
• visitors – entities that visit traversed parts of the tree when it ticks
• pre_tick_handlers – functions that run before the entire tree is ticked
• post_tick_handlers – functions that run after the entire tree is ticked
Raises TypeError – if root variable is not an instance of Behaviour


# 5) Navigation sous behaviorTree

_ Explication de la navigation 

Revoir les status des chauque action ( chercher comment visualiser le status )
On peut voir l'état déexcution de chaque action en utilisant :
=>py_trees-tree-watcher

# 6) Detection de Aruco( done )

_ Explication de la detection 

Les  3 actions sont exécutées , comme l'arbre est en séquence tant qu'une action n'est pas excutée le tree-watcher met une croix sur l'action qui n'est pas exécutée . 

Voir comment exécuter l'arbre en seul fois ( soit command ros ou command py_trees ) . 