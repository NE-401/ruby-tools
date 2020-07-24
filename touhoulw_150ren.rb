print "現在の賽銭 -> "
current_m=gets.to_i
m_150r=225000

print "現在の封結晶 -> "
current_s=gets.to_i
s_150r=750

print "現在の神結晶 -> "
current_ps=gets.to_i

rem_m=(m_150r-current_m)
rem_s=(s_150r-current_s)

p "150連に必要な残り賽銭 --> "+rem_m.to_s
p "150連に必要な残り封結晶 --> "+rem_s.to_s

req_ps=(180*(rem_m/15000).floor)+(40*(((rem_m)%15000)/3000).ceil)
p "賽銭用に必要な神結晶 --> "+req_ps.to_s

req_ps_s=(500*(rem_s/50).floor)+(60*(((rem_s)%50)/5).ceil)
p "封結晶用に必要な神結晶 --> "+req_ps_s.to_s

req_f_ps=(req_ps+req_ps_s)-current_ps
p "最終的に必要となる神結晶 --> "+req_f_ps.to_s

array=[
	["10000円(3000個) * ",10000,3000],
	["4900円(1322個) * ",4900,1322],
	["2440円(632個) * ",2440,632],
	["1220円(304個) * ",1220,304],
	["610円(134個) * ",610,134],
	["120円(24個) * ",120,24]
]

money=0
array.each do |key,v1,v2|
	if req_f_ps>=0
		req=(req_f_ps/v2).floor
	else
		req=0
	end
	money+=req*v1
	req_f_ps-=req*v2
	p key+req.to_s+"個"
end

if money<0
	money=0
end

p "最小課金額 --> "+money.to_s+"円"
