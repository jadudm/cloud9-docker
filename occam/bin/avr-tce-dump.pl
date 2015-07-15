#!/usr/bin/env perl
#
#  Perl code for linking and assembling bytecode for the TVM
#  Copyright (C) 2008, 2009 Carl Ritson <cgr@kent.ac.uk>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#

#
#  Perl code for linking and assembling bytecode for the TVM
#  Copyright (C) 2008 Carl Ritson <cgr@kent.ac.uk>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#

#
#  Perl code for linking and assembling bytecode for the TVM
#  Copyright (C) 2008 Carl Ritson <cgr@kent.ac.uk>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#

#
#  Perl code for linking and assembling bytecode for the TVM
#  Copyright (C) 2008 Carl Ritson <cgr@kent.ac.uk>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#

package PLinker;

use strict;
use vars qw($STORE);

$STORE = {};
$STORE = {
           'ins_pri' => {
                          '96' => 'NFIX',
                          'AJW' => 176,
                          'STL' => 208,
                          '128' => 'ADC',
                          '144' => 'CALL',
                          '240' => 'OPR',
                          '112' => 'LDL',
                          '80' => 'LDNLP',
                          'STNL' => 224,
                          'LDLP' => 16,
                          'LDNL' => 48,
                          'NFIX' => 96,
                          '160' => 'CJ',
                          'LDC' => 64,
                          '0' => 'J',
                          'J' => 0,
                          '176' => 'AJW',
                          '224' => 'STNL',
                          'OPR' => 240,
                          '208' => 'STL',
                          'LDNLP' => 80,
                          'ADC' => 128,
                          '192' => 'EQC',
                          '16' => 'LDLP',
                          'EQC' => 192,
                          'PFIX' => 32,
                          'LDL' => 112,
                          'CALL' => 144,
                          '48' => 'LDNL',
                          'CJ' => 160,
                          '64' => 'LDC',
                          '32' => 'PFIX'
                        },
           'ins_sec' => {
                          'CIR' => 199,
                          'CCNT1' => 77,
                          '109' => 'ROUNDSN',
                          'SETHALTERR' => 88,
                          'READBFR' => 189,
                          '-66' => 'CLOCKDIS',
                          'BITREVWORD' => 119,
                          'LSUM' => 55,
                          'FPUDIVBY2' => undef,
                          'FDCA' => -48,
                          'STLB' => 23,
                          'ALT' => 67,
                          'MALLOC' => 226,
                          'FPEXPINC32' => 218,
                          'FPLDNLADDSN' => 170,
                          '196' => 'INTDIS',
                          'WRITEHDR' => -27,
                          '-67' => 'LDCLOCK',
                          'TIMERENABLEH' => 124,
                          'FPNOTFINITE' => 147,
                          'FPI32TOR64' => 152,
                          'PROC_MT_MOVE' => 562,
                          '-32' => 'STMOVE2DINIT',
                          'DUP' => 90,
                          'FPUMULBY2' => undef,
                          '117' => 'CRCBYTE',
                          '243' => 'DEVSS',
                          '103' => 'EXTNDISC',
                          'MRELEASEP' => 17,
                          '555' => 'IOW32',
                          'NDISS' => 239,
                          'IOR8' => 550,
                          'CLRHALTERR' => 87,
                          '-5' => 'TRET',
                          '577' => 'MT_RESIGN',
                          'IOR16' => 552,
                          '164' => 'FPREV',
                          'TIMERDISABLEL' => 123,
                          '-146' => 'CODEMAP',
                          'TESTHARDCHAN' => 45,
                          'FPR32TOR64' => 215,
                          'RESETCH' => 18,
                          'STTRAPPED' => 203,
                          'FPI32TOR32' => 150,
                          'ENBC3' => 112,
                          'SLMUL' => 100,
                          'FPCHKI64' => 223,
                          'IRDSQ' => -37,
                          '-68' => 'STCLOCK',
                          '134' => 'FPLDNLSNI',
                          '0' => 'REV',
                          '551' => 'IOW8',
                          '233' => 'XIN',
                          '18' => 'RESETCH',
                          '27' => 'LDPI',
                          '82' => 'SUM',
                          '40' => 'TESTSTD',
                          'LDTIMER' => 34,
                          'STVLCB' => -21,
                          '44' => 'DIV',
                          'STOPP' => 21,
                          'FPENTRY' => 171,
                          '170' => 'FPLDNLADDSN',
                          'FPLDNLADDDB' => 166,
                          'RESTART' => -34,
                          '34' => 'LDTIMER',
                          '133' => 'FPLDTEST',
                          '49' => 'LMUL',
                          '-36' => 'MKRC',
                          '-27' => 'WRITEHDR',
                          '96' => 'EXTIN',
                          'TRAP' => 252,
                          'FPURZ' => undef,
                          '569' => 'MT_RELEASE',
                          'MB' => 584,
                          '211' => 'FPSQRT',
                          'FPLG' => 155,
                          'FPABS' => 219,
                          '171' => 'FPENTRY',
                          'STOPERR' => 85,
                          '29' => 'XDBLE',
                          'IRET' => -17,
                          'LDIFF' => 79,
                          '28' => 'STLF',
                          'CSU' => 251,
                          'CSNGL' => 76,
                          '210' => 'FPMULBY2',
                          '91' => 'MOVE2DINIT',
                          '131' => 'FPCHKERR',
                          'TESTLDS' => 35,
                          'EXTNDISC' => 103,
                          'TESTJ0BREAK' => 180,
                          'FPUSQRTLAST' => undef,
                          'GT' => 9,
                          '26' => 'LDIV',
                          'RMB' => 585,
                          'IN' => 7,
                          '31' => 'REM',
                          'SETCHMODE' => -25,
                          '99' => 'UNPACKSN',
                          '-15' => 'SWAPTIMER',
                          'FPURP' => undef,
                          '194' => 'LDTH',
                          '11' => 'OUT',
                          '195' => 'LDCHSTATUS',
                          'LDTRAPH' => 110,
                          'SETAFF' => 566,
                          '180' => 'TESTJ0BREAK',
                          '570' => 'MT_CLONE',
                          'GCALL' => 6,
                          'UNMKRC' => -35,
                          '-14' => 'INSERTQUEUE',
                          '-7' => 'SELTH',
                          'SWAPTIMER' => -15,
                          'WMB' => 586,
                          '120' => 'BITREVNBITS',
                          '571' => 'MT_IN',
                          '48' => 'DISS',
                          '200' => 'SS',
                          'FPINT' => 161,
                          '-48' => 'FDCA',
                          'ENBT3' => 153,
                          '69' => 'ALTEND',
                          '-18' => 'STOPCH',
                          'FPDUP' => 163,
                          'FPR64TOR32' => 216,
                          '-10' => 'TRAPDIS',
                          'STSHADOW' => -3,
                          '71' => 'ENBT',
                          '-13' => 'TIMESLICE',
                          '567' => 'GETPAS',
                          '161' => 'FPINT',
                          'ALTEND' => 69,
                          '169' => 'FPENTRY2',
                          '-145' => 'WSMAP',
                          '548' => 'IOR',
                          'TRAPENB' => -9,
                          '13' => 'STARTP',
                          '201' => 'CHANTYPE',
                          'FPUCLRERR' => undef,
                          '58' => 'XWORD',
                          '232' => 'XABLE',
                          '140' => 'FPDIV',
                          '172' => 'FPLDNLMULSN',
                          'WSMAP' => -145,
                          'DISC' => 47,
                          '92' => 'MOVE2DALL',
                          'INTDIS' => 196,
                          '237' => 'NDISC',
                          '217' => 'FPEXPDEC32',
                          '557' => 'ENBT2',
                          'STFLAGS' => 183,
                          '213' => 'FPRM',
                          'NOP' => -64,
                          '549' => 'IOW',
                          '559' => 'PROC_ALLOC',
                          '113' => 'LDINF',
                          '62' => 'SAVEH',
                          'STHB' => 80,
                          'CRCWORD' => 116,
                          'CLOCKDIS' => -66,
                          '-23' => 'SWAPBFR',
                          'LDPRI' => 30,
                          'LDVLCB' => -22,
                          'FMUL' => 114,
                          'FPEQ' => 149,
                          'FPTESTERR' => 156,
                          '104' => 'SATADD',
                          'TIMESLICE' => -13,
                          '95' => 'GTU',
                          'FPMUL' => 139,
                          'VIN' => -20,
                          'ENDP' => 3,
                          'FPADDDBSN' => 221,
                          'MOVE2DZERO' => 94,
                          'OUTBYTE' => 14,
                          'XEND' => 236,
                          '197' => 'INTENB',
                          '63' => 'WCNT',
                          'FPUABS' => undef,
                          '' => 'REAL64TAN',
                          'FPLDZEROSN' => 159,
                          '65' => 'SHL',
                          '-21' => 'STVLCB',
                          'FPLDNLDB' => 138,
                          '143' => 'FPREMFIRST',
                          'DISG' => -29,
                          'MT_SYNC' => 578,
                          'CODEMAP' => -146,
                          'FPRP' => 212,
                          '148' => 'FPGT',
                          'FPUR32TOR64' => undef,
                          'MINT' => 66,
                          'FPLDNLMULDB' => 168,
                          '-28' => 'READHDR',
                          'MT_CLONE' => 570,
                          'WAIT' => -11,
                          'IOW' => 549,
                          '583' => 'MT_BIND',
                          '80' => 'STHB',
                          'CB' => 186,
                          '7' => 'IN',
                          'ALTWT' => 68,
                          'FPSQRT' => 211,
                          '17' => 'MRELEASEP',
                          '-29' => 'DISG',
                          'LSUB' => 56,
                          'ENBG' => -30,
                          'REAL64TAN' => undef,
                          'SATADD' => 104,
                          'FPDIVBY2' => 209,
                          '552' => 'IOR16',
                          'INTENB' => 197,
                          '97' => 'EXTOUT',
                          '153' => 'ENBT3',
                          'FPUEXPINC32' => undef,
                          'CRCBYTE' => 117,
                          '-11' => 'WAIT',
                          'FPCHKERR' => 131,
                          '5' => 'ADD',
                          '33' => 'LEND',
                          'MT_RELEASE' => 569,
                          'FPUSQRTFIRST' => undef,
                          'POP' => 121,
                          'REM' => 31,
                          'NDIST' => 238,
                          '221' => 'FPADDDBSN',
                          '1' => 'LB',
                          'MOVE2DINIT' => 91,
                          'OUT' => 11,
                          '-40' => 'LDRESPTR',
                          '130' => 'FPLDNLDBI',
                          '125' => 'TIMERENABLEL',
                          'MRELEASE' => 227,
                          '-26' => 'INITVLCB',
                          'RET' => 32,
                          'GETPAS' => 567,
                          'DIFF' => 4,
                          'TESTLDE' => 36,
                          '581' => 'MT_XXCHG',
                          'FPSTTEST' => 128,
                          '-1' => 'FPSTALL',
                          '106' => 'SATMUL',
                          'ENBC' => 72,
                          '10' => 'WSUB',
                          '187' => 'CBU',
                          'IOR' => 548,
                          '74' => 'MOVE',
                          '203' => 'STTRAPPED',
                          'SETPRI' => 165,
                          'LADD' => 22,
                          'SB' => 59,
                          'STOPCH' => -18,
                          'SWAPQUEUE' => -16,
                          '556' => 'ENBC2',
                          '-45' => 'ICL',
                          '573' => 'MT_XCHG',
                          'XBWORD' => 184,
                          'TESTSTD' => 40,
                          'EXT_MT_IN' => 587,
                          'LDDEVID' => 380,
                          '75' => 'OR',
                          '553' => 'IOW16',
                          '129' => 'WSUBDB',
                          '88' => 'SETHALTERR',
                          '32' => 'RET',
                          '-20' => 'VIN',
                          '81' => 'TALTWT',
                          '-25' => 'SETCHMODE',
                          'FPUSETERR' => undef,
                          '146' => 'FPORDERED',
                          '137' => 'FPSUB',
                          'DEVSW' => 245,
                          '199' => 'CIR',
                          'SETHDR' => -24,
                          'CIRU' => 204,
                          'MT_ALLOC' => 568,
                          '586' => 'WMB',
                          '145' => 'FPNAN',
                          '190' => 'LDCONF',
                          '207' => 'FPREM',
                          'FPMULBY2' => 210,
                          'READHDR' => -28,
                          '191' => 'STCONF',
                          'FPSUB' => 137,
                          'WCNT' => 63,
                          'MOVE' => 74,
                          'CLRJ0BREAK' => 178,
                          '45' => 'TESTHARDCHAN',
                          '585' => 'RMB',
                          'DEVLS' => 242,
                          'XOR' => 51,
                          'MT_XCHG' => 573,
                          '576' => 'MT_ENROLL',
                          'STCONF' => 191,
                          '154' => 'FPB32TOR64',
                          'NOT' => 50,
                          'FPREV' => 164,
                          'GRANT' => -31,
                          '584' => 'MB',
                          '77' => 'CCNT1',
                          'ICA' => -47,
                          '94' => 'MOVE2DZERO',
                          'MKRC' => -36,
                          '-6' => 'GOPROT',
                          '2' => 'BSUB',
                          '124' => 'TIMERENABLEH',
                          '38' => 'TESTSTS',
                          'MT_OUT' => 572,
                          'MUL' => 83,
                          'FPRZ' => 214,
                          'PROC_MT_COPY' => 561,
                          '188' => 'INSPHDR',
                          'REAL32SIN' => undef,
                          'LS' => 202,
                          '55' => 'LSUM',
                          '85' => 'STOPERR',
                          'SHR' => 64,
                          '64' => 'SHR',
                          'TESTSTS' => 38,
                          '132' => 'FPSTNLDB',
                          'MT_RESIZE' => 589,
                          '182' => 'LDFLAGS',
                          '250' => 'CS',
                          'START' => 511,
                          'FPUNOROUND' => undef,
                          '84' => 'STTIMER',
                          '167' => 'FPENTRY3',
                          'FPRTOI32' => 157,
                          'FPRM' => 213,
                          'STTIMER' => 84,
                          '-39' => 'STRESPTR',
                          '253' => 'NULL',
                          '12' => 'SUB',
                          '162' => 'GETPRI',
                          '24' => 'STHF',
                          '226' => 'MALLOC',
                          '119' => 'BITREVWORD',
                          '252' => 'TRAP',
                          '9' => 'GT',
                          '138' => 'FPLDNLDB',
                          'TRAPDIS' => -10,
                          '565' => 'GETAFF',
                          '380' => 'LDDEVID',
                          'BITCNT' => 118,
                          'TESTLDD' => 37,
                          'DIV' => 44,
                          '66' => 'MINT',
                          '123' => 'TIMERDISABLEL',
                          'FPUCHKI32' => undef,
                          '-3' => 'STSHADOW',
                          '589' => 'MT_RESIZE',
                          'INSPHDR' => 188,
                          '-31' => 'GRANT',
                          'FPADD' => 135,
                          '36' => 'TESTLDE',
                          '215' => 'FPR32TOR64',
                          '47' => 'DISC',
                          'ICL' => -45,
                          'XWORD' => 58,
                          '155' => 'FPLG',
                          '244' => 'DEVLW',
                          'CS' => 250,
                          '249' => 'LSX',
                          'LDPRODID' => -132,
                          '572' => 'MT_OUT',
                          '248' => 'XSWORD',
                          'SETJ0BREAK' => 179,
                          'INITVLCB' => -26,
                          'SHL' => 65,
                          'XSWORD' => 248,
                          'FPLDALL' => -2,
                          'REAL64COS' => undef,
                          'VOUT' => -19,
                          'STHF' => 24,
                          '15' => 'OUTWORD',
                          '554' => 'IOR32',
                          'LEND' => 33,
                          'SIGNAL' => -12,
                          '563' => 'PROC_START',
                          'BCNT' => 52,
                          '50' => 'NOT',
                          '209' => 'FPDIVBY2',
                          'SELTH' => -7,
                          '216' => 'FPR64TOR32',
                          '68' => 'ALTWT',
                          'IOW32' => 555,
                          '178' => 'CLRJ0BREAK',
                          '144' => 'FPREMSTEP',
                          '43' => 'TIN',
                          'TALTWT' => 81,
                          'FPNAN' => 145,
                          'FPGT' => 148,
                          'GOPROT' => -6,
                          'SYSCALL' => -8,
                          'LDTH' => 194,
                          '159' => 'FPLDZEROSN',
                          'TESTPRANAL' => 42,
                          '-33' => 'CAUSEERROR',
                          '-24' => 'SETHDR',
                          '151' => 'FPGE',
                          'FPLDZERODB' => 160,
                          '-4' => 'LDSHADOW',
                          'FPORDERED' => 146,
                          'SUB' => 12,
                          'IOW16' => 553,
                          '193' => 'SSUB',
                          '-16' => 'SWAPQUEUE',
                          '122' => 'TIMERDISABLEH',
                          '139' => 'FPMUL',
                          '-8' => 'SYSCALL',
                          'SETERR' => 16,
                          'GAJW' => 60,
                          'WSUBDB' => 129,
                          '160' => 'FPLDZERODB',
                          'FPENTRY2' => 169,
                          '222' => 'FPCHKI32',
                          'FPB32TOR64' => 154,
                          '100' => 'SLMUL',
                          'MT_RESIGN' => 577,
                          '236' => 'XEND',
                          'LSHL' => 54,
                          'MT_XXCHG' => 581,
                          '115' => 'CFLERR',
                          '580' => 'MT_XOUT',
                          '-37' => 'IRDSQ',
                          'FPDIV' => 140,
                          'CAUSEERROR' => -33,
                          '150' => 'FPI32TOR32',
                          '-2' => 'FPLDALL',
                          'FDCL' => -46,
                          'FPSTALL' => -1,
                          '212' => 'FPRP',
                          '67' => 'ALT',
                          '90' => 'DUP',
                          '163' => 'FPDUP',
                          '582' => 'MT_DCLONE',
                          '-47' => 'ICA',
                          'CBU' => 187,
                          'BREAK' => 177,
                          '158' => 'FPSTNLI32',
                          'ENBT2' => 557,
                          'DEVSS' => 243,
                          '121' => 'POP',
                          'LB' => 1,
                          'FPSTNLDB' => 132,
                          'DEVLW' => 244,
                          'IOW8' => 551,
                          '105' => 'SATSUB',
                          '22' => 'LADD',
                          '79' => 'LDIFF',
                          'MT_DCLONE' => 582,
                          '14' => 'OUTBYTE',
                          '37' => 'TESTLDD',
                          'LDMEMSTARTVAL' => 126,
                          'IOR32' => 554,
                          'TIMERENABLEL' => 125,
                          'SULMUL' => 101,
                          '242' => 'DEVLS',
                          '511' => 'START',
                          'ENBC2' => 556,
                          '152' => 'FPI32TOR64',
                          'SETTIMESLICE' => 176,
                          '60' => 'GAJW',
                          'TESTHALTERR' => 89,
                          'MT_XOUT' => 580,
                          '165' => 'SETPRI',
                          'FPEXPDEC32' => 217,
                          'PROC_PARAM' => 560,
                          'STRESPTR' => -39,
                          '89' => 'TESTHALTERR',
                          'REAL32COS' => undef,
                          '550' => 'IOR8',
                          'EXTVRFY' => 20,
                          'TRET' => -5,
                          '579' => 'MT_XIN',
                          '240' => 'DEVLB',
                          'FPSTNLSN' => 136,
                          'FPLDNLDBI' => 130,
                          'REAL32TAN' => undef,
                          'FPENTRY3' => 167,
                          '147' => 'FPNOTFINITE',
                          '78' => 'TALT',
                          'STLF' => 28,
                          'FPUCHKI64' => undef,
                          '70' => 'AND',
                          '114' => 'FMUL',
                          '19' => 'CSUB0',
                          '-17' => 'IRET',
                          '157' => 'FPRTOI32',
                          '176' => 'SETTIMESLICE',
                          'WSUB' => 10,
                          '560' => 'PROC_PARAM',
                          'FPLDTEST' => 133,
                          '208' => 'FPRN',
                          '23' => 'STLB',
                          '83' => 'MUL',
                          'MOVE2DALL' => 92,
                          'ERDSQ' => -38,
                          'OR' => 75,
                          '-9' => 'TRAPENB',
                          'FPURM' => undef,
                          '558' => 'ENBS2',
                          'LDFLAGS' => 182,
                          '578' => 'MT_SYNC',
                          '-19' => 'VOUT',
                          'LDCHSTATUS' => 195,
                          'PROC_START' => 563,
                          '142' => 'FPLDNLSN',
                          'EXTENBC' => 102,
                          'TALT' => 78,
                          'MT_ENROLL' => 576,
                          'PROD' => 8,
                          '183' => 'STFLAGS',
                          '-65' => 'CLOCKENB',
                          'MT_UNLOCK' => 575,
                          'FPREMSTEP' => 144,
                          'ENBS3' => 173,
                          '56' => 'LSUB',
                          'DEVMOVE' => -44,
                          'LDRESPTR' => -40,
                          'TIN' => 43,
                          'REV' => 0,
                          'OUTWORD' => 15,
                          'FPGE' => 151,
                          '219' => 'FPABS',
                          'MT_IN' => 571,
                          '76' => 'CSNGL',
                          'GTU' => 95,
                          'NULL' => 253,
                          'POSTNORMSN' => 108,
                          '574' => 'MT_LOCK',
                          '93' => 'MOVE2DNONZERO',
                          'NDISC' => 237,
                          '192' => 'LDCNT',
                          '238' => 'NDIST',
                          '53' => 'LSHR',
                          'FPRANGE' => 141,
                          '185' => 'LBX',
                          'REAL64SIN' => undef,
                          '39' => 'TESTSTE',
                          'SATMUL' => 106,
                          'MT_BIND' => 583,
                          'TIMERDISABLEH' => 122,
                          '166' => 'FPLDNLADDDB',
                          'CSUB0' => 19,
                          '111' => 'STTRAPH',
                          'LDTRAPPED' => 198,
                          '186' => 'CB',
                          '-12' => 'SIGNAL',
                          '-132' => 'LDPRODID',
                          '588' => 'EXT_MT_OUT',
                          '587' => 'EXT_MT_IN',
                          'DEVLB' => 240,
                          'FPUSQRTSTEP' => undef,
                          '173' => 'ENBS3',
                          '189' => 'READBFR',
                          '73' => 'ENBS',
                          '-30' => 'ENBG',
                          '59' => 'SB',
                          'SAVEL' => 61,
                          'LSHR' => 53,
                          'FPLDNLSNI' => 134,
                          '46' => 'DIST',
                          '168' => 'FPLDNLMULDB',
                          'RUNP' => 57,
                          'GETAFF' => 565,
                          'LDINF' => 113,
                          'SWAPBFR' => -23,
                          'CHANTYPE' => 201,
                          '102' => 'EXTENBC',
                          '6' => 'GCALL',
                          '568' => 'MT_ALLOC',
                          'SS' => 200,
                          '251' => 'CSU',
                          '198' => 'LDTRAPPED',
                          '241' => 'DEVSB',
                          'SATSUB' => 105,
                          '25' => 'NORM',
                          '41' => 'TESTERR',
                          '-46' => 'FDCL',
                          '-34' => 'RESTART',
                          'GETPRI' => 162,
                          '54' => 'LSHL',
                          '108' => 'POSTNORMSN',
                          'CWORD' => 86,
                          'EXTIN' => 96,
                          '110' => 'LDTRAPH',
                          '118' => 'BITCNT',
                          '72' => 'ENBC',
                          'DIST' => 46,
                          '156' => 'FPTESTERR',
                          '-22' => 'LDVLCB',
                          'STCLOCK' => -68,
                          '135' => 'FPADD',
                          'NORM' => 25,
                          '116' => 'CRCWORD',
                          'MOVE2DNONZERO' => 93,
                          'MT_XIN' => 579,
                          '227' => 'MRELEASE',
                          'FPSTNLI32' => 158,
                          'UNPACKSN' => 99,
                          '239' => 'NDISS',
                          '8' => 'PROD',
                          'LDCONF' => 190,
                          '564' => 'PROC_END',
                          '218' => 'FPEXPINC32',
                          'TESTSTE' => 39,
                          'EXTOUT' => 97,
                          '149' => 'FPEQ',
                          'STMOVE2DINIT' => -32,
                          '16' => 'SETERR',
                          'FPLDNLMULSN' => 172,
                          'STARTP' => 13,
                          '51' => 'XOR',
                          '86' => 'CWORD',
                          'LSX' => 249,
                          '204' => 'CIRU',
                          '21' => 'STOPP',
                          'FPUR64TOR32' => undef,
                          'BITREVNBITS' => 120,
                          '57' => 'RUNP',
                          '184' => 'XBWORD',
                          'LDPI' => 27,
                          'DISS' => 48,
                          '3' => 'ENDP',
                          '566' => 'SETAFF',
                          '-64' => 'NOP',
                          'SUM' => 82,
                          '575' => 'MT_UNLOCK',
                          '214' => 'FPRZ',
                          'CLOCKENB' => -65,
                          'AND' => 70,
                          'LMUL' => 49,
                          'ROUNDSN' => 109,
                          'XDBLE' => 29,
                          '4' => 'DIFF',
                          'FPCHKI32' => 222,
                          'DEVSB' => 241,
                          'LDSHADOW' => -4,
                          'EXT_MT_OUT' => 588,
                          'LDCNT' => 192,
                          'MT_LOCK' => 574,
                          'ENBT' => 71,
                          'FPURN' => undef,
                          '223' => 'FPCHKI64',
                          '61' => 'SAVEL',
                          '128' => 'FPSTTEST',
                          '42' => 'TESTPRANAL',
                          '-35' => 'UNMKRC',
                          'CFLERR' => 115,
                          'PROC_END' => 564,
                          'XABLE' => 232,
                          'LDIV' => 26,
                          'SAVEH' => 62,
                          '126' => 'LDMEMSTARTVAL',
                          'FPLDNLSN' => 142,
                          '177' => 'BREAK',
                          '-44' => 'DEVMOVE',
                          'ADD' => 5,
                          'FPREMFIRST' => 143,
                          'FPUEXPDEC32' => undef,
                          '562' => 'PROC_MT_MOVE',
                          'ENBS2' => 558,
                          'FPRN' => 208,
                          '179' => 'SETJ0BREAK',
                          '87' => 'CLRHALTERR',
                          '30' => 'LDPRI',
                          'LBX' => 185,
                          'INSERTQUEUE' => -14,
                          'SSUB' => 193,
                          '141' => 'FPRANGE',
                          'STTRAPH' => 111,
                          'PROC_ALLOC' => 559,
                          '245' => 'DEVSW',
                          '561' => 'PROC_MT_COPY',
                          '202' => 'LS',
                          'TESTERR' => 41,
                          'BSUB' => 2,
                          '35' => 'TESTLDS',
                          '52' => 'BCNT',
                          '136' => 'FPSTNLSN',
                          '-38' => 'ERDSQ',
                          'XIN' => 233,
                          'LDCLOCK' => -67,
                          '112' => 'ENBC3',
                          '101' => 'SULMUL',
                          'ENBS' => 73,
                          'FPREM' => 207,
                          '20' => 'EXTVRFY'
                        },
           'tvm_ins' => [
                          [
                            'MRELEASEP',
                            17
                          ],
                          [
                            'MALLOC',
                            226
                          ],
                          [
                            'MRELEASE',
                            227
                          ],
                          [
                            'MT_ALLOC',
                            568
                          ],
                          [
                            'MT_RELEASE',
                            569
                          ],
                          [
                            'MT_CLONE',
                            570
                          ],
                          [
                            'MT_IN',
                            571
                          ],
                          [
                            'MT_OUT',
                            572
                          ],
                          [
                            'MT_XCHG',
                            573
                          ],
                          [
                            'MT_LOCK',
                            574
                          ],
                          [
                            'MT_UNLOCK',
                            575
                          ],
                          [
                            'MT_ENROLL',
                            576
                          ],
                          [
                            'MT_RESIGN',
                            577
                          ],
                          [
                            'MT_SYNC',
                            578
                          ],
                          [
                            'MT_XIN',
                            579
                          ],
                          [
                            'MT_XOUT',
                            580
                          ],
                          [
                            'MT_XXCHG',
                            581
                          ],
                          [
                            'MT_DCLONE',
                            582
                          ],
                          [
                            'MT_BIND',
                            583
                          ],
                          [
                            'IN',
                            7
                          ],
                          [
                            'OUT',
                            11
                          ],
                          [
                            'OUTBYTE',
                            14
                          ],
                          [
                            'OUTWORD',
                            15
                          ],
                          [
                            'XBWORD',
                            184
                          ],
                          [
                            'LBX',
                            185
                          ],
                          [
                            'CB',
                            186
                          ],
                          [
                            'CBU',
                            187
                          ],
                          [
                            'SSUB',
                            193
                          ],
                          [
                            'CIR',
                            199
                          ],
                          [
                            'SS',
                            200
                          ],
                          [
                            'LS',
                            202
                          ],
                          [
                            'CIRU',
                            204
                          ],
                          [
                            'XSWORD',
                            248
                          ],
                          [
                            'LSX',
                            249
                          ],
                          [
                            'CS',
                            250
                          ],
                          [
                            'CSU',
                            251
                          ],
                          [
                            'LDTIMER',
                            34
                          ],
                          [
                            'TIN',
                            43
                          ],
                          [
                            'PROC_ALLOC',
                            559
                          ],
                          [
                            'PROC_PARAM',
                            560
                          ],
                          [
                            'PROC_MT_COPY',
                            561
                          ],
                          [
                            'PROC_MT_MOVE',
                            562
                          ],
                          [
                            'PROC_START',
                            563
                          ],
                          [
                            'PROC_END',
                            564
                          ],
                          [
                            'GETAFF',
                            565
                          ],
                          [
                            'SETAFF',
                            566
                          ],
                          [
                            'GETPAS',
                            567
                          ],
                          [
                            'REV',
                            0
                          ],
                          [
                            'LB',
                            1
                          ],
                          [
                            'BSUB',
                            2
                          ],
                          [
                            'ENDP',
                            3
                          ],
                          [
                            'DIFF',
                            4
                          ],
                          [
                            'ADD',
                            5
                          ],
                          [
                            'GCALL',
                            6
                          ],
                          [
                            'PROD',
                            8
                          ],
                          [
                            'GT',
                            9
                          ],
                          [
                            'WSUB',
                            10
                          ],
                          [
                            'SUB',
                            12
                          ],
                          [
                            'STARTP',
                            13
                          ],
                          [
                            'SETERR',
                            16
                          ],
                          [
                            'CSUB0',
                            19
                          ],
                          [
                            'STOPP',
                            21
                          ],
                          [
                            'LADD',
                            22
                          ],
                          [
                            'NORM',
                            25
                          ],
                          [
                            'LDPI',
                            27
                          ],
                          [
                            'XDBLE',
                            29
                          ],
                          [
                            'REM',
                            31
                          ],
                          [
                            'RET',
                            32
                          ],
                          [
                            'LEND',
                            33
                          ],
                          [
                            'DIV',
                            44
                          ],
                          [
                            'LMUL',
                            49
                          ],
                          [
                            'NOT',
                            50
                          ],
                          [
                            'XOR',
                            51
                          ],
                          [
                            'LSHR',
                            53
                          ],
                          [
                            'LSHL',
                            54
                          ],
                          [
                            'LSUM',
                            55
                          ],
                          [
                            'LSUB',
                            56
                          ],
                          [
                            'RUNP',
                            57
                          ],
                          [
                            'SB',
                            59
                          ],
                          [
                            'GAJW',
                            60
                          ],
                          [
                            'SHR',
                            64
                          ],
                          [
                            'SHL',
                            65
                          ],
                          [
                            'MINT',
                            66
                          ],
                          [
                            'AND',
                            70
                          ],
                          [
                            'MOVE',
                            74
                          ],
                          [
                            'OR',
                            75
                          ],
                          [
                            'CSNGL',
                            76
                          ],
                          [
                            'CCNT1',
                            77
                          ],
                          [
                            'LDIFF',
                            79
                          ],
                          [
                            'SUM',
                            82
                          ],
                          [
                            'MUL',
                            83
                          ],
                          [
                            'STOPERR',
                            85
                          ],
                          [
                            'CWORD',
                            86
                          ],
                          [
                            'POP',
                            121
                          ],
                          [
                            'SHUTDOWN',
                            254
                          ],
                          [
                            'UNPACKSN',
                            99
                          ],
                          [
                            'POSTNORMSN',
                            108
                          ],
                          [
                            'ROUNDSN',
                            109
                          ],
                          [
                            'LDINF',
                            113
                          ],
                          [
                            'FMUL',
                            114
                          ],
                          [
                            'FPLDNLDBI',
                            130
                          ],
                          [
                            'FPCHECKERR',
                            131
                          ],
                          [
                            'FPSTNLDB',
                            132
                          ],
                          [
                            'FPLDNLSNI',
                            134
                          ],
                          [
                            'FPADD',
                            135
                          ],
                          [
                            'FPSTNLSN',
                            136
                          ],
                          [
                            'FPSUB',
                            137
                          ],
                          [
                            'FPLDNLDB',
                            138
                          ],
                          [
                            'FPMUL',
                            139
                          ],
                          [
                            'FPDIV',
                            140
                          ],
                          [
                            'FPLDNLSN',
                            142
                          ],
                          [
                            'FPNAN',
                            145
                          ],
                          [
                            'FPORDERED',
                            146
                          ],
                          [
                            'FPNOTFINITE',
                            147
                          ],
                          [
                            'FPGT',
                            148
                          ],
                          [
                            'FPEQ',
                            149
                          ],
                          [
                            'FPI32TOR32',
                            150
                          ],
                          [
                            'FPI32TOR64',
                            152
                          ],
                          [
                            'FPB32TOR64',
                            154
                          ],
                          [
                            'FPRTOI32',
                            157
                          ],
                          [
                            'FPSTNLI32',
                            158
                          ],
                          [
                            'FPLDZERODB',
                            160
                          ],
                          [
                            'FPINT',
                            161
                          ],
                          [
                            'FPDUP',
                            163
                          ],
                          [
                            'FPREV',
                            164
                          ],
                          [
                            'FPLDNLADDDB',
                            166
                          ],
                          [
                            'FPLDNLMULDB',
                            168
                          ],
                          [
                            'FPLDNLADDSN',
                            170
                          ],
                          [
                            'FPLDNLMULSN',
                            172
                          ],
                          [
                            'FPREM',
                            207
                          ],
                          [
                            'I64TOREAL',
                            208
                          ],
                          [
                            'FPDIVBY2',
                            209
                          ],
                          [
                            'FPMULBY2',
                            210
                          ],
                          [
                            'FPSQRT',
                            211
                          ],
                          [
                            'FPRZ',
                            214
                          ],
                          [
                            'FPR32TOR64',
                            7
                          ],
                          [
                            'FPR64TOR32',
                            8
                          ],
                          [
                            'FPEXPDEC32',
                            217
                          ],
                          [
                            'FPABS',
                            219
                          ],
                          [
                            'FPCHKI64',
                            223
                          ],
                          [
                            'MB',
                            584
                          ],
                          [
                            'RMB',
                            585
                          ],
                          [
                            'WMB',
                            586
                          ],
                          [
                            'DUP',
                            90
                          ],
                          [
                            'WSUBDB',
                            129
                          ],
                          [
                            'BOOLINVERT',
                            35
                          ],
                          [
                            'WIDENSHORT',
                            36
                          ],
                          [
                            'FFICALL',
                            37
                          ],
                          [
                            'LEND3',
                            38
                          ],
                          [
                            'LENDB',
                            39
                          ],
                          [
                            'RESCHEDULE',
                            40
                          ],
                          [
                            'EXTVRFY',
                            20
                          ],
                          [
                            'EXTIN',
                            96
                          ],
                          [
                            'EXTOUT',
                            97
                          ],
                          [
                            'EXT_MT_IN',
                            587
                          ],
                          [
                            'EXT_MT_OUT',
                            588
                          ],
                          [
                            'GETPRI',
                            162
                          ],
                          [
                            'SETPRI',
                            165
                          ],
                          [
                            'SAVECREG',
                            173
                          ],
                          [
                            'RESTORECREG',
                            174
                          ],
                          [
                            'SEMINIT',
                            122
                          ],
                          [
                            'SEMCLAIM',
                            123
                          ],
                          [
                            'SEMRELEASE',
                            124
                          ],
                          [
                            'CHECKNOTNULL',
                            224
                          ],
                          [
                            'XABLE',
                            232
                          ],
                          [
                            'XIN',
                            233
                          ],
                          [
                            'XEND',
                            236
                          ],
                          [
                            'NULL',
                            253
                          ],
                          [
                            'DISC',
                            47
                          ],
                          [
                            'DIST',
                            46
                          ],
                          [
                            'DISS',
                            48
                          ],
                          [
                            'ALT',
                            67
                          ],
                          [
                            'ALTWT',
                            68
                          ],
                          [
                            'ALTEND',
                            69
                          ],
                          [
                            'ENBT',
                            71
                          ],
                          [
                            'ENBC',
                            72
                          ],
                          [
                            'ENBS',
                            73
                          ],
                          [
                            'TALT',
                            78
                          ],
                          [
                            'TALTWT',
                            81
                          ]
                        ],
           'tcoff' => {
                        '5' => 'ADJUST_POINT',
                        'BOOL_FALSE' => '0',
                        'INSTR_POP' => 16384,
                        'AP_VALUE' => '13',
                        'INSTR_RMC_CORE2' => 67108864,
                        'DESCRIPTOR' => '26',
                        '524288' => 'ATTRIB_FPU_CALLING',
                        'LAST_TCOFF_OP' => '13',
                        '7' => 'LOAD_PREFIX',
                        'TIMES_OP' => '8',
                        'ATTRIB_STOP' => 256,
                        '17' => 'BYTE_PATCH',
                        'LOAD_EXPR' => '8',
                        'LANG_ANSI_C' => '4',
                        'PROVISIONAL_USAGE' => 64,
                        '16384' => 'INSTR_POP',
                        'WORD_PATCH' => '25',
                        'ARCH_T' => 1048576,
                        '15' => 'DEFINE_SYMBOL',
                        'ARCH_H' => 2097152,
                        'INSTR_DEBUG_SUPPORT' => 2048,
                        'SIGN_INDICATOR' => '255',
                        'LINKABLE' => '1',
                        'PFX_1_NUMBER' => '251',
                        '262144' => 'ATTRIB_NON_FPU_CALLING',
                        'VERSION' => '27',
                        'EXPORT_USAGE' => 2,
                        'ERROR_MSG' => '3',
                        'ROUTINE_USAGE' => 256,
                        '100663296' => 'INSTR_387',
                        '134217728' => 'INSTR_RMC_CORE3',
                        'LIB_INDEX_END' => '23',
                        'END_MODULE' => '3',
                        'INSTR_RMC_CORE3' => 134217728,
                        'EXECUTE_SECTION' => 4,
                        'ATTRIB_MEMSTARTLEQ28' => 0,
                        'LOCAL_SYMBOLS' => '13',
                        'PFX_4_NUMBER' => '253',
                        'CONDITIONAL_USAGE' => 16,
                        'COMMENT' => '20',
                        'START_MODULE' => '2',
                        '8' => 'LOAD_EXPR',
                        'ORIGIN_USAGE' => 128,
                        'REP_START' => '18',
                        'MINUS_OP' => '7',
                        'DEBUG_SECTION' => 8,
                        'INSTR_FPU_CORE' => 256,
                        '33554432' => 'INSTR_RMC_CORE1',
                        'INSTR_CORE' => 1,
                        '10' => 'ALIGN',
                        'LANG_ISO_PASCAL' => '6',
                        '18' => 'REP_START',
                        '27' => 'VERSION',
                        'REM_OP' => '10',
                        '0' => 'BOOL_FALSE',
                        'LANG_LINKED' => '2',
                        '25' => 'WORD_PATCH',
                        'INSTR_LDMEMSTARTVAL' => 8192,
                        'LIB_INDEX_START' => '22',
                        'INSTR_DUP' => 8,
                        'VIRTUAL_SECTION' => 16,
                        '512' => 'DATA_USAGE',
                        'LANG_OCCAM' => '3',
                        '32768' => 'INSTR_NO_SEMAPHORE',
                        '1' => 'LINKABLE',
                        'ALIGN' => '10',
                        'LANG_FORTRAN_77' => '5',
                        '6' => 'LOAD_TEXT',
                        'INSTR_FP_SUPPORT' => 4,
                        '251' => 'PFX_1_NUMBER',
                        'INSTR_387' => 100663296,
                        'LANG_NOT_KNOWN' => '1',
                        '128' => 'ORIGIN_USAGE',
                        'INSTR_386_16' => 16777216,
                        '4096' => 'INSTR_TIMER_DISABLE',
                        '2' => 'START_MODULE',
                        '4' => 'SET_LOAD_POINT',
                        'INSTR_088_16' => 8388608,
                        'NORMAL_MSG' => '1',
                        '2097152' => 'ARCH_H',
                        'LANG_ASSEMBLER' => '9',
                        'INSTR_CRC' => 64,
                        '1048576' => 'ARCH_T',
                        '11' => 'SECTION',
                        'DIVIDE_OP' => '9',
                        'MIN_OP' => '12',
                        'INSTR_BITOPS' => 128,
                        'ATTRIB_FPU_CALLING' => 524288,
                        'SYMTAB_SYMBOL' => '2',
                        '3' => 'END_MODULE',
                        'LP_VALUE' => '2',
                        'CO_VALUE' => '1',
                        '31' => 'SPECIFIC_SYMBOL',
                        'SECTION' => '11',
                        '16777216' => 'INSTR_386_16',
                        '26' => 'DESCRIPTOR',
                        'INSTR_WSUBDB' => 16,
                        'DEFINE_SYMBOL' => '15',
                        'ATTRIB_MEMSTART18' => 8,
                        'KILL_ID' => '16',
                        'LOAD_TEXT' => '6',
                        'ATTRIB_WORD_16' => 1,
                        'LANG_MODULA_2' => '7',
                        '14' => 'DEFINE_LABEL',
                        'WL_VALUE' => '5',
                        '21' => 'MESSAGE',
                        '22' => 'LIB_INDEX_START',
                        'LAST_TCOFF' => '31',
                        'INSTR_386_32' => 33554432,
                        'NOTYPE_USAGE' => 1024,
                        'WRITE_SECTION' => 1,
                        'ATTRIB_WORD_32' => 2,
                        'ATTRIB_WORD_64' => 4,
                        'SET_LOAD_POINT' => '4',
                        '28' => 'LINKED_UNIT',
                        'PLUS_OP' => '6',
                        'INSTR_TIMER_DISABLE' => 4096,
                        '16' => 'KILL_ID',
                        'INSTR_FMUL' => 2,
                        'SV_VALUE' => '3',
                        'ATTRIB_CALL_IO' => 0,
                        '32' => 'UNINDEXED_USAGE',
                        'LANG_OCCAM_HARNESS' => '10',
                        'ATTRIB_MEMSTART28' => 16,
                        'SYMBOL_TABLE_MAGIC_TEXT_LENGTH' => '19',
                        'LANG_ADA' => '8',
                        'INSTR_NO_DEVICE' => 65536,
                        '20' => 'COMMENT',
                        '1024' => 'NOTYPE_USAGE',
                        'LOCAL_USAGE' => 1,
                        'LINKED_UNIT' => '28',
                        'SYMTAB_SPECIFIC_SYMBOL' => '3',
                        'PFX_2_NUMBER' => '252',
                        'REP_END' => '19',
                        'DEFINE_LABEL' => '14',
                        'MAX_OP' => '11',
                        'LOAD_ZEROS' => '9',
                        'INSTR_FPTESTERR' => 512,
                        'DATA_USAGE' => 512,
                        '2048' => 'ATTRIB_INSTR_IO',
                        'READ_SECTION' => 2,
                        '67108864' => 'INSTR_RMC_CORE2',
                        'WARNING_MSG' => '2',
                        'SYMTAB_HEADER' => '1',
                        'WEAK_USAGE' => 8,
                        'ATTRIB_INSTR_IO' => 2048,
                        '8192' => 'INSTR_LDMEMSTARTVAL',
                        'MESSAGE' => '21',
                        'INSTR_RMC_CORE1' => 33554432,
                        '9' => 'LOAD_ZEROS',
                        '252' => 'PFX_2_NUMBER',
                        'INDEX_ENTRY' => '24',
                        '24' => 'INDEX_ENTRY',
                        'INSTR_LDDEVID' => 1024,
                        'BYTE_PATCH' => '17',
                        '30' => 'SYMBOL',
                        'INSTR_NO_SEMAPHORE' => 32768,
                        '12' => 'DEFINE_MAIN',
                        '13' => 'LOCAL_SYMBOLS',
                        'PFX_8_NUMBER' => '254',
                        'ADJUST_POINT' => '5',
                        '254' => 'PFX_8_NUMBER',
                        '23' => 'LIB_INDEX_END',
                        'SPECIFIC_SYMBOL' => '31',
                        'DEFINE_MAIN' => '12',
                        '253' => 'PFX_4_NUMBER',
                        'ATTRIB_NON_FPU_CALLING' => 262144,
                        'INSTR_MOVE2D' => 32,
                        'UNINDEXED_USAGE' => 32,
                        'ATTRIB_HALT' => 128,
                        '8388608' => 'INSTR_088_16',
                        'SYMBOL' => '30',
                        '256' => 'ROUTINE_USAGE',
                        'BOOL_TRUE' => '1',
                        '255' => 'SIGN_INDICATOR',
                        'LOAD_PREFIX' => '7',
                        '19' => 'REP_END',
                        'SS_VALUE' => '4',
                        'ATTRIB_UNIVERSAL' => 0,
                        'IMPORT_USAGE' => 4,
                        '64' => 'PROVISIONAL_USAGE',
                        '65536' => 'INSTR_NO_DEVICE'
                      }
         };

