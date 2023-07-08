pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
v_x = 0
v_y = 0
size=8
fire = false
test = false


gravity = 0.02
thrust = .1

if test then
gravity = 0
thrust = 0
end


fuel = 100


function _init()
  reset_lander()
end

function _update()
  check_reset()
  cls()
  ground()
  if not dead then
  move_l()
  update_vel()
  end
  check_dead()
  
  draw_lander()
  draw_fuel()
end

function draw_fuel()
  height = 26
  width = 10
  ul_x = 117
  ul_y = 30
  rect(
    ul_x,ul_y,
    ul_x+width,ul_y+height,
    6)  
  bar = (height-2) * fuel / 100
 -- print(bar)
  
  local bc = 11
  
  if fuel < 25 then
    bc = 8
  elseif fuel < 50 then 
    bc = 9
  elseif fuel < 75 then
    bc = 10
  end
  
  if fuel > 0 then
    rectfill(
      ul_x+1,
      ul_y+1+(height-bar-2),
      ul_x+width-1,
      ul_y+height-1,
    bc)
  end
  print("f\nu\ne\nl", 
  ul_x+4, ul_y+2,4)
end

function check_reset()
  if dead or
    lander_x < -50 or
    lander_x > 127+50 or 
    abs(lander_y) > 250 
  then
    reset_lander()
  end
end

function reset_lander()
  lander_x = 64
  lander_y = 30
  v_x = 0
  v_y = 0
  dead = false
  fuel= 100
end

function check_dead()
  if lander_y+size > 125 then
    dead=true
    lander_y=125-size
    v_x=0
    v_y=0
    fire=false
    
    --sfx(0)
  end
end

function ground()
  rectfill(
    0,125,
    127,127,
    5
  )
end

function update_vel()
  v_y += gravity
  
  fire = false
  if fuel > 0 then
	  if (btn(2)) then
	    v_y -= thrust
	    fire = true
	    fuel -= 1  
	  end
	  if (btn(0)) then
	    v_x-=.05
	    fuel -= 0.2  
	  end
	  if (btn(1)) then
	    v_x+=.05
	    fuel -= 0.2
	  end
  end

  fuel = max(0, fuel)

  print(v_y.."\n"..lander_y, 90,10)
  print(fuel)
end

function move_l()
  lander_x += v_x
  lander_y += v_y
end

function draw_lander()
  local clr = 5
  if dead then clr = 8 end

 
 if fire then
   if time() % .3 < (.3/2) then
     spr(1,lander_x,lander_y)
     spr(2,lander_x,lander_y+8)
   else
     spr(4,lander_x,lander_y)
     spr(3,lander_x,lander_y+8)
   end
 else 
	 spr(0,
	    lander_x,
	   lander_y
	 )
 end
end
__gfx__
000880000008800000c8c900008cc900000880000055555000000000000000000000000000000000000000000000000000000000000000000000000000000000
0066660000666600099989900888c89000666600005bbb5000000000000000000000000000000000000000000000000000000000000000000000000000000000
0066660000666600998c8898888c8c8900666600005bbb5000000000000000000000000000000000000000000000000000000000000000000000000000000000
0066660000666600988898899888888900666600005bbb5000000000000000000000000000000000000000000000000000000000000000000000000000000000
0066660000666600089899900898999000666600005bbb5000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c00c0000c88c00888898889899889900c89c00005bbb5000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cc00cc00cc90cc009888980098999800cc09cc0005bbb5000000000000000000000000000000000000000000000000000000000000000000000000000000000
0c0000c00c9098c080099099090090090c8909c00055555000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
112300001a37300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
