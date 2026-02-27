**DATA CLEANING

*appending district names into the firm level datasets for 2005 data

use "/Users/vishakhasingla/Desktop/LSE/term 1 /Quant Econ (EC475)/Thesis/rawdata/SMEdata/So lieu DN 2005_Final_clean.dta", clear


import excel "/Users/vishakhasingla/Downloads/Vietnam_District_Codes_from_chat_snippet.xlsx", sheet("District_Codes") firstrow clear

rename district_code_2004 district_code
save "district_codes_2004.dta", replace

use "So lieu DN 2005_Final_clean.dta", clear
describe q3bd_05
rename q3bd_05 district_code

merge m:1 district_code using "district_codes_2004.dta"

**Result                      Number of obs
  **  -----------------------------------------
  **  Not matched                           597
  **      from master                         4  (_merge==1)
  **      from using                        593  (_merge==2)
**
  ** Matched                             2,815  (_merge==3)
  ** -----------------------------------------

list district_code if _merge==1
drop if _merge==1

save "2005_mergeddata.dta", replace

**2005 dataset cleaning- this data is from 2004

use "/Users/vishakhasingla/Desktop/LSE/term 1 /Quant Econ (EC475)/Thesis/rawdata/SMEdata/So lieu DN 2005_Final_clean.dta", clear

keep Eq1a03 Eq1b03 Eq1c03 Eq1d03 Eq1e03 Eq1f03 Eq1g03 Eq1h03 Eq1i03 Eq1j03 Eq1k03 Eq1l03 Eq1m03 Eq1n03 Eq1p03 Eq1q03 Eq1r03 Eq1s03 Eq1t03 Eq1u03 Eq1v03 Eq1a04 Eq1b04 Eq1c04 Eq1d04 Eq1e04 Eq1f04 Eq1g04 Eq1h04 Eq1i04 Eq1j04 Eq1k04 Eq1l04 Eq1n04 Eq1o04 Eq1p04 Eq1q04 Eq1r04 Eq1s04 Eq1t04 Eq1u04 Eq1v04 q1_05 q3bd_05 q3be_05 q6aa_05 q6ab_05 q7c_05 q8_05 q13_05 q13_4ds_05 q16d_05 q72a_05 q72b_05 q72c_05 q72d_05 q72e_05 q72f_05 q72g_05 q72h_05 q72i_05 q79a_05 q79b_05 q79c_05 q79d_05 q79e_05 q79f_05 q79g_05 q79h_05 q79i_05 q79j_05 q80ma_05 q80mb_05 q80mba_05 q80mbb_05 q80mbc_05 q80mbd_05 q80mc_05 q80md_05 q80me_05 q80mf_05 q80mfa_05 q80mfb_05 q80mfc_05 q80mfd_05 q80mfe_05 q80mff_05 q80mfg_05 q80mg_05 q80wa_05 q80wb_05 q80wba_05 q80wbb_05 q80wbc_05 q80wbd_05 q80wc_05 q80wd_05 q80we_05 q80wf_05 q80wfa_05 q80wfb_05 q80wfc_05 q80wfd_05 q80wfe_05 q80wff_05 q80wfg_05 q80wg_05

save "2005_cleaned.dta", replace

* cleaning further

use "2005_cleaned.dta", clear

rename Eq1a04 revenue
rename Eq1b04 output
rename Eq1v04 labour
rename Eq1p04 capital
rename Eq1e04 raw_mat
rename q1_05 firm_id
rename q3bd_05 district_id
rename q8_05 firm_status
rename q3be_05 province 
rename q6ab_05 year_firmstarted
rename q13_05 sector
rename q13_4ds_05 sector_id
gen skillshare=(q80ma_05+q80mb_05+q80wa_05+q80wb_05)/q79a_05
rename q79a_05 total_labourforce
gen year=2004

keep revenue output raw_mat labour firm_id district_id province year_firmstarted firm_status sector sector_id total_labourforce skillshare capital year

save "2005_cleaned.dta", replace

**2007 dataset cleaning- this data is from 2006