sub get ($) {
	my $key = shift;
	return $STORE->{$key};
}


package Transputer::Instructions;

use strict;

sub new ($) {
	my ($class) = @_;

	my $self = {
		'pri'	=> PLinker::get ('ins_pri'),
		'sec'	=> PLinker::get ('ins_sec')
	};

	$self = bless $self, $class;

	return $self;
}

sub compile ($$) {
	my ($store, $fn) = @_;
	my $pri = {};
	my $sec = {};
	my $ins;
	my $fh;

	open ($fh, $fn) || die $!;
	while (my $line = <$fh>) {
		$ins = $pri if $line =~ /primary instructions/;
		$ins = $sec if $line =~ /secondary instructions/;
		next if $line !~ /^#define I_(.+?)\s+(.*)/;
		
		my ($name, $value) = ($1, $2);
		my $v;
		
		$value =~ s/\/\/.*//;
		$value =~ s/\/\*.*\*\///;
		$value =~ s/\s+$//;
		
		if ($value =~ /^0x[0-9a-f]+$/i) {
			$v = hex ($value);
		} elsif ($value =~ /\(\s*0x([0-9a-f]+)\s*\|\s*I_([0-9a-z]+)\s*\)/i) {
			my ($value, $shift)	= ($1, $2);
			$v = hex ($value);
			if ($shift eq 'NEGATIVE') {
				$v = -$v;
			} else {
				$v |= $ins->{$shift};
			}
		}

		$ins->{$name}	= $v;
		$ins->{$v}	= $name;
	}
	close ($fh);

	$store->{'ins_pri'} = $pri;
	$store->{'ins_sec'} = $sec;
}

