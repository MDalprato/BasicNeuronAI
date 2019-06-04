
// Basic example of sigmoid function in action

import UIKit
import PlaygroundSupport

let inputsData = [[0,0,1],[1,1,1],[1,0,1],[0,1,1]]
let outputsData = [0,1,1,0]

let predictionInput = [1,0,0]

func sigmoidFunc(input : Double) -> Double {
    return (1 / ( 1 + (pow(M_E, -input)) ))
}

func randomizeInput(inputData: Int) -> Double{
    
    let random = Int.random(in: -10...10)
    
    return (Double(inputData * random))
}

func neuron(input1: Int, input2: Int, input3: Int) -> Float{
    
    let random = Int.random(in: -10...10)
    
    
    let random1 = (input1 * random)
    let random2 = (input2 * random)
    let random3 = (input3 * random)

    
    let out = Float(random1 + random2 + random3)
    
    
   // print ("\(input1) * \(random1) +  \(input2) * \(random2) +  \(input3) * \(random3)")
    
    return out
    
}


func assignWeight(){
    
    for inputs in inputsData {
    
 
      let out =  neuron(input1: inputs[0], input2: inputs[1], input3: inputs[2])
        
    
        let sigmoidOut = sigmoidFunc(input: Double(out))
      
        print (sigmoidOut)
      
        
    }
    
}

func trainLoop(){

    for test in 0...3 {
        print ("--")
        assignWeight()
          print ("--")
    }
}

trainLoop()

/*
func adjustWeight() -> Double{
    
    
    let out = error * input * output * (1 - output)
    
    
}
 */