use "/Users/vishakhasingla/Desktop/LSE/term 1 /Quant Econ (EC475)/Thesis/rawdata/SMEdata/So lieu DN 2007_Final_clean.dta", replace

keep Eq1a05 Eq1b05 Eq1c05 Eq1d05 Eq1e05 Eq1f05 Eq1g05 Eq1i05 Eq1j05 Eq1k05 Eq1l05 Eq1m05 Eq1n05 Eq1o05 Eq1p05 Eq1q05 Eq1r05 Eq1s05 Eq1t05 Eq1u05 Eq1v05 Eq1x05 Eq1a05 Eq1b05 Eq1c05 Eq1d05 Eq1e05 Eq1f05 Eq1g05 Eq1i05 Eq1j05 Eq1k05 Eq1l05 Eq1m05 Eq1n05 Eq1o05 Eq1p05 Eq1q05 Eq1r05 Eq1s05 Eq1t05 Eq1u05 Eq1v05 Eq1x05 Eq1a06 Eq1b06 Eq1c06 Eq1d06 Eq1e06 Eq1f06 Eq1g06 Eq1i06 Eq1j06 Eq1k06 Eq1l06 Eq1m06 Eq1o06 Eq1p06 Eq1q06 Eq1r06 Eq1s06 Eq1t06 Eq1u06 Eq1v06 Eq1x06 q1_07 district province q6a_07 q8_07 q17a_07 q17a_4ds_07 q6a_07 q8_07 q17a_07 q17a_4ds_07 q68b_07 q72_07 q73at_07 q73ct_07 q73af_07 q73bt_07 q73cat_07 q73dt_07 q74ta_07 q74tb_07 q74tc_07 q74td_07 q74te_07 q74tf_07

save "2007_cleaned.dta", replace

* cleaning further

use "2007_cleaned.dta", clear

rename Eq1a06 revenue
rename Eq1b06 output
rename Eq1x06 labour
rename Eq1q06 capital
rename Eq1e06 raw_mat
rename q1_07 firm_id
rename district district_id
rename q8_07 firm_status
rename q6a_07 year_firmstarted
rename q17a_07 sector
rename q17a_4ds_07 sector_id
gen skillshare= q74ta_07+ q74tb_07
rename q73at_07 total_labourforce
gen year=2006

keep revenue output raw_mat labour firm_id district_id province year_firmstarted firm_status sector sector_id total_labourforce skillshare capital year

save "2007_cleaned.dta", replace

**2009 dataset cleaning-this data is from 2008

use "/Users/vishakhasingla/Desktop/LSE/term 1 /Quant Econ (EC475)/Thesis/rawdata/SMEdata/So lieu DN 2009_Final_clean.dta"

keep EAq1a07 EAq1b07 EAq1c07 EAq1d07 EAq1e07 EAq1f07 EAq1g07 EAq1i07 EAq1j07 EAq1k07 EAq1l07 EAq1m07 EAq1n07 EAq1o07 EAq1p07 EAq1q07 EAq1r07 EAq1s07 EAq1t07 EAq1u07 EAq1v07 EAq1x07 EAq1a08 EAq1b08 EAq1c08 EAq1d08 EAq1e08 EAq1f08 EAq1g08 EAq1i08 EAq1j08 EAq1k08 EAq1l08 EAq1m08 EAq1n08 EAq1o08 EAq1p08 EAq1q08 EAq1r08 EAq1s08 EAq1t08 EAq1u08 EAq1v08 EAq1x08 EAq1a09 EAq1b09 EAq1c09 EAq1d09 EAq1e09 EAq1f09 EAq1g09 EAq1j09 EAq1k09 EAq1l09 EAq1m09 EAq1n09 EAq1o09 EAq1p09 EAq1q09 EAq1r09 EAq1s09 EAq1t09 EAq1u09 EAq1v09 q1_09 q3bd_09 q3be_09 q6a_09 q8_09 q17a_09 q17a_4ds_09 q68ab_09 q72_09 q73_09 q73a_09 q73b_09 q73b1_09 q73c_09 q73d_09 q73e_09 q74a_09 q74b_09 q74c_09 q74d_09 q74e_09 q74f_09 q74fa_09 q74g_09 q74w_09