sub valid_primary ($$) {
	my ($self, $pri) = @_;
	return 1 if exists ($self->{'pri'}->{$pri});
}

sub valid_secondary ($$) {
	my ($self, $sec) = @_;
	return 1 if exists ($self->{'sec'}->{$sec});
}

sub valid_instruction ($$) {
	my ($self, $n) = @_;
	return ($self->valid_primary ($n) || $self->valid_secondary ($n));
}

sub primary ($$) {
	my ($self, $key) = @_;
	return $self->{'pri'}->{$key};
}

sub secondary ($$) {
	my ($self, $key) = @_;
	return $self->{'sec'}->{$key};
}

sub numeric ($$) {
	my ($self, $name) = @_;
	my $num = $self->{'pri'}->{$name} || $self->{'sec'}->{$name} || undef;
	return $num if $num =~ /^\d+$/;
}

package Transterpreter::Instructions;

use strict;

@Transterpreter::Instructions::ISA = qw(Transputer::Instructions);

sub new ($) {
	my ($class) = @_;
	my $self = new Transputer::Instructions ();
	$self = bless $self, $class;
	$self->load_tvm_instructions ();
	return $self;
}

sub load_tvm_instructions ($) {
	my ($self) = @_;
	my $data = PLinker::get ('tvm_ins');

	$self->{'tvm'} = {};

	foreach my $tuple (@$data) {
		my ($name, $number) = @$tuple;
		if (!$self->valid_instruction ($name)) {
			$self->{'tvm'}->{$number}	= $name;
			$self->{'tvm'}->{$name}		= $number;
		}
	}
}

