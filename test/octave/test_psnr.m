% This file is used to generate the correct output data for the iqa_psnr tests.

img_1x1 = [128];
img_2x2 = [0 128 192 255];

function mse = _mse(img1, img2)
    mse = 0;
    for idx = 1:numel(img1)
	    mse = mse + ((img1(idx) - img2(idx))^2);
    end
    mse = mse/numel(img1);
endfunction

function psnr = _psnr(img1, img2)
    L = 255;
    mse = _mse(img1,img2);
    psnr = 10 * log10( (L^2)/mse );
endfunction

img_1x1
img_2x2

disp("\n1x1 Identical:");
_psnr(img_1x1,img_1x1)

disp("\n1x1 Different:");
img_1x1_mod = img_1x1 + [8];
_psnr(img_1x1,img_1x1_mod)

disp("\n2x2 Identical:");
_psnr(img_2x2,img_2x2)

disp("\n2x2 Different:");
img_2x2_mod = img_2x2;
img_2x2_mod(3) -= 19;
_psnr(img_2x2,img_2x2_mod)