save "2009_cleaned.dta", replace

* cleaning further

use "2009_cleaned.dta", clear

rename EAq1a08 revenue
rename EAq1b08 output
rename EAq1x08 labour
rename EAq1q08 capital
rename EAq1e08 raw_mat
rename q1_09 firm_id
rename q3bd_09 district_id
rename q8_09 firm_status
rename q6a_09 year_firmstarted
rename q17a_09 sector
rename q3be_09 province
rename q17a_4ds_09 sector_id
gen skillshare= q74a_09 + q74b_09
rename q73_09 total_labourforce
gen year=2008

keep revenue output raw_mat labour firm_id district_id province year_firmstarted firm_status sector sector_id total_labourforce skillshare capital year

save "2009_cleaned.dta", replace

**2011 dataset cleaning- this data is from 2010

use "/Users/vishakhasingla/Desktop/LSE/term 1 /Quant Econ (EC475)/Thesis/rawdata/SMEdata/So lieu DN 2011_Final_clean.dta"

keep EAq1a09 EAq1b09 EAq1c09 EAq1d09 EAq1e09 EAq1f09 EAq1g09 EAq1i09 EAq1j09 EAq1k09 EAq1l09 EAq1m09 EAq1n09 EAq1o09 EAq1p09 EAq1q09 EAq1r09 EAq1s09 EAq1t09 EAq1u09 EAq1v09 EAq1x09 EAq1a10 EAq1b10 EAq1c10 EAq1d10 EAq1e10 EAq1f10 EAq1g10 EAq1i10 EAq1j10 EAq1k10 EAq1l10 EAq1m10 EAq1n10 EAq1o10 EAq1p10 EAq1q10 EAq1r10 EAq1s10 EAq1t10 EAq1u10 EAq1v10 EAq1x10 q1_11 q3bd_11 q3bd1_11 q3be_11 q6a_11 q8_11 q17a_11 q17a_4ds_11 q100_11 q101aaa_11 q101a1_11 q101abt_11 q101b_11 q101a2_11 q101a4_11 q101c_11 q101da_11 q101db_11 q101dc_11 q101dd_11 q102a_11 q102bx_11 q102cx_11 q102d_11 q102e_11 q102f_11 q102g_11 q102w_11 q102ta_11 q102tb_11 q102tba_11 q102tbb_11 q102tbc_11 q102tbd_11 q102tc_11 q102td_11 q102te_11 q102tf_11 q102tfa_11 q102tfb_11 q102tfc_11 q102tfd_11 q102tfe_11 q102tff_11 q102tg_11

save "2011_cleaned.dta", replace

* cleaning further

use "2011_cleaned.dta", clear

rename EAq1a10 revenue
rename EAq1b10 output
rename EAq1x10 labour
rename EAq1q10 capital
rename EAq1e10 raw_mat
rename q1_11 firm_id
rename q3bd1_11 district_id
rename q8_11 firm_status
rename q3be_11 province 
rename q6a_11 year_firmstarted
rename q17a_11 sector
rename q17a_4ds_11 sector_id
gen skillshare= q102a_11 + q102bx_11
rename q101a1_11 total_labourforce
gen year=2010

keep revenue output raw_mat labour firm_id district_id province year_firmstarted firm_status sector sector_id total_labourforce skillshare capital year

save "2011_cleaned.dta", replace


**2013 dataset cleaning- this data is from 2012

use "/Users/vishakhasingla/Desktop/LSE/term 1 /Quant Econ (EC475)/Thesis/rawdata/SMEdata/So lieu DN 2013_Final_clean.dta", clear