sub compile ($$) {
	my ($store, $dir) = @_;
	my @data;
	my $dh;

	if (!opendir ($dh, $dir)) {
		print STDERR "Unable to open directory $dir: $!\n";
		return;
	}

	while (my $fn = readdir ($dh)) {
		next if $fn =~ /^\./;
		load_tvm_header (\@data, "$dir/$fn") if $fn =~ /\.h$/;
	}

	closedir ($dh);

	$store->{'tvm_ins'} = \@data;
}

sub load_tvm_header ($$) {
	my ($data, $fn) = @_;
	my $fh;

	open ($fh, $fn) || return;
	while (my $line = <$fh>) {
		next if $line !~ /^\/\*\s+0x([0-9a-f]+)\s+-[x \t0-9a-f]+-\s+(\S+).*\*\//i;
		my ($number, $name) = ($1, $2);
		$number = hex ($number);
		$name =~ tr/a-z/A-Z/;
		$name =~ s/^INS_//;
		push (@$data, [ $name, $number ]);
	}
	close ($fh);
}

sub valid_instruction ($$) {
	my ($self, $n) = @_;
	return (
		$self->valid_primary ($n)	|| 
		$self->valid_secondary ($n)	||
		exists ($self->{'tvm'}->{$n})
	);
}

sub numeric ($$) {
	my ($self, $name) = @_;
	my $num =
		$self->{'pri'}->{$name} || 
		$self->{'sec'}->{$name} || 
		$self->{'tvm'}->{$name} ||
		undef;

	return $num if $num =~ /^\d+$/;
}

