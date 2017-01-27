; a code to pull a set of pixels from susan's RHT slice repository

n = 10000

data = fltarr(21, 165, n)

;xpos = randomu(seed, n)*21600
;ypos = randomu(seed, n)*2432

xx = rebin(reform(findgen(100), 100, 1), 100, 100)
yy = rebin(reform(findgen(100), 1, 100), 100, 100)


xpos = 10000+xx
ypos = 500+yy

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

mwrfits, data, 'RHT2D_100x100.fits'
save, xpos, ypos, f='RHT2D_100x100XY.sav'


end