keep EAq1a11 EAq1b11 EAq1c11 EAq1d11 EAq1e11 EAq1f11 EAq1g11 EAq1i11 EAq1j11 EAq1k11 EAq1l11 EAq1m11 EAq1n11 EAq1o11 EAq1p11 EAq1q11 EAq1r11 EAq1s11 EAq1t11 EAq1u11 EAq1v11 EAq1x11 EAq1a12 EAq1b12 EAq1c12 EAq1d12 EAq1e12 EAq1f12 EAq1g12 EAq1i12 EAq1j12 EAq1k12 EAq1l12 EAq1m12 EAq1n12 EAq1o12 EAq1p12 EAq1q12 EAq1r12 EAq1s12 EAq1a11 EAq1b11 EAq1c11 EAq1d11 EAq1e11 EAq1f11 EAq1g11 EAq1i11 EAq1j11 EAq1k11 EAq1l11 EAq1m11 EAq1n11 EAq1o11 EAq1p11 EAq1q11 EAq1r11 EAq1s11 EAq1t11 EAq1u11 EAq1v11 EAq1x11 EAq1a12 EAq1b12 EAq1c12 EAq1d12 EAq1e12 EAq1f12 EAq1g12 EAq1i12 EAq1j12 EAq1k12 EAq1l12 EAq1m12 EAq1n12 EAq1o12 EAq1p12 EAq1q12 EAq1r12 EAq1s12 EAq1t12 EAq1u12 EAq1v12 EAq1x12 q1_13 q3bd_13 q3bd1_13 q3be_13 q6a_13 q8_13 q17a_4ds_13 q17a_13 q100_13 q101aaa_13 q101a1_13 q101abt_13 q101b_13 q101a2_13 q101a3_13 q101a4_13 q101a5_13 q101f2_13 q101f2_13s q101c_13 q101da_13 q101db_13 q101dc_13 q101dd_13 contract3M_13 q101e_13 q102a_13 q102bx_13 q102cx_13 q102d_13 q102e_13 q102f_13 q102g_13 q102ta_13 q102tb_13 q102tba_13 q102tbb_13 q102tbc_13 q102tbd_13 q102tc_13 q102td_13 q102te_13 q102tf_13 q102tfa_13 q102tfb_13 q102tfc_13 q102tfd_13 q102tfe_13 q102tff_13 q102tg_13

save "2013_cleaned.dta", replace

* cleaning further

use "2013_cleaned.dta", clear

rename EAq1a12 revenue
rename EAq1b12 output
rename EAq1x12 labour
rename EAq1q12 capital
rename EAq1e12 raw_mat
rename q1_13 firm_id
rename q3bd1_13 district_id
rename q8_13 firm_status
rename q3be_13 province 
rename q6a_13 year_firmstarted
rename q17a_13 sector
rename q17a_4ds_13 sector_id
gen skillshare= q102a_13 + q102bx_13
rename q101a1_13 total_labourforce
gen year=2012

keep revenue output raw_mat labour firm_id district_id province year_firmstarted firm_status sector sector_id total_labourforce skillshare capital year

save "2013_cleaned.dta", replace


**2015 dataset cleaning- this data is from 2014

use "/Users/vishakhasingla/Desktop/LSE/term 1 /Quant Econ (EC475)/Thesis/rawdata/SMEdata/So lieu DN 2015_Final_clean.dta", clear

keep EAq1a13 EAq1b13 EAq1c13 EAq1d13 EAq1e13 EAq1f13 EAq1g13 EAq1h13 EAq1i13 EAq1j13 EAq1k13 EAq1a14 EAq1b14 EAq1c14 EAq1c14 EAq1d14 EAq1e14 EAq1f14 EAq1g14 EAq1h14 EAq1i14 EAq1j14 EAq1k14 q1_15 q3cd_15 q3cd1_15 q3ce1_15 q3ce_15 q6a_15 q8_15 q17a_4ds_15 q17a_15 allrm allrm q86ab_15 q90at_15 q90aat_15 q90aaat_15 q90aabt_15 q90abt_15 q90b_sh_15 q90aat_sh_15 q90aaat_sh_15 q90aabt_sh_15 q90abt_sh_15 q90af_15 q90af_sh_15 q90c_15 q90da_15 q90db_15 q90dc_15 q90dd_15 contract3M_15 q91a_sh_15 q91b_sh_15 q91c_sh_15 q91d_sh_15 q91e_sh_15 q91f_sh_15 q91fa_sh_15 q91g_sh_15 q91w_sh_15 q91ta_15 q91tb_15 q91tc_15 q91td_15 q91te_15 q91tf_15 q91tfa_15 q91tg_15

