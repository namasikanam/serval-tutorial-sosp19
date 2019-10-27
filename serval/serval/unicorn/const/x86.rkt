#lang racket/base

(require ffi/unsafe)

(provide (all-defined-out))

(define _uc_x86_reg
  (_enum '(invalid = 0
           ah = 1
           al = 2
           ax = 3
           bh = 4
           bl = 5
           bp = 6
           bpl = 7
           bx = 8
           ch = 9
           cl = 10
           cs = 11
           cx = 12
           dh = 13
           di = 14
           dil = 15
           dl = 16
           ds = 17
           dx = 18
           eax = 19
           ebp = 20
           ebx = 21
           ecx = 22
           edi = 23
           edx = 24
           eflags = 25
           eip = 26
           eiz = 27
           es = 28
           esi = 29
           esp = 30
           fpsw = 31
           fs = 32
           gs = 33
           ip = 34
           rax = 35
           rbp = 36
           rbx = 37
           rcx = 38
           rdi = 39
           rdx = 40
           rip = 41
           riz = 42
           rsi = 43
           rsp = 44
           si = 45
           sil = 46
           sp = 47
           spl = 48
           ss = 49
           cr0 = 50
           cr1 = 51
           cr2 = 52
           cr3 = 53
           cr4 = 54
           cr5 = 55
           cr6 = 56
           cr7 = 57
           cr8 = 58
           cr9 = 59
           cr10 = 60
           cr11 = 61
           cr12 = 62
           cr13 = 63
           cr14 = 64
           cr15 = 65
           dr0 = 66
           dr1 = 67
           dr2 = 68
           dr3 = 69
           dr4 = 70
           dr5 = 71
           dr6 = 72
           dr7 = 73
           dr8 = 74
           dr9 = 75
           dr10 = 76
           dr11 = 77
           dr12 = 78
           dr13 = 79
           dr14 = 80
           dr15 = 81
           fp0 = 82
           fp1 = 83
           fp2 = 84
           fp3 = 85
           fp4 = 86
           fp5 = 87
           fp6 = 88
           fp7 = 89
           k0 = 90
           k1 = 91
           k2 = 92
           k3 = 93
           k4 = 94
           k5 = 95
           k6 = 96
           k7 = 97
           mm0 = 98
           mm1 = 99
           mm2 = 100
           mm3 = 101
           mm4 = 102
           mm5 = 103
           mm6 = 104
           mm7 = 105
           r8 = 106
           r9 = 107
           r10 = 108
           r11 = 109
           r12 = 110
           r13 = 111
           r14 = 112
           r15 = 113
           st0 = 114
           st1 = 115
           st2 = 116
           st3 = 117
           st4 = 118
           st5 = 119
           st6 = 120
           st7 = 121
           xmm0 = 122
           xmm1 = 123
           xmm2 = 124
           xmm3 = 125
           xmm4 = 126
           xmm5 = 127
           xmm6 = 128
           xmm7 = 129
           xmm8 = 130
           xmm9 = 131
           xmm10 = 132
           xmm11 = 133
           xmm12 = 134
           xmm13 = 135
           xmm14 = 136
           xmm15 = 137
           xmm16 = 138
           xmm17 = 139
           xmm18 = 140
           xmm19 = 141
           xmm20 = 142
           xmm21 = 143
           xmm22 = 144
           xmm23 = 145
           xmm24 = 146
           xmm25 = 147
           xmm26 = 148
           xmm27 = 149
           xmm28 = 150
           xmm29 = 151
           xmm30 = 152
           xmm31 = 153
           ymm0 = 154
           ymm1 = 155
           ymm2 = 156
           ymm3 = 157
           ymm4 = 158
           ymm5 = 159
           ymm6 = 160
           ymm7 = 161
           ymm8 = 162
           ymm9 = 163
           ymm10 = 164
           ymm11 = 165
           ymm12 = 166
           ymm13 = 167
           ymm14 = 168
           ymm15 = 169
           ymm16 = 170
           ymm17 = 171
           ymm18 = 172
           ymm19 = 173
           ymm20 = 174
           ymm21 = 175
           ymm22 = 176
           ymm23 = 177
           ymm24 = 178
           ymm25 = 179
           ymm26 = 180
           ymm27 = 181
           ymm28 = 182
           ymm29 = 183
           ymm30 = 184
           ymm31 = 185
           zmm0 = 186
           zmm1 = 187
           zmm2 = 188
           zmm3 = 189
           zmm4 = 190
           zmm5 = 191
           zmm6 = 192
           zmm7 = 193
           zmm8 = 194
           zmm9 = 195
           zmm10 = 196
           zmm11 = 197
           zmm12 = 198
           zmm13 = 199
           zmm14 = 200
           zmm15 = 201
           zmm16 = 202
           zmm17 = 203
           zmm18 = 204
           zmm19 = 205
           zmm20 = 206
           zmm21 = 207
           zmm22 = 208
           zmm23 = 209
           zmm24 = 210
           zmm25 = 211
           zmm26 = 212
           zmm27 = 213
           zmm28 = 214
           zmm29 = 215
           zmm30 = 216
           zmm31 = 217
           r8b = 218
           r9b = 219
           r10b = 220
           r11b = 221
           r12b = 222
           r13b = 223
           r14b = 224
           r15b = 225
           r8d = 226
           r9d = 227
           r10d = 228
           r11d = 229
           r12d = 230
           r13d = 231
           r14d = 232
           r15d = 233
           r8w = 234
           r9w = 235
           r10w = 236
           r11w = 237
           r12w = 238
           r13w = 239
           r14w = 240
           r15w = 241
           idtr = 242
           gdtr = 243
           ldtr = 244
           tr = 245
           fpcw = 246
           fptag = 247
           msr = 248
           mxcsr = 249
           ending = 250)))

