import TaskManagerLib

print("Exercice 3: Problème du réseau de pétri")

let taskManager = createTaskManager()

// Show here an example of sequence that leads to the described problem.
// For instance:
//     let m1 = create.fire(from: [taskPool: 0, processPool: 0, inProgress: 0])
//     let m2 = spawn.fire(from: m1!)
//     ...
let create = taskManager.transitions.filter{$0.name == "create"}[0]
let spawn = taskManager.transitions.filter{$0.name == "spawn"}[0]
let exec = taskManager.transitions.filter{$0.name == "exec"}[0]
let success = taskManager.transitions.filter{$0.name == "success"}[0]
let fail = taskManager.transitions.filter{$0.name == "fail"}[0]

let taskPool = taskManager.places.filter{$0.name == "taskPool"}[0]
let processPool = taskManager.places.filter{$0.name == "processPool"}[0]
let inProgress = taskManager.places.filter{$0.name == "inProgress"}[0]

let m1 = create.fire(from: [taskPool: 0, processPool: 0, inProgress: 0])
print("m1 (create) ",m1!)
let m2 = spawn.fire(from: m1!)
print("m2 (spawn) ",m2!)
let m3 = spawn.fire(from: m2!)
print("m3 (spawn)",m3!)
let m4 = exec.fire(from: m3!)
print("m4 (exec) ",m4!)
let m5 = exec.fire(from: m4!)
print("m5 (exec)",m5!)
let m6 = success.fire(from: m5!)
print("m6 (success) ",m6!)
let m7 = fail.fire(from: m5!)
print("m6 (fail) ",m7!)

print("Exercice 4: Correct TaskManager")
let correctTaskManager = createCorrectTaskManager()

// Show here that you corrected the problem.
// For instance:
//     let m1 = create.fire(from: [taskPool: 0, processPool: 0, inProgress: 0])
//     let m2 = spawn.fire(from: m1!)
//     ...
let create2 = correctTaskManager.transitions.filter{$0.name == "create"}[0]
let spawn2 = correctTaskManager.transitions.filter{$0.name == "spawn"}[0]
let exec2 = correctTaskManager.transitions.filter{$0.name == "exec"}[0]
let success2 = correctTaskManager.transitions.filter{$0.name == "success"}[0]
let fail2 = correctTaskManager.transitions.filter{$0.name == "fail"}[0]

let taskPool2 = correctTaskManager.places.filter{$0.name == "taskPool"}[0]
let processPool2 = correctTaskManager.places.filter{$0.name == "processPool"}[0]
let inProgress2 = correctTaskManager.places.filter{$0.name == "inProgress"}[0]
let complement = correctTaskManager.places.filter{$0.name == "complement"}[0]

let m21 = create2.fire(from: [taskPool2: 0, processPool2: 0, inProgress2: 0, complement: 0])
print("m1 (create) ",m21!)
let m22 = spawn2.fire(from: m21!)
print("m2 (spawn) ",m22!)
let m23 = spawn2.fire(from: m22!)
print("m3 (spawn)",m23!)
let m24 = exec2.fire(from: m23!)
print("m4 (exec) ",m24!)
let m25 = success2.fire(from: m24!)
print("m5 (success) ",m25!)
let m27 = fail2.fire(from: m24!)
print("m5 (fail) ",m27!)