save "2015_cleaned.dta", replace

* cleaning further

use "2015_cleaned.dta", clear

rename EAq1a14 revenue
rename EAq1c14 output
rename EAq1k14 labour
rename EAq1h14 capital
rename EAq1b14 raw_mat
rename q1_15 firm_id
rename q3cd1_15 district_id
rename q8_15 firm_status
rename q3ce_15 province 
rename q6a_15 year_firmstarted
rename q17a_15 sector
rename q17a_4ds_15 sector_id
gen skillshare= q91a_sh_15 + q91b_sh_15
rename q90at_15 total_labourforce
gen year=2014

keep revenue output raw_mat labour firm_id district_id province year_firmstarted firm_status sector sector_id total_labourforce skillshare capital year

encode province, gen(prov_num) label(q3be_05)
drop province
rename prov_num province
recast byte province

save "2015_cleaned.dta", replace

** Appending all firm data 2005-2015

use "2005_cleaned.dta", clear
append using "2007_cleaned.dta"
append using "2009_cleaned.dta"
append using "2011_cleaned.dta"
append using "2013_cleaned.dta"
append using "2015_cleaned.dta"

order year, after(firm_id)
save "firmdata_appended.dta", replace

** data cleaning on appended data

use "firmdata_appended.dta", clear

*dropping 0 value observations
drop if output<2500
drop if revenue<2500
drop if raw_mat<1
drop if capital<200
drop if labour<1
tab labour, nolabel
drop if labour == 98 | labour == 99
 tab firm_id if missing(firm_id)
 tab district_id if missing(district_id)
 tab district_id if missing(district_id)
 tab year_firmstarted if missing(year_firmstarted)
 tab sector_id if missing(sector_id)
 tab total_labourforce if missing(total_labourforce)
 tab skillshare if missing(skillshare)
 
sort firm_id year
save "firmdata_appended.dta", replace

**appending district names in the final firm-level data

*district code-name dataset
use "/Users/vishakhasingla/Desktop/LSE/term 1 /Quant Econ (EC475)/Thesis/rawdata/SMEdata/district_codes_2004.dta", clear
rename district_code district_id
save "district_names.dta", replace

*appending
use "firmdata_appended.dta", clear

merge m:1 district_id using "district_names.dta"
drop if _merge==1
drop if _merge==2

