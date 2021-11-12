zlsb250zhudong = PrimTransmission(18,73,"曲轴")
zlsb250zhuzhou = DrivingTransmission(11,14,16,18,20,26,"主轴")
zlsb250fuzhou = DrivenTransmission(32,25,22,21,18,21,"副轴")
zlsb250flywheel = Flywheel(14,41,"大小飞")


zlsb250chuan = Transmission(zlsb250zhudong,zlsb250zhuzhou,zlsb250fuzhou,zlsb250flywheel)

zlsb250 = vehiclespeed("ZLsb250",zlsb250chuan)

x_sl250 = 1:6
y_sl250 = zlsb250.second_ratio

