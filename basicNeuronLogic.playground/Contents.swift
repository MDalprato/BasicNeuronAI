
// Basic example of sigmoid function in action

import UIKit
import PlaygroundSupport

//https://mattmazur.com/2015/03/17/a-step-by-step-backpropagation-example/

func sigmoidFunc(input : Double) -> Double {
    return (1 / ( 1 + (pow(M_E, -input)) ))
}

func randomizeInput(inputData: Int) -> Double{
    
    let random = Int.random(in: -10...10)
    
    return (Double(inputData * random))
}


func calculateNeuron(w1: Double, i1: Double, w2: Double, i2: Double, b: Double, n: Double) -> Double{
 
    let neth1 = w1*i1 + w2*i2 + b*n
    let outh1 = sigmoidFunc(input: neth1)
    return outh1
    
}

func calculateError(target: Double, output: Double) -> Double{
    
    let targetLessOutut = (target - output)
    let output = (1/2) * (targetLessOutut * targetLessOutut)
    
    return output
}

func calculateTotalError(error1: Double, error2:Double) -> Double{
    
    return error1 + error2
    
    
}

func network(weight1:Double,weight2: Double, weight3:Double, weight4: Double, weight5:Double, weight6:Double, weight7:Double, weight8:Double,
             input1:Double, input2: Double,
             bias1:Double, neutro1: Double,
             bias2:Double, neutro2:Double,
             targetOut1: Double, targetOut2:Double) -> Double{
    
    let outH1 =   calculateNeuron(w1: weight1, i1: input1, w2: weight2, i2: input2, b: bias1, n: neutro1)
    let outH2 =   calculateNeuron(w1: weight3, i1: input1, w2: weight4, i2: input2, b: bias1, n: neutro1)
    let outHO1 =  calculateNeuron(w1: weight5, i1: outH1, w2: weight6, i2: outH2, b: bias2, n: neutro2)
    let outHO2 =  calculateNeuron(w1: weight7, i1: outH1, w2: weight8, i2: outH2, b: bias2, n: neutro2)
    let errorO1 = calculateError(target: targetOut1, output: outHO1)
    let errorO2 = calculateError(target: targetOut2, output: outHO2)
    let errorTotal = calculateTotalError(error1: errorO1, error2: errorO2)
    

    print ("outH1 = \(outH1) -- outH2 = \(outH2)")
    print ("outHO1 = \(outHO1) -- outHO2 = \(outHO2)")
    print ("errorO1 = \(errorO1) -- errorO2 = \(errorO2) -- errorTotal \(errorTotal)")

    return errorTotal
}

func chainRule(){
    
    
}

func main(){
    
    
    let total = network(weight1: 0.15, weight2: 0.20, weight3: 0.25, weight4: 0.30,
                        weight5: 0.40, weight6: 0.45, weight7: 0.50, weight8: 0.55,
                        input1: 0.05, input2: 0.10, bias1: 0.35, neutro1: 1,
                        bias2: 0.60, neutro2: 1, targetOut1: 0.01, targetOut2: 0.99)
    
    print(total)

    
}


main()