#
#  Perl code for linking and assembling bytecode for the TVM
#  Copyright (C) 2008 Carl Ritson <cgr@kent.ac.uk>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#


package Transputer::TCOFF;

use strict;

sub new ($$) {
	my ($class, $tcoff_h) = @_;

	my $self	= {
		'tcoff'	=> PLinker::get ('tcoff')
	};
	
	$self = bless $self, $class;

	return $self;
}

sub read_int ($) {
	my $fh = shift;
	my $b;

	read ($fh, $b, 1) || return;
	$b = unpack ('C', $b);

	if ($b > 250 && $b <= 255) {
		my ($len, $n);

		if ($b == 255) {
			$len = 4;
		} else {
			$len = (1 << ($b - 251));
		}

		die "Invalid length $len" if $len > 4;

		read ($fh, $n, $len) || return;
		
		if ($len == 1) {
			$n = unpack ('C', $n);
		} elsif ($len == 2) {
			$n = unpack ('v', $n);
		} else {
			$n = unpack ('V', $n);
		}
		
		$n ^= $n if $b == 255;

		return $n;
	} else {
		return $b;
	}
}

sub decode_int {
	my ($self, $data);
	
	if (@_ > 1) {
		($self, $data) = @_;
	} else {
		($data) = @_;
	}

	my $b = unpack ('C', substr ($data, 0, 1));

	if ($b > 250 && $b <= 255) {
		my ($len, $n);

		if ($b == 255) {
			$len = 4;
		} else {
			$len = (1 << ($b - 251));
		}

		die "Invalid length $len" if $len > 4;

		my $n = substr ($data, 1, $len);
		
		if ($len == 1) {
			$n = unpack ('C', $n);
		} elsif ($len == 2) {
			$n = unpack ('v', $n);
		} else {
			$n = unpack ('V', $n);
		}
		
		$n ^= $n if $b == 255;

		return ($n, substr ($data, $len + 1));
	} else {
		return ($b, substr ($data, 1));
	}
}

