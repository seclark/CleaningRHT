; a code to pull a set of pixels from susan's RHT slice repository

n = 10000

data = fltarr(21, 165, n)

xpos = randomu(seed, n)*21600
ypos = randomu(seed, n)*2432

z0 = 974
initial = string(findgen(21)*5+974, f='(I4.4)')
final = string(findgen(21)*5+974+4, f='(I4.4)')
znames = initial + '_' + final

for i=0, 20 do begin
	for j=0, 164 do begin
		thetaname = strcompress(string(j, f='(I)'), /rem)
		fn = '~/susan/Wide_maps/single_theta_maps/S' + znames[i] + '/GALFA*' + thetaname + '.fits'
		img = readfits(fn)
		data[i, j, *] = img[xpos,ypos]
	endfor
endfor

mwrfits, data, 'RHT2D_random.fits'
save, xpos, ypos, 'RHT2D_randomXY.sav'


end