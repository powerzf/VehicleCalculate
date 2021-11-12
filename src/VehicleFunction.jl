#初级传动比
function primGear_ratio(transm::PrimTransmission)
    drivenGear = transm.drivenGear  #离合器主动齿
    drivingGear = transm.drivingGear  #离合器从动齿
    return drivenGear/drivingGear  #初级传动比
end

#一档传动比
function firstGear_ratio(B::DrivenTransmission,A::DrivingTransmission)
    drivingGear = A.firstGear #主轴一档齿
    drivenGear = B.firstGear  #副轴一档齿
    return drivenGear/drivingGear  #一档传动比
end
#二档传动比
function secondGear_ratio(B::DrivenTransmission,A::DrivingTransmission)
    drivingGear = A.secondGear #主轴二档齿
    drivenGear = B.secondGear  #副轴二档齿
    return drivenGear/drivingGear  #二档传动比
end
#三档传动比
function thirdGear_ratio(B::DrivenTransmission,A::DrivingTransmission)
    drivingGear = A.thirdGear #主轴三档齿
    drivenGear = B.thirdGear  #副轴三档齿
    return drivenGear/drivingGear  #三档传动比
end
#四档传动比
function fourthGear_ratio(B::DrivenTransmission,A::DrivingTransmission)
    drivingGear = A.fourthGear #主轴四档齿
    drivenGear = B.fourthGear  #副轴四档齿
    return drivenGear/drivingGear  #四档传动比
end
#五档传动比
function fifthGear_ratio(B::DrivenTransmission,A::DrivingTransmission)
    drivingGear = A.fifthGear #主轴五档齿
    drivenGear = B.fifthGear  #副轴五档齿
    return drivenGear/drivingGear  #五档传动比
end
#六档传动比
function sixthGear_ratio(B::DrivenTransmission,A::DrivingTransmission)
    drivingGear = A.sixthGear #主轴六档齿
    drivenGear = B.sixthGear  #副轴六档齿
    return drivenGear/drivingGear  #六档传动比
end

#三级传动比计算
function wheel_ratio(wheel::Flywheel)
    return wheel.b_wheel/wheel.s_wheel
    
end

#发动机传动比
function vehiclespeed(enginename::String,ratio::Transmission; ca_speed = 7500, circumfeience = 1.97)
    ca_drvingGear = ratio.crankshaft.drivingGear
    ca_drvengGear = ratio.crankshaft.drivenGear

    drving_1_Gear = ratio.drivingshaft.firstGear
    drving_2_Gear = ratio.drivingshaft.secondGear
    drving_3_Gear = ratio.drivingshaft.thirdGear
    drving_4_Gear = ratio.drivingshaft.fourthGear
    drving_5_Gear = ratio.drivingshaft.fifthGear
    drving_6_Gear = ratio.drivingshaft.sixthGear

    drven_1_Gear = ratio.drivenshaft.firstGear
    drven_2_Gear = ratio.drivenshaft.secondGear
    drven_3_Gear = ratio.drivenshaft.thirdGear
    drven_4_Gear = ratio.drivenshaft.fourthGear
    drven_5_Gear = ratio.drivenshaft.fifthGear
    drven_6_Gear = ratio.drivenshaft.sixthGear


    primgearRatio =primGear_ratio(ratio.crankshaft)
    thirdgearRatio = wheel_ratio(ratio.flywheel)
    gear_1_ratio = firstGear_ratio(ratio.drivenshaft,ratio.drivingshaft)
    gear_2_ratio = secondGear_ratio(ratio.drivenshaft,ratio.drivingshaft)
    gear_3_ratio = thirdGear_ratio(ratio.drivenshaft,ratio.drivingshaft)
    gear_4_ratio = fourthGear_ratio(ratio.drivenshaft,ratio.drivingshaft)
    gear_5_ratio = fifthGear_ratio(ratio.drivenshaft,ratio.drivingshaft)
    gear_6_ratio = sixthGear_ratio(ratio.drivenshaft,ratio.drivingshaft)


    return VehicleSpeed(enginename,primgearRatio,[gear_1_ratio,gear_2_ratio,gear_3_ratio,gear_4_ratio,gear_5_ratio,gear_6_ratio],thirdgearRatio,circumfeience,ca_speed)

    
end