*manually homogenising district names- WOW THAT WAS A PAIN IN THE ASS
replace district_name_2004 = "DongDa" if district_name_2004 == "Quận Đống Đa"
replace district_name_2004 = "ThanhXuan" if district_name_2004 == "Quận Thanh Xuân"
replace district_name_2004 = "UngHoa" if district_name_2004 == "Huyện Ứng Hòa"
replace district_name_2004 = "LongBien" if district_name_2004 == "Quận Long Biên"
replace district_name_2004 = "HaiBaTrung" if district_name_2004 == "Quận Hai Bà Trưng"
replace district_name_2004 = "BaDinh" if district_name_2004 == "Quận Ba Đình"
replace district_name_2004 = "TayHo" if district_name_2004 == "Quận Tây Hồ"
replace district_name_2004 = "AnDuong" if district_name_2004 == "Huyện An Dương"
replace district_name_2004 = "AnLao" if district_name_2004 == "Huyện An Lão"
replace district_name_2004 = "AnhSon" if district_name_2004 == "Huyện Anh Sơn"
replace district_name_2004 = "BaVi" if district_name_2004 == "Huyện Ba Vì"
replace district_name_2004 = "BinhChanh" if district_name_2004 == "Huyện Bình Chánh"
replace district_name_2004 = "BinhGia" if district_name_2004 == "Huyện Bình Gia"
replace district_name_2004 = "BaoLam" if district_name_2004 == "Huyện Bảo Lâm"
replace district_name_2004 = "BenCau" if district_name_2004 == "Huyện Bến Cầu"
replace district_name_2004 = "BenLuc" if district_name_2004 == "Huyện Bến Lức"
replace district_name_2004 = "ChauThanh" if district_name_2004 == "Huyện Châu Thành"
replace district_name_2004 = "ConCuong" if district_name_2004 == "Huyện Con Cuông"
replace district_name_2004 = "CatTien" if district_name_2004 == "Huyện Cát Tiên"
replace district_name_2004 = "CuChi" if district_name_2004 == "Huyện Củ Chi"
replace district_name_2004 = "DiLinh" if district_name_2004 == "Huyện Di Linh"
replace district_name_2004 = "DienKhanh" if district_name_2004 == "Huyện Diên Khánh"
replace district_name_2004 = "DuyXuyen" if district_name_2004 == "Huyện Duy Xuyên"
replace district_name_2004 = "GiaLam" if district_name_2004 == "Huyện Gia Lâm"
replace district_name_2004 = "HiepHoa" if district_name_2004 == "Huyện Hiệp Hòa"
replace district_name_2004 = "HoaiDuc" if district_name_2004 == "Huyện Hoài Đức"
replace district_name_2004 = "HocMon" if district_name_2004 == "Huyện Hóc Môn"
replace district_name_2004 = "HungNguyen" if district_name_2004 == "Huyện Hưng Nguyên"
replace district_name_2004 = "HaHoa" if district_name_2004 == "Huyện Hạ Hoà"
replace district_name_2004 = "KienThuy" if district_name_2004 == "Huyện Kiến Thuỵ"
replace district_name_2004 = "KySon" if district_name_2004 == "Huyện Kỳ Sơn"
replace district_name_2004 = "LamThao" if district_name_2004 == "Huyện Lâm Thao"
replace district_name_2004 = "LucNam" if district_name_2004 == "Huyện Lục Nam"
replace district_name_2004 = "MuongLat" if district_name_2004 == "Huyện Mường Lát"
replace district_name_2004 = "MyDuc" if district_name_2004 == "Huyện Mỹ Đức"
replace district_name_2004 = "NamGiang" if district_name_2004 == "Huyện Nam Giang"
replace district_name_2004 = "NamDan" if district_name_2004 == "Huyện Nam Đàn"
replace district_name_2004 = "NghiLoc" if district_name_2004 == "Huyện Nghi Lộc"
replace district_name_2004 = "NghiaDan" if district_name_2004 == "Huyện Nghĩa Đàn"
replace district_name_2004 = "NhaBe" if district_name_2004 == "Huyện Nhà Bè"
replace district_name_2004 = "NinhHoa" if district_name_2004 == "Huyện Ninh Hòa"
replace district_name_2004 = "NinhPhuoc" if district_name_2004 == "Huyện Ninh Phước"
replace district_name_2004 = "NongCong" if district_name_2004 == "Huyện Nông Cống"
replace district_name_2004 = "NuiThanh" if district_name_2004 == "Huyện Núi Thành"
replace district_name_2004 = "PhuNinh" if district_name_2004 == "Huyện Phù Ninh"
replace district_name_2004 = "PhuQui" if district_name_2004 == "Huyện Phú Quí"
replace district_name_2004 = "PhucHoa" if district_name_2004 == "Huyện Phục Hoà"
replace district_name_2004 = "PacNam" if district_name_2004 == "Huyện Pác Nặm"
replace district_name_2004 = "QuangUyen" if district_name_2004 == "Huyện Quảng Uyên"
replace district_name_2004 = "QuangXuong" if district_name_2004 == "Huyện Quảng Xương"
replace district_name_2004 = "QuePhong" if district_name_2004 == "Huyện Quế Phong"
replace district_name_2004 = "QuocOai" if district_name_2004 == "Huyện Quốc Oai"
replace district_name_2004 = "QuyChau" if district_name_2004 == "Huyện Quỳ Châu"
replace district_name_2004 = "ThanhBa" if district_name_2004 == "Huyện Thanh Ba"
replace district_name_2004 = "ThanhOai" if district_name_2004 == "Huyện Thanh Oai"
replace district_name_2004 = "ThanhTri" if district_name_2004 == "Huyện Thanh Trì"
replace district_name_2004 = "ThuyNguyen" if district_name_2004 == "Huyện Thuỷ Nguyên"
replace district_name_2004 = "ThuongTin" if district_name_2004 == "Huyện Thường Tín"
replace district_name_2004 = "ThachThat" if district_name_2004 == "Huyện Thạch Thất"
replace district_name_2004 = "ThuThua" if district_name_2004 == "Huyện Thủ Thừa"
replace district_name_2004 = "TanhLinh" if district_name_2004 == "Huyện Tánh Linh"
replace district_name_2004 = "TanHung" if district_name_2004 == "Huyện Tân Hưng"
replace district_name_2004 = "TanKy" if district_name_2004 == "Huyện Tân Kỳ"
replace district_name_2004 = "TayGiang" if district_name_2004 == "Huyện Tây Giang"
replace district_name_2004 = "TuongDuong" if district_name_2004 == "Huyện Tương Dương"
replace district_name_2004 = "VanNinh" if district_name_2004 == "Huyện Vạn Ninh"
replace district_name_2004 = "YenThanh" if district_name_2004 == "Huyện Yên Thành"
replace district_name_2004 = "DanPhuong" if district_name_2004 == "Huyện Đan Phượng"
replace district_name_2004 = "DienBan" if district_name_2004 == "Huyện Điện Bàn"
replace district_name_2004 = "DoLuong" if district_name_2004 == "Huyện Đô Lương"
replace district_name_2004 = "DonDuong" if district_name_2004 == "Huyện Đơn Dương"
replace district_name_2004 = "DaiLoc" if district_name_2004 == "Huyện Đại Lộc"
replace district_name_2004 = "DucHoa" if district_name_2004 == "Huyện Đức Hòa"
replace district_name_2004 = "DucTrong" if district_name_2004 == "Huyện Đức Trọng"
replace district_name_2004 = "LongBien" if district_name_2004 == "Huyện Long Biên"
replace district_name_2004 = "District1" if district_name_2004 == "Quận 1"
replace district_name_2004 = "District10" if district_name_2004 == "Quận 10"
replace district_name_2004 = "District11" if district_name_2004 == "Quận 11"
replace district_name_2004 = "District12" if district_name_2004 == "Quận 12"
replace district_name_2004 = "District2" if district_name_2004 == "Quận 2"
replace district_name_2004 = "District3" if district_name_2004 == "Quận 3"
replace district_name_2004 = "District4" if district_name_2004 == "Quận 4"
replace district_name_2004 = "District5" if district_name_2004 == "Quận 5"
replace district_name_2004 = "District6" if district_name_2004 == "Quận 6"
replace district_name_2004 = "District7" if district_name_2004 == "Quận 7"
replace district_name_2004 = "District8" if district_name_2004 == "Quận 8"
replace district_name_2004 = "BinhThanh" if district_name_2004 == "Quận Bình Thạnh"
replace district_name_2004 = "BinhTan" if district_name_2004 == "Quận Bình Tân"
replace district_name_2004 = "CauGiay" if district_name_2004 == "Quận Cầu Giấy"
replace district_name_2004 = "GoVap" if district_name_2004 == "Quận Gò Vấp"
replace district_name_2004 = "HoanKiem" if district_name_2004 == "Quận Hoàn Kiếm"
replace district_name_2004 = "HoangMai" if district_name_2004 == "Quận Hoàng Mai"
replace district_name_2004 = "HaiAn" if district_name_2004 == "Quận Hải An"
replace district_name_2004 = "HongBang" if district_name_2004 == "Quận Hồng Bàng"
replace district_name_2004 = "KienAn" if district_name_2004 == "Quận Kiến An"
replace district_name_2004 = "LeChan" if district_name_2004 == "Quận Lê Chân"
replace district_name_2004 = "NgoQuyen" if district_name_2004 == "Quận Ngô Quyền"
replace district_name_2004 = "PhuNhuan" if district_name_2004 == "Quận Phú Nhuận"
replace district_name_2004 = "ThuDuc" if district_name_2004 == "Quận Thủ Đức"
replace district_name_2004 = "TanBinh" if district_name_2004 == "Quận Tân Bình"
replace district_name_2004 = "TanPhu" if district_name_2004 == "Quận Tân Phú"
replace district_name_2004 = "TayHo" if district_name_2004 == "Quận Tây Hồ"
replace district_name_2004 = "ThanhXuan" if district_name_2004 == "Quận Thanh Xuân"
replace district_name_2004 = "NhaTrang" if district_name_2004 == "Thành phố Nha Trang"
replace district_name_2004 = "Vinh" if district_name_2004 == "Thành phố Vinh"
replace district_name_2004 = "VietTri" if district_name_2004 == "Thành phố Việt Trì"
replace district_name_2004 = "DaLat" if district_name_2004 == "Thành phố Đà Lạt"
replace district_name_2004 = "HaDong" if district_name_2004 == "Thị xã Hà Đông"
replace district_name_2004 = "LaoCai" if district_name_2004 == "Thị xã Lào Cai"
replace district_name_2004 = "PhuTho" if district_name_2004 == "Thị xã Phú Thọ"
replace district_name_2004 = "TamKy" if district_name_2004 == "Thị xã Tam Kỳ"
replace district_name_2004 = "TuyenQuang" if district_name_2004 == "Thị xã Tuyên Quang"
replace district_name_2004 = "TanAn" if district_name_2004 == "Thị xã Tân An"
*arbitrary
replace district_name_2004 = "BacTuLiem" if district_name_2004 == "Huyện Từ Liêm"
rename district_name_2004 varname_2
drop _merge
save "firmdata_appended.dta", replace 