sub read_file ($$) {
	my ($self, $filename)	= @_;
	my $tcoff		= $self->{'tcoff'};
	
	my $fh;
	my %sections;
	my @sections;

	if (!open ($fh, $filename)) {
		print STDERR "Unable to open $filename: $!\n";
		return;
	}

	binmode ($fh);
	while (!eof ($fh)) {
		my $r_tag	= read_int ($fh);
		my $r_len	= read_int ($fh);
		my $tag		= $tcoff->{$r_tag} || $r_tag;
		my $data;
		
		if ($r_len && !read ($fh, $data, $r_len)) {
			return;
		}
		
		my $section	= {
			'tag' 		=> $tag,
			'length'	=> $r_len,
			'data'		=> $data
		};

		$sections{$tag} = [] if !$sections{$tag};
		push (@{$sections{$tag}}, $section);
		push (@sections, $section);
	}
	close ($fh);

	$sections{'sections'} = \@sections;
	
	$self->decode_comments (\%sections);
	$self->decode_symbols (\%sections);

	return \%sections;
}

sub decode_symbols ($$) {
	my ($self, $file) 	= @_;
	my $tcoff		= $self->{'tcoff'};
	my $symbol_id		= 0;
	my %symbols;

	foreach my $section (@{$file->{'sections'}}) {
		my $tag		= $section->{'tag'};
		my $data	= $section->{'data'};

		if ($tag eq 'SECTION' || $tag eq 'SYMBOL' || $tag eq 'SPECIFIC_SYMBOL') {
			my ($type, $scope, $len, $str, $origin_id);

			($type, $data)	= decode_int ($data)
				if $tag eq 'SECTION';

			($scope, $data) = decode_int ($data);
			($len, $data)	= decode_int ($data);

			$str		= substr ($data, 0, $len);
			$data		= substr ($data, $len);
			
			($origin_id, $data) = decode_int ($data)
				if $tag eq 'SPECIFIC_SYMBOL';

			my $sym = {
				'type'		=> $type,
				'scope'		=> $scope, 
				'string'	=> $str,
				'origin_id'	=> $origin_id
			};
			$symbols{'@' . $symbol_id++}	= $sym;
			$symbols{$str}			= $sym;
		} elsif ($tag eq 'DESCRIPTOR') {
			my ($id, $data) = decode_int ($data);

			$id = '@' . $id;
			
			if (exists ($symbols{$id}) && $symbols{$id}->{'scope'} == ($tcoff->{'EXPORT_USAGE'} | $tcoff->{'ROUTINE_USAGE'})) {
				my $symbol	= $symbols{$id};
				my ($lang, $p_len, $ws, $vs, $ms);

				($lang, $data)	= decode_int ($data);
				($p_len, $data)	= decode_int ($data);
				($ws, $data)	= decode_int ($data);
				($vs, $data)	= decode_int ($data);
				($ms, $data)	= decode_int ($data);

				$symbol->{'definition'} = $data;
				$symbol->{'ws'}		= $ws;
				$symbol->{'vs'}		= $vs;
				$symbol->{'ms'}		= $ms;
			}
		}
	}

	$file->{'symbols'} = \%symbols;
}

