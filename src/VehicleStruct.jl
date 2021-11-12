abstract type  AbsTransmission end
#初级传动
struct PrimTransmission <: AbsTransmission
    drivingGear::Int
    drivenGear::Int
    name::String
end
#主轴
struct DrivingTransmission <: AbsTransmission
    firstGear::Int
    secondGear::Int
    thirdGear::Int
    fourthGear::Int
    fifthGear::Int
    sixthGear::Int
    name::String
end
#副轴
struct DrivenTransmission <: AbsTransmission
    firstGear::Int 
    secondGear::Int
    thirdGear::Int
    fourthGear::Int
    fifthGear::Int
    sixthGear::Int
    name::String
end
struct EngRatio
    ratio::Tuple
end
#大小飞轮
struct Flywheel <: AbsTransmission
    s_wheel::Int
    b_wheel::Int
    name::String
end
#发动机传动
struct Transmission <: AbsTransmission
    crankshaft::PrimTransmission
    drivingshaft::DrivingTransmission
    drivenshaft::DrivenTransmission
    flywheel::Flywheel

end


#轮周长
struct TireCircumference
    circumfeience::Float64
    name::String
end

#车速
struct VehicleSpeed
    engineName::String
    prim_ratio::Float64
    second_ratio::Vector{Float64}
    third_ratio::Float64
    circumfeience::Float64
    ca_speed::Float64
    speed::Vector{Float64}

    function VehicleSpeed(engineName,prim_ratio,second_ratio,third_ratio,circumfeience,ca_speed)
        n = length(second_ratio)
        sp = Vector{Float64}(undef,n)
        for i in 1:n
            sp[i] = ca_speed*circumfeience*60/((prim_ratio * second_ratio[i] * third_ratio)*1000)
        end
        new(engineName,prim_ratio,second_ratio,third_ratio,circumfeience,ca_speed,sp)
    end
end