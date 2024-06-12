local player = 100  --Хп игрока
local bot = 100    --Хп бота 
local death = 0     --Смэрть 

local shot = 1      --Выстрел
local save = 2      --Укрытие
local hil  = 3      --Аптечка

local maxHealUses = 1    --Количество использований аптечек 
local hiller = 0    --Использованных аптечек на старте

local maxHealBot = 1 --Количество использовний аптечек у врага
local hillerBot = 0 --Использованных аптечек на старте

local medik = 50    --Восполнение хп
  
local leave = 2 
  
print("Приветствую тебя дорогой игрок!Меня зовут H4NTER и я являюсь начинающим разработчиком lua. Это игра, тестирование моих возможностей. Надеюсь ты будешь доволен поиграв в эту игру. Игра находиться ещё в состоянии разработки - это актуальная версия игры v.1.0")

print("1.Запустить игру 2.Не играть")
local user = io.read()
user = tonumber(user)  

if user == leave then 
    print("Жаль!Удачи тебе!") 
    os.exit(0)
end
  
while player >= death and bot >= death do 
    if player <= death then 
        print("Вы погибли")  
        break
    elseif bot <= death then 
        print("Вы победили")
        break
    end 
  
    print("1.Выстрелить  2.Спрятаться 3.Аптечка")
    local user = io.read()
    user = tonumber(user)  

    math.randomseed(os.time())
    local damage = math.random(20, 30)
        
    if user == shot then 
        print("Вы выстрелили") 
        player = bot - damage
    elseif user == save then 
        print("Вы спрятались")   
    elseif maxHealUses == hiller then 
        print("Нельзя вылечиться")
    elseif user == hil then 
        print("Вы восполнили свое здоровье") 
        player =  math.min(100, player + medik)
        hiller = hiller + maxHealUses 
    end 

    print("Ходит враг") 

    math.randomseed(os.time())
    local bots = math.random(1, 3) 

    if bots == shot then 
        print("Он выстрелил") 
        bot = player - damage 
    elseif bots == save then 
        print("Он спрятался")   
    elseif maxHealBot == hillerBot then 
        print("Он попытался вылечиться") 
    elseif bots == hil then 
        print("Он вылечился") 
        bot =  math.min(100, bot + medik) 
        hillerBot = hillerBot + maxHealBot
    end   
    print("У вас здоровья: " .. player)
    print("Здоровья у противника: " .. bot)
end