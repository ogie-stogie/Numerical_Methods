function density = ceriaWaterDensity(unitCellVolume,molesWater)

mass = molesWater/(6.022*10^23)*18/1000;
unitCellVolume = unitCellVolume*(10^-10)^3;
density = mass/unitCellVolume;
end