(define _uc_x86_ins_
  (_enum '(nvalid = 0
           aa = 1
           ad = 2
           am = 3
           as = 4
           abs = 5
           dc = 6
           dcx = 7
           dd = 8
           ddpd = 9
           ddps = 10
           ddsd = 11
           ddss = 12
           ddsubpd = 13
           ddsubps = 14
           add = 15
           iadd = 16
           addp = 17
           dox = 18
           esdeclast = 19
           esdec = 20
           esenclast = 21
           esenc = 22
           esimc = 23
           eskeygenassist = 24
           nd = 25
           ndn = 26
           ndnpd = 27
           ndnps = 28
           ndpd = 29
           ndps = 30
           rpl = 31
           extr = 32
           lcfill = 33
           lci = 34
           lcic = 35
           lcmsk = 36
           lcs = 37
           lendpd = 38
           lendps = 39
           lendvpd = 40
           lendvps = 41
           lsfill = 42
           lsi = 43
           lsic = 44
           lsmsk = 45
           lsr = 46
           ound = 47
           sf = 48
           sr = 49
           swap = 50
           t = 51
           tc = 52
           tr = 53
           ts = 54
           zhi = 55
           all = 56
           bw = 57
           dq = 58
           dqe = 59
           chs = 60
           lac = 61
           lc = 62
           ld = 63
           lflush = 64
           lflushopt = 65
           lgi = 66
           li = 67
           lts = 68
           lwb = 69
           mc = 70
           mova = 71
           movae = 72
           movb = 73
           movbe = 74
           cmovbe = 75
           cmovb = 76
           move = 77
           cmove = 78
           movg = 79
           movge = 80
           movl = 81
           movle = 82
           cmovnbe = 83
           cmovnb = 84
           movne = 85
           cmovne = 86
           movno = 87
           movnp = 88
           cmovnu = 89
           movns = 90
           movo = 91
           movp = 92
           cmovu = 93
           movs = 94
           mp = 95
           mppd = 96
           mpps = 97
           mpsb = 98
           mpsd = 99
           mpsq = 100
           mpss = 101
           mpsw = 102
           mpxchg16b = 103
           mpxchg = 104
           mpxchg8b = 105
           omisd = 106
           omiss = 107
           comp = 108
           compi = 109
           comi = 110
           com = 111
           cos = 112
           puid = 113
           qo = 114
           rc32 = 115
           vtdq2pd = 116
           vtdq2ps = 117
           vtpd2dq = 118
           vtpd2ps = 119
           vtps2dq = 120
           vtps2pd = 121
           vtsd2si = 122
           vtsd2ss = 123
           vtsi2sd = 124
           vtsi2ss = 125
           vtss2sd = 126
           vtss2si = 127
           vttpd2dq = 128
           vttps2dq = 129
           vttsd2si = 130
           vttss2si = 131
           wd = 132
           wde = 133
           aa = 134
           as = 135
           ata16 = 136
           ec = 137
           iv = 138
           ivpd = 139
           ivps = 140
           divr = 141
           idivr = 142
           divrp = 143
           ivsd = 144
           ivss = 145
           div = 146
           idiv = 147
           divp = 148
           ppd = 149
           pps = 150
           et = 151
           ncls = 152
           nclu = 153
           nter = 154
           xtractps = 155
           xtrq = 156
           2xm1 = 157
           call = 158
           jmp = 159
           bld = 160
           bstp = 161
           compp = 162
           decstp = 163
           emms = 164
           free = 165
           icom = 166
           icomp = 167
           incstp = 168
           ldcw = 169
           ldenv = 170
           ldl2e = 171
           ldl2t = 172
           ldlg2 = 173
           ldln2 = 174
           ldpi = 175
           nclex = 176
           ninit = 177
           nop = 178
           nstcw = 179
           nstsw = 180
           patan = 181
           prem = 182
           prem1 = 183
           ptan = 184
           freep = 185
           rndint = 186
           rstor = 187
           nsave = 188
           scale = 189
           setpm = 190
           sincos = 191
           nstenv = 192
           xam = 193
           xrstor = 194
           xrstor64 = 195
           xsave = 196
           xsave64 = 197
           xtract = 198
           yl2x = 199
           yl2xp1 = 200
           ovapd = 201
           ovaps = 202
           rpd = 203
           rps = 204
           movapd = 205
           movaps = 206
           orpd = 207
           orps = 208
           etsec = 209
           addpd = 210
           addps = 211
           lt = 212
           subpd = 213
           subps = 214
           div = 215
           ild = 216
           mul = 217
           n = 218
           nc = 219
           nsb = 220
           nsertps = 221
           nsertq = 222
           nsd = 223
           nsw = 224
           nt = 225
           nt1 = 226
           nt3 = 227
           nto = 228
           nvd = 229
           nvept = 230
           nvlpg = 231
           nvlpga = 232
           nvpcid = 233
           nvvpid = 234
           ret = 235
           retd = 236
           retq = 237
           isttp = 238
           ist = 239
           istp = 240
           comisd = 241
           comiss = 242
           comisd = 243
           comiss = 244
           cvtsd2ss = 245
           cvtsi2sd = 246
           cvtsi2ss = 247
           cvtss2sd = 248
           cvttsd2si = 249
           cvttsd2usi = 250
           cvttss2si = 251
           cvttss2usi = 252
           cvtusi2sd = 253
           cvtusi2ss = 254
           ucomisd = 255
           ucomiss = 256
           ae = 257
           a = 258
           be = 259
           b = 260
           cxz = 261
           ecxz = 262
           e = 263
           ge = 264
           g = 265
           le = 266
           l = 267
           mp = 268
           ne = 269
           no = 270
           np = 271
           ns = 272
           o = 273
           p = 274
           rcxz = 275
           s = 276
           andb = 277
           andd = 278
           andnb = 279
           andnd = 280
           andnq = 281
           andnw = 282
           andq = 283
           andw = 284
           movb = 285
           movd = 286
           movq = 287
           movw = 288
           notb = 289
           notd = 290
           notq = 291
           notw = 292
           orb = 293
           ord = 294
           orq = 295
           ortestb = 296
           ortestd = 297
           ortestq = 298
           ortestw = 299
           orw = 300
           shiftlb = 301
           shiftld = 302
           shiftlq = 303
           shiftlw = 304
           shiftrb = 305
           shiftrd = 306
           shiftrq = 307
           shiftrw = 308
           unpckbw = 309
           xnorb = 310
           xnord = 311
           xnorq = 312
           xnorw = 313
           xorb = 314
           xord = 315
           xorq = 316
           xorw = 317
           ahf = 318
           ar = 319
           ddqu = 320
           dmxcsr = 321
           ds = 322
           ldz = 323
           ld1 = 324
           ld = 325
           ea = 326
           eave = 327
           es = 328
           fence = 329
           fs = 330
           gdt = 331
           gs = 332
           idt = 333
           ldt = 334
           msw = 335
           r = 336
           ub = 337
           or = 338
           odsb = 339
           odsd = 340
           odsq = 341
           odsw = 342
           oop = 343
           oope = 344
           oopne = 345
           etf = 346
           etfq = 347
           sl = 348
           ss = 349
           tr = 350
           add = 351
           zcnt = 352
           askmovdqu = 353
           axpd = 354
           axps = 355
           axsd = 356
           axss = 357
           fence = 358
           inpd = 359
           inps = 360
           insd = 361
           inss = 362
           vtpd2pi = 363
           vtpi2pd = 364
           vtpi2ps = 365
           vtps2pi = 366
           vttpd2pi = 367
           vttps2pi = 368
           mms = 369
           askmovq = 370
           ovd = 371
           ovdq2q = 372
           ovntq = 373
           ovq2dq = 374
           ovq = 375
           absb = 376
           absd = 377
           absw = 378
           ackssdw = 379
           acksswb = 380
           ackuswb = 381
           addb = 382
           addd = 383
           addq = 384
           addsb = 385
           addsw = 386
           addusb = 387
           addusw = 388
           addw = 389
           alignr = 390
           andn = 391
           and = 392
           avgb = 393
           avgw = 394
           cmpeqb = 395
           cmpeqd = 396
           cmpeqw = 397
           cmpgtb = 398
           cmpgtd = 399
           cmpgtw = 400
           extrw = 401
           haddsw = 402
           haddw = 403
           haddd = 404
           hsubd = 405
           hsubsw = 406
           hsubw = 407
           insrw = 408
           maddubsw = 409
           maddwd = 410
           maxsw = 411
           maxub = 412
           minsw = 413
           minub = 414
           movmskb = 415
           mulhrsw = 416
           mulhuw = 417
           mulhw = 418
           mullw = 419
           muludq = 420
           or = 421
           sadbw = 422
           shufb = 423
           shufw = 424
           signb = 425
           signd = 426
           signw = 427
           slld = 428
           sllq = 429
           sllw = 430
           srad = 431
           sraw = 432
           srld = 433
           srlq = 434
           srlw = 435
           subb = 436
           subd = 437
           subq = 438
           subsb = 439
           subsw = 440
           subusb = 441
           subusw = 442
           subw = 443
           unpckhbw = 444
           unpckhdq = 445
           unpckhwd = 446
           unpcklbw = 447
           unpckldq = 448
           unpcklwd = 449
           xor = 450
           onitor = 451
           ontmul = 452
           ov = 453
           ovabs = 454
           ovbe = 455
           ovddup = 456
           ovdqa = 457
           ovdqu = 458
           ovhlps = 459
           ovhpd = 460
           ovhps = 461
           ovlhps = 462
           ovlpd = 463
           ovlps = 464
           ovmskpd = 465
           ovmskps = 466
           ovntdqa = 467
           ovntdq = 468
           ovnti = 469
           ovntpd = 470
           ovntps = 471
           ovntsd = 472
           ovntss = 473
           ovsb = 474
           ovsd = 475
           ovshdup = 476
           ovsldup = 477
           ovsq = 478
           ovss = 479
           ovsw = 480
           ovsx = 481
           ovsxd = 482
           ovupd = 483
           ovups = 484
           ovzx = 485
           psadbw = 486
           ul = 487
           ulpd = 488
           ulps = 489
           ulsd = 490
           ulss = 491
           ulx = 492
           mul = 493
           imul = 494
           mulp = 495
           wait = 496
           eg = 497
           op = 498
           ot = 499
           ut = 500
           utsb = 501
           utsd = 502
           utsw = 503
           ackusdw = 504
           ause = 505
           avgusb = 506
           blendvb = 507
           blendw = 508
           clmulqdq = 509
           cmpeqq = 510
           cmpestri = 511
           cmpestrm = 512
           cmpgtq = 513
           cmpistri = 514
           cmpistrm = 515
           commit = 516
           dep = 517
           ext = 518
           extrb = 519
           extrd = 520
           extrq = 521
           f2id = 522
           f2iw = 523
           facc = 524
           fadd = 525
           fcmpeq = 526
           fcmpge = 527
           fcmpgt = 528
           fmax = 529
           fmin = 530
           fmul = 531
           fnacc = 532
           fpnacc = 533
           frcpit1 = 534
           frcpit2 = 535
           frcp = 536
           frsqit1 = 537
           frsqrt = 538
           fsubr = 539
           fsub = 540
           hminposuw = 541
           i2fd = 542
           i2fw = 543
           insrb = 544
           insrd = 545
           insrq = 546
           maxsb = 547
           maxsd = 548
           maxud = 549
           maxuw = 550
           minsb = 551
           minsd = 552
           minud = 553
           minuw = 554
           movsxbd = 555
           movsxbq = 556
           movsxbw = 557
           movsxdq = 558
           movsxwd = 559
           movsxwq = 560
           movzxbd = 561
           movzxbq = 562
           movzxbw = 563
           movzxdq = 564
           movzxwd = 565
           movzxwq = 566
           muldq = 567
           mulhrw = 568
           mulld = 569
           op = 570
           opaw = 571
           opal = 572
           opcnt = 573
           opf = 574
           opfd = 575
           opfq = 576
           refetch = 577
           refetchnta = 578
           refetcht0 = 579
           refetcht1 = 580
           refetcht2 = 581
           refetchw = 582
           shufd = 583
           shufhw = 584
           shuflw = 585
           slldq = 586
           srldq = 587
           swapd = 588
           test = 589
           unpckhqdq = 590
           unpcklqdq = 591
           ush = 592
           ushaw = 593
           ushal = 594
           ushf = 595
           ushfd = 596
           ushfq = 597
           cl = 598
           cpps = 599
           cpss = 600
           cr = 601
           dfsbase = 602
           dgsbase = 603
           dmsr = 604
           dpmc = 605
           drand = 606
           dseed = 607
           dtsc = 608
           dtscp = 609
           ol = 610
           or = 611
           orx = 612
           oundpd = 613
           oundps = 614
           oundsd = 615
           oundss = 616
           sm = 617
           sqrtps = 618
           sqrtss = 619
           ahf = 620
           al = 621
           alc = 622
           ar = 623
           arx = 624
           bb = 625
           casb = 626
           casd = 627
           casq = 628
           casw = 629
           etae = 630
           eta = 631
           etbe = 632
           etb = 633
           ete = 634
           etge = 635
           etg = 636
           etle = 637
           etl = 638
           etne = 639
           etno = 640
           etnp = 641
           etns = 642
           eto = 643
           etp = 644
           ets = 645
           fence = 646
           gdt = 647
           ha1msg1 = 648
           ha1msg2 = 649
           ha1nexte = 650
           ha1rnds4 = 651
           ha256msg1 = 652
           ha256msg2 = 653
           ha256rnds2 = 654
           hl = 655
           hld = 656
           hlx = 657
           hr = 658
           hrd = 659
           hrx = 660
           hufpd = 661
           hufps = 662
           idt = 663
           sin = 664
           kinit = 665
           ldt = 666
           msw = 667
           qrtpd = 668
           qrtps = 669
           qrtsd = 670
           qrtss = 671
           sqrt = 672
           tac = 673
           tc = 674
           td = 675
           tgi = 676
           ti = 677
           tmxcsr = 678
           tosb = 679
           tosd = 680
           tosq = 681
           tosw = 682
           tr = 683
           st = 684
           stp = 685
           stpnce = 686
           xch = 687
           ubpd = 688
           ubps = 689
           subr = 690
           isubr = 691
           subrp = 692
           ubsd = 693
           ubss = 694
           sub = 695
           isub = 696
           subp = 697
           wapgs = 698
           yscall = 699
           ysenter = 700
           ysexit = 701
           ysret = 702
           1mskc = 703
           est = 704
           d2 = 705
           tst = 706
           zcnt = 707
           zmsk = 708
           ucompi = 709
           ucomi = 710
           ucompp = 711
           ucomp = 712
           ucom = 713
           d2b = 714
           npckhpd = 715
           npckhps = 716
           npcklpd = 717
           npcklps = 718
           addpd = 719
           addps = 720
           addsd = 721
           addss = 722
           addsubpd = 723
           addsubps = 724
           aesdeclast = 725
           aesdec = 726
           aesenclast = 727
           aesenc = 728
           aesimc = 729
           aeskeygenassist = 730
           alignd = 731
           alignq = 732
           andnpd = 733
           andnps = 734
           andpd = 735
           andps = 736
           blendmpd = 737
           blendmps = 738
           blendpd = 739
           blendps = 740
           blendvpd = 741
           blendvps = 742
           broadcastf128 = 743
           broadcasti32x4 = 744
           broadcasti64x4 = 745
           broadcastsd = 746
           broadcastss = 747
           cmppd = 748
           cmpps = 749
           cmpsd = 750
           cmpss = 751
           compresspd = 752
           compressps = 753
           cvtdq2pd = 754
           cvtdq2ps = 755
           cvtpd2dqx = 756
           cvtpd2dq = 757
           cvtpd2psx = 758
           cvtpd2ps = 759
           cvtpd2udq = 760
           cvtph2ps = 761
           cvtps2dq = 762
           cvtps2pd = 763
           cvtps2ph = 764
           cvtps2udq = 765
           cvtsd2si = 766
           cvtsd2usi = 767
           cvtss2si = 768
           cvtss2usi = 769
           cvttpd2dqx = 770
           cvttpd2dq = 771
           cvttpd2udq = 772
           cvttps2dq = 773
           cvttps2udq = 774
           cvtudq2pd = 775
           cvtudq2ps = 776
           divpd = 777
           divps = 778
           divsd = 779
           divss = 780
           dppd = 781
           dpps = 782
           err = 783
           erw = 784
           exp2pd = 785
           exp2ps = 786
           expandpd = 787
           expandps = 788
           extractf128 = 789
           extractf32x4 = 790
           extractf64x4 = 791
           extracti128 = 792
           extracti32x4 = 793
           extracti64x4 = 794
           extractps = 795
           fmadd132pd = 796
           fmadd132ps = 797
           fmaddpd = 798
           fmadd213pd = 799
           fmadd231pd = 800
           fmaddps = 801
           fmadd213ps = 802
           fmadd231ps = 803
           fmaddsd = 804
           fmadd213sd = 805
           fmadd132sd = 806
           fmadd231sd = 807
           fmaddss = 808
           fmadd213ss = 809
           fmadd132ss = 810
           fmadd231ss = 811
           fmaddsub132pd = 812
           fmaddsub132ps = 813
           fmaddsubpd = 814
           fmaddsub213pd = 815
           fmaddsub231pd = 816
           fmaddsubps = 817
           fmaddsub213ps = 818
           fmaddsub231ps = 819
           fmsub132pd = 820
           fmsub132ps = 821
           fmsubadd132pd = 822
           fmsubadd132ps = 823
           fmsubaddpd = 824
           fmsubadd213pd = 825
           fmsubadd231pd = 826
           fmsubaddps = 827
           fmsubadd213ps = 828
           fmsubadd231ps = 829
           fmsubpd = 830
           fmsub213pd = 831
           fmsub231pd = 832
           fmsubps = 833
           fmsub213ps = 834
           fmsub231ps = 835
           fmsubsd = 836
           fmsub213sd = 837
           fmsub132sd = 838
           fmsub231sd = 839
           fmsubss = 840
           fmsub213ss = 841
           fmsub132ss = 842
           fmsub231ss = 843
           fnmadd132pd = 844
           fnmadd132ps = 845
           fnmaddpd = 846
           fnmadd213pd = 847
           fnmadd231pd = 848
           fnmaddps = 849
           fnmadd213ps = 850
           fnmadd231ps = 851
           fnmaddsd = 852
           fnmadd213sd = 853
           fnmadd132sd = 854
           fnmadd231sd = 855
           fnmaddss = 856
           fnmadd213ss = 857
           fnmadd132ss = 858
           fnmadd231ss = 859
           fnmsub132pd = 860
           fnmsub132ps = 861
           fnmsubpd = 862
           fnmsub213pd = 863
           fnmsub231pd = 864
           fnmsubps = 865
           fnmsub213ps = 866
           fnmsub231ps = 867
           fnmsubsd = 868
           fnmsub213sd = 869
           fnmsub132sd = 870
           fnmsub231sd = 871
           fnmsubss = 872
           fnmsub213ss = 873
           fnmsub132ss = 874
           fnmsub231ss = 875
           frczpd = 876
           frczps = 877
           frczsd = 878
           frczss = 879
           orpd = 880
           orps = 881
           xorpd = 882
           xorps = 883
           gatherdpd = 884
           gatherdps = 885
           gatherpf0dpd = 886
           gatherpf0dps = 887
           gatherpf0qpd = 888
           gatherpf0qps = 889
           gatherpf1dpd = 890
           gatherpf1dps = 891
           gatherpf1qpd = 892
           gatherpf1qps = 893
           gatherqpd = 894
           gatherqps = 895
           haddpd = 896
           haddps = 897
           hsubpd = 898
           hsubps = 899
           insertf128 = 900
           insertf32x4 = 901
           insertf32x8 = 902
           insertf64x2 = 903
           insertf64x4 = 904
           inserti128 = 905
           inserti32x4 = 906
           inserti32x8 = 907
           inserti64x2 = 908
           inserti64x4 = 909
           insertps = 910
           lddqu = 911
           ldmxcsr = 912
           maskmovdqu = 913
           maskmovpd = 914
           maskmovps = 915
           maxpd = 916
           maxps = 917
           maxsd = 918
           maxss = 919
           mcall = 920
           mclear = 921
           mfunc = 922
           minpd = 923
           minps = 924
           minsd = 925
           minss = 926
           mlaunch = 927
           mload = 928
           mmcall = 929
           movq = 930
           movddup = 931
           movd = 932
           movdqa32 = 933
           movdqa64 = 934
           movdqa = 935
           movdqu16 = 936
           movdqu32 = 937
           movdqu64 = 938
           movdqu8 = 939
           movdqu = 940
           movhlps = 941
           movhpd = 942
           movhps = 943
           movlhps = 944
           movlpd = 945
           movlps = 946
           movmskpd = 947
           movmskps = 948
           movntdqa = 949
           movntdq = 950
           movntpd = 951
           movntps = 952
           movsd = 953
           movshdup = 954
           movsldup = 955
           movss = 956
           movupd = 957
           movups = 958
           mpsadbw = 959
           mptrld = 960
           mptrst = 961
           mread = 962
           mresume = 963
           mrun = 964
           msave = 965
           mulpd = 966
           mulps = 967
           mulsd = 968
           mulss = 969
           mwrite = 970
           mxoff = 971
           mxon = 972
           pabsb = 973
           pabsd = 974
           pabsq = 975
           pabsw = 976
           packssdw = 977
           packsswb = 978
           packusdw = 979
           packuswb = 980
           paddb = 981
           paddd = 982
           paddq = 983
           paddsb = 984
           paddsw = 985
           paddusb = 986
           paddusw = 987
           paddw = 988
           palignr = 989
           pandd = 990
           pandnd = 991
           pandnq = 992
           pandn = 993
           pandq = 994
           pand = 995
           pavgb = 996
           pavgw = 997
           pblendd = 998
           pblendmb = 999
           pblendmd = 1000
           pblendmq = 1001
           pblendmw = 1002
           pblendvb = 1003
           pblendw = 1004
           pbroadcastb = 1005
           pbroadcastd = 1006
           pbroadcastmb2q = 1007
           pbroadcastmw2d = 1008
           pbroadcastq = 1009
           pbroadcastw = 1010
           pclmulqdq = 1011
           pcmov = 1012
           pcmpb = 1013
           pcmpd = 1014
           pcmpeqb = 1015
           pcmpeqd = 1016
           pcmpeqq = 1017
           pcmpeqw = 1018
           pcmpestri = 1019
           pcmpestrm = 1020
           pcmpgtb = 1021
           pcmpgtd = 1022
           pcmpgtq = 1023
           pcmpgtw = 1024
           pcmpistri = 1025
           pcmpistrm = 1026
           pcmpq = 1027
           pcmpub = 1028
           pcmpud = 1029
           pcmpuq = 1030
           pcmpuw = 1031
           pcmpw = 1032
           pcomb = 1033
           pcomd = 1034
           pcompressd = 1035
           pcompressq = 1036
           pcomq = 1037
           pcomub = 1038
           pcomud = 1039
           pcomuq = 1040
           pcomuw = 1041
           pcomw = 1042
           pconflictd = 1043
           pconflictq = 1044
           perm2f128 = 1045
           perm2i128 = 1046
           permd = 1047
           permi2d = 1048
           permi2pd = 1049
           permi2ps = 1050
           permi2q = 1051
           permil2pd = 1052
           permil2ps = 1053
           permilpd = 1054
           permilps = 1055
           permpd = 1056
           permps = 1057
           permq = 1058
           permt2d = 1059
           permt2pd = 1060
           permt2ps = 1061
           permt2q = 1062
           pexpandd = 1063
           pexpandq = 1064
           pextrb = 1065
           pextrd = 1066
           pextrq = 1067
           pextrw = 1068
           pgatherdd = 1069
           pgatherdq = 1070
           pgatherqd = 1071
           pgatherqq = 1072
           phaddbd = 1073
           phaddbq = 1074
           phaddbw = 1075
           phadddq = 1076
           phaddd = 1077
           phaddsw = 1078
           phaddubd = 1079
           phaddubq = 1080
           phaddubw = 1081
           phaddudq = 1082
           phadduwd = 1083
           phadduwq = 1084
           phaddwd = 1085
           phaddwq = 1086
           phaddw = 1087
           phminposuw = 1088
           phsubbw = 1089
           phsubdq = 1090
           phsubd = 1091
           phsubsw = 1092
           phsubwd = 1093
           phsubw = 1094
           pinsrb = 1095
           pinsrd = 1096
           pinsrq = 1097
           pinsrw = 1098
           plzcntd = 1099
           plzcntq = 1100
           pmacsdd = 1101
           pmacsdqh = 1102
           pmacsdql = 1103
           pmacssdd = 1104
           pmacssdqh = 1105
           pmacssdql = 1106
           pmacsswd = 1107
           pmacssww = 1108
           pmacswd = 1109
           pmacsww = 1110
           pmadcsswd = 1111
           pmadcswd = 1112
           pmaddubsw = 1113
           pmaddwd = 1114
           pmaskmovd = 1115
           pmaskmovq = 1116
           pmaxsb = 1117
           pmaxsd = 1118
           pmaxsq = 1119
           pmaxsw = 1120
           pmaxub = 1121
           pmaxud = 1122
           pmaxuq = 1123
           pmaxuw = 1124
           pminsb = 1125
           pminsd = 1126
           pminsq = 1127
           pminsw = 1128
           pminub = 1129
           pminud = 1130
           pminuq = 1131
           pminuw = 1132
           pmovdb = 1133
           pmovdw = 1134
           pmovm2b = 1135
           pmovm2d = 1136
           pmovm2q = 1137
           pmovm2w = 1138
           pmovmskb = 1139
           pmovqb = 1140
           pmovqd = 1141
           pmovqw = 1142
           pmovsdb = 1143
           pmovsdw = 1144
           pmovsqb = 1145
           pmovsqd = 1146
           pmovsqw = 1147
           pmovsxbd = 1148
           pmovsxbq = 1149
           pmovsxbw = 1150
           pmovsxdq = 1151
           pmovsxwd = 1152
           pmovsxwq = 1153
           pmovusdb = 1154
           pmovusdw = 1155
           pmovusqb = 1156
           pmovusqd = 1157
           pmovusqw = 1158
           pmovzxbd = 1159
           pmovzxbq = 1160
           pmovzxbw = 1161
           pmovzxdq = 1162
           pmovzxwd = 1163
           pmovzxwq = 1164
           pmuldq = 1165
           pmulhrsw = 1166
           pmulhuw = 1167
           pmulhw = 1168
           pmulld = 1169
           pmullq = 1170
           pmullw = 1171
           pmuludq = 1172
           pord = 1173
           porq = 1174
           por = 1175
           pperm = 1176
           protb = 1177
           protd = 1178
           protq = 1179
           protw = 1180
           psadbw = 1181
           pscatterdd = 1182
           pscatterdq = 1183
           pscatterqd = 1184
           pscatterqq = 1185
           pshab = 1186
           pshad = 1187
           pshaq = 1188
           pshaw = 1189
           pshlb = 1190
           pshld = 1191
           pshlq = 1192
           pshlw = 1193
           pshufb = 1194
           pshufd = 1195
           pshufhw = 1196
           pshuflw = 1197
           psignb = 1198
           psignd = 1199
           psignw = 1200
           pslldq = 1201
           pslld = 1202
           psllq = 1203
           psllvd = 1204
           psllvq = 1205
           psllw = 1206
           psrad = 1207
           psraq = 1208
           psravd = 1209
           psravq = 1210
           psraw = 1211
           psrldq = 1212
           psrld = 1213
           psrlq = 1214
           psrlvd = 1215
           psrlvq = 1216
           psrlw = 1217
           psubb = 1218
           psubd = 1219
           psubq = 1220
           psubsb = 1221
           psubsw = 1222
           psubusb = 1223
           psubusw = 1224
           psubw = 1225
           ptestmd = 1226
           ptestmq = 1227
           ptestnmd = 1228
           ptestnmq = 1229
           ptest = 1230
           punpckhbw = 1231
           punpckhdq = 1232
           punpckhqdq = 1233
           punpckhwd = 1234
           punpcklbw = 1235
           punpckldq = 1236
           punpcklqdq = 1237
           punpcklwd = 1238
           pxord = 1239
           pxorq = 1240
           pxor = 1241
           rcp14pd = 1242
           rcp14ps = 1243
           rcp14sd = 1244
           rcp14ss = 1245
           rcp28pd = 1246
           rcp28ps = 1247
           rcp28sd = 1248
           rcp28ss = 1249
           rcpps = 1250
           rcpss = 1251
           rndscalepd = 1252
           rndscaleps = 1253
           rndscalesd = 1254
           rndscaless = 1255
           roundpd = 1256
           roundps = 1257
           roundsd = 1258
           roundss = 1259
           rsqrt14pd = 1260
           rsqrt14ps = 1261
           rsqrt14sd = 1262
           rsqrt14ss = 1263
           rsqrt28pd = 1264
           rsqrt28ps = 1265
           rsqrt28sd = 1266
           rsqrt28ss = 1267
           rsqrtps = 1268
           rsqrtss = 1269
           scatterdpd = 1270
           scatterdps = 1271
           scatterpf0dpd = 1272
           scatterpf0dps = 1273
           scatterpf0qpd = 1274
           scatterpf0qps = 1275
           scatterpf1dpd = 1276
           scatterpf1dps = 1277
           scatterpf1qpd = 1278
           scatterpf1qps = 1279
           scatterqpd = 1280
           scatterqps = 1281
           shufpd = 1282
           shufps = 1283
           sqrtpd = 1284
           sqrtps = 1285
           sqrtsd = 1286
           sqrtss = 1287
           stmxcsr = 1288
           subpd = 1289
           subps = 1290
           subsd = 1291
           subss = 1292
           testpd = 1293
           testps = 1294
           unpckhpd = 1295
           unpckhps = 1296
           unpcklpd = 1297
           unpcklps = 1298
           zeroall = 1299
           zeroupper = 1300
           ait = 1301
           binvd = 1302
           rfsbase = 1303
           rgsbase = 1304
           rmsr = 1305
           abort = 1306
           acquire = 1307
           begin = 1308
           chg = 1309
           cryptcbc = 1310
           cryptcfb = 1311
           cryptctr = 1312
           cryptecb = 1313
           cryptofb = 1314
           end = 1315
           getbv = 1316
           latb = 1317
           release = 1318
           rstor = 1319
           rstor64 = 1320
           rstors = 1321
           rstors64 = 1322
           save = 1323
           save64 = 1324
           savec = 1325
           savec64 = 1326
           saveopt = 1327
           saveopt64 = 1328
           saves = 1329
           saves64 = 1330
           setbv = 1331
           sha1 = 1332
           sha256 = 1333
           store = 1334
           test = 1335
           disi8087-nop = 1336
           eni8087-nop = 1337
           nding = 1338)))