sub decode_comments ($$) {
	my ($self, $file) 	= @_;
	my $tcoff		= $self->{'tcoff'};
	
	foreach my $comment (@{$file->{'COMMENT'}}) {
		my ($copy, $print, $s_len);
		my $data	= $comment->{'data'};

		($copy, $data)	= decode_int ($data);
		($print, $data)	= decode_int ($data);
		($s_len, $data) = decode_int ($data);

		if ($print && $data =~ /^(\.[A-Z0-9\.]+)\s*(.+)$/) {
			my ($cmd, $data) = ($1, $2);
			$file->{$cmd} = [] if !$file->{$cmd};
			push (@{$file->{$cmd}}, $data);
		}
	}
}

sub compile ($$) {
	my ($store, $fn) = @_;
	my $tcoff = {};
	my $fh;

	open ($fh, $fn) || die $!;
	while (my $line = <$fh>) {
		if ($line =~ /^#define (.+?)_TAG\s+(\d+)/) {
			my ($name, $value) = ($1, $2);
			
			$tcoff->{$name}	 = $value;
			$tcoff->{$value} = $name if !exists ($tcoff->{$value});
		} elsif ($line =~ /^#define (.+?)\s+(\d+|0x[0-9a-f]+)\s*$/) {
			my ($name, $value) = ($1, $2);
			$value = hex ($value) if $value =~ /^0x/;

			$tcoff->{$name}	 = $value;
			$tcoff->{$value} = $name if !exists ($tcoff->{$value});
		}
	}
	close ($fh);

	$store->{'tcoff'} = $tcoff;
}


package Transputer::ETC;

use strict;

sub new ($$) {
	my ($class, $instruct_h) = @_;

	my $self	= {
		'instr'	=> new Transputer::Instructions ($instruct_h),
	};
	
	$self = bless $self, $class;

	$self->define_constants ();

	return $self;
}

sub decode_fn_opd ($$$) {
	my ($self, $data, $pos) = @_;
	my $instr		= $self->{'instr'};
	my $PFIX 		= $instr->primary ('PFIX');
	my $NFIX 		= $instr->primary ('NFIX');
	my ($fn, $opd) 		= (0, 0);
	
	while ($pos < @$data) {
		my $b	= unpack ('C', $data->[$pos++]);
		$fn	= ($b & 0xf0);
		$opd 	= $opd | ($b & 0x0f);
		
		if ($fn == $PFIX) {
			$opd <<= 4;
		} elsif ($fn == $NFIX) {
			$opd = ((~$opd) << 4) & 0xffffffff;
		} else {
			return ($fn, $opd, $pos);
		}
	}

	return (undef, undef, undef);
}

sub fix_sign ($) {
	my $val = shift;
	$val = $val - (2 ** 32) if $val >= (2 ** 31);
	return $val;
}

