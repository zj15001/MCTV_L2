# MCTV_L2
MRI reconstruction via non-convex total variation regularization 

The demos implement the experiments given in the paper "Magnetic Resonance Imaging reconstruction via non-convex total variation regularization (MCTV_L2)".

After unzipping the supplementary file, please add all sub-directories into your MATLAB paths.

- 'main.m' give a simple example to illustrate the efficiency of MCTV_L2.

- 'rec_mctv2' and 'shrink_mctv2_1' are the main part of MCTV_L2.

- 'rec_mctv' and 'shrink_mctv' are from paper "Convex MR brain image reconstruction via non-convex total variation minimization" by Liu et.al..

- 'mask_radial.m' is used to generate radial sampling templates. Template size and number of trajectory lines can be chosen.

- 'mask_random.m' is used to generate random sampling templates. `genPDF.m` and `gengenSampling.m` are subroutines of `mask_random.m` (© 2007 Michael Lustig). Template size, sampling radius and sampling rate can be chosen.

- 'mask_Cartesian.m' is used to generate Cartesian templates. Template size and number of readout lines can be chosen.

Constacts: zoujian@yangtzeu.edu.cn
