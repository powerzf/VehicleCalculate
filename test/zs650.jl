using VehicleCalculate,GLMakie
include("zlsb250.jl")
zs650zhudong = PrimTransmission(44,72,"曲轴")
zs650zhuzhou = DrivingTransmission(15,16,20,21,23,27,"主轴")
zs650fuzhou = DrivenTransmission(39,33,34,31,31,34,"副轴")
zs650flywheel = Flywheel(14,41,"大小飞")

zs650chuan = Transmission(zs650zhudong,zs650zhuzhou,zs650fuzhou,zs650flywheel)

zs650 = vehiclespeed("ZS650",zs650chuan)
zs650.second_ratio
zlsb250.second_ratio

fg = Figure(resolution = (600, 400))
ax1 = Axis(fg[1,2])
ax2 = Axis(fg[1,1])
x_zs650 = 1:6
y_zs650 = zs650.second_ratio
lines!(ax1,x_zs650,y_zs650,label = "zs650")
lines!(ax1,x_sl250,y_sl250,label = "sl250")

scatter!(ax1,x_zs650,y_zs650)
scatter!(ax1,x_sl250,y_sl250)
xb = [1,2,3,4]
yb = [4,4,4,4]
hist!(ax2,yb,direction=:x,bins = 4,offset = 0.1)
fg

h = ["$i" * "档" for i in ["一","二","三","四","五","六"]]
v = ["zs650","SL250"]
c = hcat(zs650.second_ratio,zlsb250.second_ratio)

tableplot(h,v,c,reso = (600,400))