sub decode ($$) {
	my ($self, $data)	= @_;
	my @data		= split (//, $data);
	my $instr		= $self->{'instr'};
	my $LDC			= $instr->primary ('LDC');
	my $OPR			= $instr->primary ('OPR');
	my $pos			= 0;
	my @text;

	while ($pos < @data) {
		my ($fn, $opd);
		
		($fn, $opd, $pos) = $self->decode_fn_opd (\@data, $pos);
		return if !defined ($pos);

		if ($fn == $OPR) {
			if ($instr->valid_secondary ($opd)) {
				push (@text, { 
					'name' => $instr->secondary ($opd)
				});
			} elsif (exists ($self->{$opd})) {
				my $tag		= $self->{$opd};
				my @params	= split (//, $tag->{'p'});

				for (my $i = 0; $i < @params; ++$i) {
					my $p = $params[$i];
					my ($fn, $opd);
				
					($fn, $opd, $pos) = $self->decode_fn_opd (\@data, $pos);
					return if !defined ($pos);

					if ($p =~ /^[bcdlsx]$/ && $fn != $LDC) {
						die "Invalid operation while loading constant: $fn $opd";
					}

					if ($p =~ /^[bs]$/) {
						return if $pos + $opd >= @data;
						$p	= join ('', @data[$pos..($pos + $opd - 1)]);
						$pos	= $pos + $opd;
					} elsif ($p eq 'l') {
						$p = "L$opd";
					} elsif ($p eq 'c') {
						$p = $opd;
					} elsif ($p eq 'x') {
						die "Unknown special $opd" if !exists ($tag->{'specials'}->{$opd});
						$p = { 'name' => $tag->{'specials'}->{$opd} };
					} else {
						my $name = $instr->primary ($fn);
						if ($tag->{'name'} eq 'LABEL' && (@params == 1)) {
							if ($name eq 'LDC') {
								push (@params, 'i');
							}	
							$opd = "L$opd";
						} else {
							$opd = fix_sign ($opd);
						}
						$p = { 
							'name'	=> $name, 
							'arg'	=> $opd
						};
					}

					$params[$i] = $p;
				}
				
				push (@text, {
					'name' 	=> '.' . $tag->{'name'},
					'arg'	=>
						(@params <= 1	? 
						 $params[0]	:
						 \@params)
				});
			} else {
				die "Unknown operation operand $opd";
			}
		} else {
			push (@text, {
				'name'	=> $instr->primary ($fn),
				'arg'	=> fix_sign ($opd)
			});
		}
	}

	return @text;
}

sub decode_str ($$) {
	my ($self, $data) = @_;
	my ($code, $str_len);
	$code = substr ($data, 0, 2);
	$data = substr ($data, 2);
	($str_len, $data) = Transputer::TCOFF::decode_int ($data);
	return substr ($data, 0, $str_len);
}

sub decode_load_text ($$) {
	my ($self, $data) = @_;
	my $code_len;
	($code_len, $data) = Transputer::TCOFF::decode_int ($data);
	return $self->decode (substr ($data, 0, $code_len));
}

sub define_constants ($) {
	my $self = shift;
	my %tags = (
		# Annotations
		'SPECIAL'	=> { 'i' => 0x00, 'p' => 'x' },
		'TSDEPTH'	=> { 'i' => 0x01 },
		'FUNCRESULTS'	=> { 'i' => 0x02 },
		'FUNCRETURN'	=> { 'i' => 0x03 },
		'ENDWS'		=> { 'i' => 0x04 },
		'REALRESULT'	=> { 'i' => 0x05 },
		'SETLAB'	=> { 'i' => 0x06 },
		'SECTIONLAB'	=> { 'i' => 0x07 },
		'ALIGN'		=> { 'i' => 0x08 },
		'LINE'		=> { 'i' => 0x09 },
		'DEBUGLINE'	=> { 'i' => 0x0a },
		'SETWS'		=> { 'i' => 0x0b },
		'SETVS'		=> { 'i' => 0x0c },
		'SLLIMM'	=> { 'i' => 0x0d, 'p' => 'c' },
		'SLRIMM'	=> { 'i' => 0x0e, 'p' => 'c' },
		'LOOPHEADTOP'	=> { 'i' => 0x0f },
		# Strings
		'STUBNAME'	=> { 'i' => 0x11, 'p' => 's' },
		'GLOBAL'	=> { 'i' => 0x12, 'p' => 's' },
		'JUMPENTRY'	=> { 'i' => 0x13, 'p' => 's' },
		'PROC'		=> { 'i' => 0x14, 'p' => 's' },
		'FILENAME'	=> { 'i' => 0x15, 'p' => 's' },
		'OCCCOMMENT'	=> { 'i' => 0x16, 'p' => 's' },
		'CODEMAP'	=> { 'i' => 0x17, 'p' => 's' },
		'DATABYTES'	=> { 'i' => 0x18, 'p' => 'b' },
		'MESSAGEBYTES'	=> { 'i' => 0x19, 'p' => 'b' },
		'LOADLABELNAME'	=> { 'i' => 0x1a, 'p' => 's' },
		'LOADCODEMAPNAME'=> { 'i' => 0x1b, 'p' => 's' },
		'GLOBALEND'	=> { 'i' => 0x1c, 'p' => 's' },
		# Labels
		'LABEL'		=> { 'i' => 0x20, 'p' => 'i' },
		'LEND'		=> { 'i' => 0x21, 'p' => 'pll' },
		'LEND3'		=> { 'i' => 0x22, 'p' => 'pll' },
		'LENDB'		=> { 'i' => 0x23, 'p' => 'pll' },
		'MS_USAGE'	=> { 'i' => 0x24 },
		'MS_INIT'	=> { 'i' => 0x25 },
		'TCOFF_RECORD'	=> { 'i' => 0x26 },
		'LOADWSMAP'	=> { 'i' => 0x27 },
		'UNLOADWSMAP'	=> { 'i' => 0x28 },
	);
	my %specials = (
		'BOOLINVERT'	=> 1,
		'STARTTABLE'	=> 2,
		'WIDENSHORT'	=> 3,
		'LOOPHEADBOT'	=> 4,
		'CONTRSPLIT'	=> 5,
		'CONTRJOIN'	=> 6,
		'I64TOREAL'	=> 7,
		'NOTPROCESS'	=> 8,
		'FPPOP'		=> 9,
		'CHECKNOTNULL'	=> 10,
		'SEMCLAIM'	=> 11,
		'SEMRELEASE'	=> 12,
		'SEMINIT'	=> 13,
		'RESCHEDULE'	=> 14,
		'INDIRECT_AREG'	=> 15,
		'INDIRECT_BREG'	=> 16,
		'INDIRECT_CREG'	=> 17,
		'RMWSMAP'	=> 18,
		'MPPCLONE'	=> 19,
		'MPPSERIALISE'	=> 20,
		'MPPDESERIALISE'=> 21,
		'LOADCODEMAP'	=> 22,
		'R32SIN'	=> 30,
		'R64SIN'	=> 31,
		'R32COS'	=> 32,
		'R64COS'	=> 33,
		'DTRACE'	=> 34,
		'KILLCALL'	=> 35,
		'WAIT_FOR_INTERRUPT' => 36,
		'R32TAN'	=> 37,
		'R64TAN'	=> 38
	);

	foreach my $key (keys (%specials)) {
		$specials{$specials{$key}} = $key;
	}

	$tags{'SPECIAL'}->{'specials'} = \%specials;

	foreach my $key (keys (%tags)) {
		my $val = $tags{$key};
		my $opd = $val->{'i'} | 0xffffff00;
		$val->{'name'}	= $key;
		$val->{'opd'}	= $opd;
		$val->{'p'}	= 'c' if !exists ($val->{'p'});
		$self->{$key}	= $val;
		$self->{$opd}	= $val;
	}
}


package main;

use strict;
use Data::Dumper;

# ETC Decoder
my $etc		= new Transputer::ETC ();

# TCOFF Decoder
my $tcoff	= new Transputer::TCOFF ();

# Command Line Parsing
my ($first, @files) = @ARGV;
my $comments;
if ($first eq '-C') {
	$comments = 1;
} elsif ($first) {
	unshift (@files, $first) if $first ne '--';
}

if (!@files) {
	print "tce-dump.pl [-C] <file> [<file> ...]\n";
	exit 1;
}

foreach my $file (@files) {
	# Decode
	my $data = $tcoff->read_file ($file);
	die "Failed to read $file" if !$data;

	if ($comments) {
		foreach my $comment (@{$data->{'COMMENT'}}) {
			my $data = $etc->decode_str ($comment->{'data'});
			print "$data\n";
		}
	} else {
		# Textualise
		foreach my $section (@{$data->{'LOAD_TEXT'}}) {
			my @text	= $etc->decode_load_text ($section->{'data'});
			my $indent	= "";

			if (!@text) {
				print STDERR "Failed to decode a text segment...\n";
				next;
			}

			foreach my $op (@text) {
				my $name = $op->{'name'};

				print_op ($indent, $op);
				
				if ($name eq '.PROC') {
					$indent = "\t";
				} elsif ($name eq '.GLOBALEND' || $name eq '.SECTIONLAB') {
					$indent = "";
				}
			}
		}
	}
}

exit 0;

sub print_op ($$) {
	my ($indent, $op)	= @_;
	my %indent		= (
		'.PROC'		=> "",
		'.STUBNAME'	=> "",
		'.GLOBALEND'	=> ""
	);

	my $name	= $op->{'name'};
	my $arg		= $op->{'arg'};

	if (exists ($indent{$name})) {
		$indent = $indent{$name};
	};

	if ($name eq '.OCCCOMMENT') {
		$arg =~ s/[\r\n]/ /gs;
		print "-- $arg\n";
	} elsif ($name =~ /^\.(SET|SECTION)LAB$/) {
		print "\n" if $name eq '.SECTIONLAB';
		print ".L$arg:\n";
	} elsif ($name =~ /\..*BYTES$/) {
		my $bytes	= unpack ('H*', $arg);
		my @bytes	= ($bytes =~ /(..)/g);
		my $text	= join (' ', @bytes) . ' ';
		my @lines	= ($text =~ /(.{0,48})/g);
		print "$name ", length ($arg), "\n";
		foreach my $line (@lines) {
			print "\t$line\n" if $line;
		}
	} elsif ($name eq '.LABEL' && ref ($arg) =~ /^ARRAY/) {
		my $l1 = $arg->[0];
		my $l2 = $arg->[1];
		if ($l2->{'arg'} < 0) {
			print_op ($indent, $l1);
		} else {
			print $indent, $l1->{'name'}, "\t", $l1->{'arg'}, "-L", $l2->{'arg'}, "\n";
		}
	} elsif (exists ($op->{'arg'})) {
		if (ref ($arg)) {
			my @params = ref ($arg) =~ /^ARRAY/ ? @$arg : ( $arg );
			my @tparam;
			foreach my $p (@params) {
				if (ref ($p)) {
					print_op ($indent, $p);
				} else {
					push (@tparam, $p);
				}
			}
			if (@tparam) {
				print $indent, "$name\t", join (', ', @tparam), "\n";
			} else {
				#print $indent, $name, "\n";
			}
		} else {
			print $indent, "$name\t$arg\n";
		}
	} else {
		print $indent, "$name\n";
	}
}