*havent homogenised firm to be in same district over all 6 years. checking if firms changed districts over the study period
sort firm_id year
by firm_id: gen district_changed = (district_id != district_id[_n-1]) if _n > 1

tab district_changed

import delimited "/Users/vishakhasingla/Desktop/LSE/term 1 /Quant Econ (EC475)/Thesis/flood_district_data_merged.csv", clear 
*checking if the floods that killed the most people also displaced the most people
pwcorr dead_2 displaced_2, sig star(0.05)

**Merging in the flood data- only defining floods above median death rate as "flood_dummy" right now


summarize dead_2, detail
local median_deaths = r(p50)
gen flood_dummy = (dead_2 > `median_deaths') if dead_2 != .
label var flood_dummy "=1 if deaths above median"

drop if flood_dummy==0
save "flood_database.dta", replace

*merging
use "firmdata_appended.dta", clear
isid firm_id year

use "flood_database.dta", clear
isid varname_2 year
**there are some districts that experienced multiple floods per year 
duplicates report varname_2 year
* Keep LEAST severe flood (minimum deaths)
bysort varname_2 year: egen min_deaths = min(dead_2)
keep if dead_2 == min_deaths

* If tied (multiple floods with same deaths), keep first
bysort varname_2 year: keep if _n == 1

isid varname_2 year

save "flood_database.dta", replace

use "firmdata_appended.dta", clear
merge m:1 varname_2 year using "flood_database.dta"
tab _merge

*interpreting the _merge table

*_merge==3: firm in that district experienced a flood in that year- kept as is
*_merge==2: we have flood data, but no firms in that district in that period- dropped because no firm information
*_merge==3: firms that did not experience a flood in a district in a given year- flood dummy given value 0

replace flood_dummy = 0 if _merge == 1
drop _merge

*correcting the province variable

decode province, gen(province_str)

* Recode the numbered ones
replace province_str = "Ha Noi" if province == 2
replace province_str = "Phu Tho" if province == 3
replace province_str = "Ha Tay" if province == 4
replace province_str = "Hai Phong" if province == 5
replace province_str = "Nghe An" if province == 6
replace province_str = "Quang Nam" if province == 7
replace province_str = "Khanh Hoa" if province == 8
replace province_str = "Lam Dong" if province == 9
replace province_str = "HCMC" if province == 10
replace province_str = "Long An" if province == 11

* Drop province 12 (only 1 observation)
drop if province == 12

drop province
rename province_str province


save "final_merged_dataset.dta", replace


















