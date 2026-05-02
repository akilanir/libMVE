.class public Lgcardone/junidecode/Junidecode;
.super Ljava/lang/Object;
.source "Junidecode.java"


# static fields
.field private static final cache:[[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    const/16 v0, 0x100

    new-array v0, v0, [[Ljava/lang/String;

    sput-object v0, Lgcardone/junidecode/Junidecode;->cache:[[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public static unidecode(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 55
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .local v5, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v2, v6, :cond_2d7

    .line 58
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    .line 59
    .local v0, "codepoint":I
    shr-int/lit8 v6, v0, 0x8

    and-int/lit16 v1, v6, 0xff

    .line 60
    .local v1, "hi":I
    and-int/lit16 v3, v0, 0xff

    .line 69
    .local v3, "low":I
    sget-object v6, Lgcardone/junidecode/Junidecode;->cache:[[Ljava/lang/String;

    aget-object v4, v6, v1

    .line 70
    .local v4, "map":[Ljava/lang/String;
    if-nez v4, :cond_28

    .line 71
    packed-switch v1, :pswitch_data_2dc

    .line 57
    :cond_1f
    :goto_1f
    :pswitch_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 73
    :pswitch_22
    sget-object v4, Lgcardone/junidecode/X00;->map:[Ljava/lang/String;

    .line 619
    :goto_24
    sget-object v6, Lgcardone/junidecode/Junidecode;->cache:[[Ljava/lang/String;

    aput-object v4, v6, v1

    .line 625
    :cond_28
    array-length v6, v4

    if-ge v3, v6, :cond_1f

    .line 626
    aget-object v6, v4, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1f

    .line 76
    :pswitch_31
    sget-object v4, Lgcardone/junidecode/X01;->map:[Ljava/lang/String;

    .line 77
    goto :goto_24

    .line 79
    :pswitch_34
    sget-object v4, Lgcardone/junidecode/X02;->map:[Ljava/lang/String;

    .line 80
    goto :goto_24

    .line 82
    :pswitch_37
    sget-object v4, Lgcardone/junidecode/X03;->map:[Ljava/lang/String;

    .line 83
    goto :goto_24

    .line 85
    :pswitch_3a
    sget-object v4, Lgcardone/junidecode/X04;->map:[Ljava/lang/String;

    .line 86
    goto :goto_24

    .line 88
    :pswitch_3d
    sget-object v4, Lgcardone/junidecode/X05;->map:[Ljava/lang/String;

    .line 89
    goto :goto_24

    .line 91
    :pswitch_40
    sget-object v4, Lgcardone/junidecode/X06;->map:[Ljava/lang/String;

    .line 92
    goto :goto_24

    .line 94
    :pswitch_43
    sget-object v4, Lgcardone/junidecode/X07;->map:[Ljava/lang/String;

    .line 95
    goto :goto_24

    .line 97
    :pswitch_46
    sget-object v4, Lgcardone/junidecode/X09;->map:[Ljava/lang/String;

    .line 98
    goto :goto_24

    .line 100
    :pswitch_49
    sget-object v4, Lgcardone/junidecode/X0a;->map:[Ljava/lang/String;

    .line 101
    goto :goto_24

    .line 103
    :pswitch_4c
    sget-object v4, Lgcardone/junidecode/X0b;->map:[Ljava/lang/String;

    .line 104
    goto :goto_24

    .line 106
    :pswitch_4f
    sget-object v4, Lgcardone/junidecode/X0c;->map:[Ljava/lang/String;

    .line 107
    goto :goto_24

    .line 109
    :pswitch_52
    sget-object v4, Lgcardone/junidecode/X0d;->map:[Ljava/lang/String;

    .line 110
    goto :goto_24

    .line 112
    :pswitch_55
    sget-object v4, Lgcardone/junidecode/X0e;->map:[Ljava/lang/String;

    .line 113
    goto :goto_24

    .line 115
    :pswitch_58
    sget-object v4, Lgcardone/junidecode/X0f;->map:[Ljava/lang/String;

    .line 116
    goto :goto_24

    .line 118
    :pswitch_5b
    sget-object v4, Lgcardone/junidecode/X10;->map:[Ljava/lang/String;

    .line 119
    goto :goto_24

    .line 121
    :pswitch_5e
    sget-object v4, Lgcardone/junidecode/X11;->map:[Ljava/lang/String;

    .line 122
    goto :goto_24

    .line 124
    :pswitch_61
    sget-object v4, Lgcardone/junidecode/X12;->map:[Ljava/lang/String;

    .line 125
    goto :goto_24

    .line 127
    :pswitch_64
    sget-object v4, Lgcardone/junidecode/X13;->map:[Ljava/lang/String;

    .line 128
    goto :goto_24

    .line 130
    :pswitch_67
    sget-object v4, Lgcardone/junidecode/X14;->map:[Ljava/lang/String;

    .line 131
    goto :goto_24

    .line 133
    :pswitch_6a
    sget-object v4, Lgcardone/junidecode/X15;->map:[Ljava/lang/String;

    .line 134
    goto :goto_24

    .line 136
    :pswitch_6d
    sget-object v4, Lgcardone/junidecode/X16;->map:[Ljava/lang/String;

    .line 137
    goto :goto_24

    .line 139
    :pswitch_70
    sget-object v4, Lgcardone/junidecode/X17;->map:[Ljava/lang/String;

    .line 140
    goto :goto_24

    .line 142
    :pswitch_73
    sget-object v4, Lgcardone/junidecode/X18;->map:[Ljava/lang/String;

    .line 143
    goto :goto_24

    .line 145
    :pswitch_76
    sget-object v4, Lgcardone/junidecode/X1e;->map:[Ljava/lang/String;

    .line 146
    goto :goto_24

    .line 148
    :pswitch_79
    sget-object v4, Lgcardone/junidecode/X1f;->map:[Ljava/lang/String;

    .line 149
    goto :goto_24

    .line 151
    :pswitch_7c
    sget-object v4, Lgcardone/junidecode/X20;->map:[Ljava/lang/String;

    .line 152
    goto :goto_24

    .line 154
    :pswitch_7f
    sget-object v4, Lgcardone/junidecode/X21;->map:[Ljava/lang/String;

    .line 155
    goto :goto_24

    .line 157
    :pswitch_82
    sget-object v4, Lgcardone/junidecode/X22;->map:[Ljava/lang/String;

    .line 158
    goto :goto_24

    .line 160
    :pswitch_85
    sget-object v4, Lgcardone/junidecode/X23;->map:[Ljava/lang/String;

    .line 161
    goto :goto_24

    .line 163
    :pswitch_88
    sget-object v4, Lgcardone/junidecode/X24;->map:[Ljava/lang/String;

    .line 164
    goto :goto_24

    .line 166
    :pswitch_8b
    sget-object v4, Lgcardone/junidecode/X25;->map:[Ljava/lang/String;

    .line 167
    goto :goto_24

    .line 169
    :pswitch_8e
    sget-object v4, Lgcardone/junidecode/X26;->map:[Ljava/lang/String;

    .line 170
    goto :goto_24

    .line 172
    :pswitch_91
    sget-object v4, Lgcardone/junidecode/X27;->map:[Ljava/lang/String;

    .line 173
    goto :goto_24

    .line 175
    :pswitch_94
    sget-object v4, Lgcardone/junidecode/X28;->map:[Ljava/lang/String;

    .line 176
    goto :goto_24

    .line 178
    :pswitch_97
    sget-object v4, Lgcardone/junidecode/X2e;->map:[Ljava/lang/String;

    .line 179
    goto :goto_24

    .line 181
    :pswitch_9a
    sget-object v4, Lgcardone/junidecode/X2f;->map:[Ljava/lang/String;

    .line 182
    goto :goto_24

    .line 184
    :pswitch_9d
    sget-object v4, Lgcardone/junidecode/X30;->map:[Ljava/lang/String;

    .line 185
    goto :goto_24

    .line 187
    :pswitch_a0
    sget-object v4, Lgcardone/junidecode/X31;->map:[Ljava/lang/String;

    .line 188
    goto :goto_24

    .line 190
    :pswitch_a3
    sget-object v4, Lgcardone/junidecode/X32;->map:[Ljava/lang/String;

    .line 191
    goto/16 :goto_24

    .line 193
    :pswitch_a7
    sget-object v4, Lgcardone/junidecode/X33;->map:[Ljava/lang/String;

    .line 194
    goto/16 :goto_24

    .line 196
    :pswitch_ab
    sget-object v4, Lgcardone/junidecode/X4d;->map:[Ljava/lang/String;

    .line 197
    goto/16 :goto_24

    .line 199
    :pswitch_af
    sget-object v4, Lgcardone/junidecode/X4e;->map:[Ljava/lang/String;

    .line 200
    goto/16 :goto_24

    .line 202
    :pswitch_b3
    sget-object v4, Lgcardone/junidecode/X4f;->map:[Ljava/lang/String;

    .line 203
    goto/16 :goto_24

    .line 205
    :pswitch_b7
    sget-object v4, Lgcardone/junidecode/X50;->map:[Ljava/lang/String;

    .line 206
    goto/16 :goto_24

    .line 208
    :pswitch_bb
    sget-object v4, Lgcardone/junidecode/X51;->map:[Ljava/lang/String;

    .line 209
    goto/16 :goto_24

    .line 211
    :pswitch_bf
    sget-object v4, Lgcardone/junidecode/X52;->map:[Ljava/lang/String;

    .line 212
    goto/16 :goto_24

    .line 214
    :pswitch_c3
    sget-object v4, Lgcardone/junidecode/X53;->map:[Ljava/lang/String;

    .line 215
    goto/16 :goto_24

    .line 217
    :pswitch_c7
    sget-object v4, Lgcardone/junidecode/X54;->map:[Ljava/lang/String;

    .line 218
    goto/16 :goto_24

    .line 220
    :pswitch_cb
    sget-object v4, Lgcardone/junidecode/X55;->map:[Ljava/lang/String;

    .line 221
    goto/16 :goto_24

    .line 223
    :pswitch_cf
    sget-object v4, Lgcardone/junidecode/X56;->map:[Ljava/lang/String;

    .line 224
    goto/16 :goto_24

    .line 226
    :pswitch_d3
    sget-object v4, Lgcardone/junidecode/X57;->map:[Ljava/lang/String;

    .line 227
    goto/16 :goto_24

    .line 229
    :pswitch_d7
    sget-object v4, Lgcardone/junidecode/X58;->map:[Ljava/lang/String;

    .line 230
    goto/16 :goto_24

    .line 232
    :pswitch_db
    sget-object v4, Lgcardone/junidecode/X59;->map:[Ljava/lang/String;

    .line 233
    goto/16 :goto_24

    .line 235
    :pswitch_df
    sget-object v4, Lgcardone/junidecode/X5a;->map:[Ljava/lang/String;

    .line 236
    goto/16 :goto_24

    .line 238
    :pswitch_e3
    sget-object v4, Lgcardone/junidecode/X5b;->map:[Ljava/lang/String;

    .line 239
    goto/16 :goto_24

    .line 241
    :pswitch_e7
    sget-object v4, Lgcardone/junidecode/X5c;->map:[Ljava/lang/String;

    .line 242
    goto/16 :goto_24

    .line 244
    :pswitch_eb
    sget-object v4, Lgcardone/junidecode/X5d;->map:[Ljava/lang/String;

    .line 245
    goto/16 :goto_24

    .line 247
    :pswitch_ef
    sget-object v4, Lgcardone/junidecode/X5e;->map:[Ljava/lang/String;

    .line 248
    goto/16 :goto_24

    .line 250
    :pswitch_f3
    sget-object v4, Lgcardone/junidecode/X5f;->map:[Ljava/lang/String;

    .line 251
    goto/16 :goto_24

    .line 253
    :pswitch_f7
    sget-object v4, Lgcardone/junidecode/X60;->map:[Ljava/lang/String;

    .line 254
    goto/16 :goto_24

    .line 256
    :pswitch_fb
    sget-object v4, Lgcardone/junidecode/X61;->map:[Ljava/lang/String;

    .line 257
    goto/16 :goto_24

    .line 259
    :pswitch_ff
    sget-object v4, Lgcardone/junidecode/X62;->map:[Ljava/lang/String;

    .line 260
    goto/16 :goto_24

    .line 262
    :pswitch_103
    sget-object v4, Lgcardone/junidecode/X63;->map:[Ljava/lang/String;

    .line 263
    goto/16 :goto_24

    .line 265
    :pswitch_107
    sget-object v4, Lgcardone/junidecode/X64;->map:[Ljava/lang/String;

    .line 266
    goto/16 :goto_24

    .line 268
    :pswitch_10b
    sget-object v4, Lgcardone/junidecode/X65;->map:[Ljava/lang/String;

    .line 269
    goto/16 :goto_24

    .line 271
    :pswitch_10f
    sget-object v4, Lgcardone/junidecode/X66;->map:[Ljava/lang/String;

    .line 272
    goto/16 :goto_24

    .line 274
    :pswitch_113
    sget-object v4, Lgcardone/junidecode/X67;->map:[Ljava/lang/String;

    .line 275
    goto/16 :goto_24

    .line 277
    :pswitch_117
    sget-object v4, Lgcardone/junidecode/X68;->map:[Ljava/lang/String;

    .line 278
    goto/16 :goto_24

    .line 280
    :pswitch_11b
    sget-object v4, Lgcardone/junidecode/X69;->map:[Ljava/lang/String;

    .line 281
    goto/16 :goto_24

    .line 283
    :pswitch_11f
    sget-object v4, Lgcardone/junidecode/X6a;->map:[Ljava/lang/String;

    .line 284
    goto/16 :goto_24

    .line 286
    :pswitch_123
    sget-object v4, Lgcardone/junidecode/X6b;->map:[Ljava/lang/String;

    .line 287
    goto/16 :goto_24

    .line 289
    :pswitch_127
    sget-object v4, Lgcardone/junidecode/X6c;->map:[Ljava/lang/String;

    .line 290
    goto/16 :goto_24

    .line 292
    :pswitch_12b
    sget-object v4, Lgcardone/junidecode/X6d;->map:[Ljava/lang/String;

    .line 293
    goto/16 :goto_24

    .line 295
    :pswitch_12f
    sget-object v4, Lgcardone/junidecode/X6e;->map:[Ljava/lang/String;

    .line 296
    goto/16 :goto_24

    .line 298
    :pswitch_133
    sget-object v4, Lgcardone/junidecode/X6f;->map:[Ljava/lang/String;

    .line 299
    goto/16 :goto_24

    .line 301
    :pswitch_137
    sget-object v4, Lgcardone/junidecode/X70;->map:[Ljava/lang/String;

    .line 302
    goto/16 :goto_24

    .line 304
    :pswitch_13b
    sget-object v4, Lgcardone/junidecode/X71;->map:[Ljava/lang/String;

    .line 305
    goto/16 :goto_24

    .line 307
    :pswitch_13f
    sget-object v4, Lgcardone/junidecode/X72;->map:[Ljava/lang/String;

    .line 308
    goto/16 :goto_24

    .line 310
    :pswitch_143
    sget-object v4, Lgcardone/junidecode/X73;->map:[Ljava/lang/String;

    .line 311
    goto/16 :goto_24

    .line 313
    :pswitch_147
    sget-object v4, Lgcardone/junidecode/X74;->map:[Ljava/lang/String;

    .line 314
    goto/16 :goto_24

    .line 316
    :pswitch_14b
    sget-object v4, Lgcardone/junidecode/X75;->map:[Ljava/lang/String;

    .line 317
    goto/16 :goto_24

    .line 319
    :pswitch_14f
    sget-object v4, Lgcardone/junidecode/X76;->map:[Ljava/lang/String;

    .line 320
    goto/16 :goto_24

    .line 322
    :pswitch_153
    sget-object v4, Lgcardone/junidecode/X77;->map:[Ljava/lang/String;

    .line 323
    goto/16 :goto_24

    .line 325
    :pswitch_157
    sget-object v4, Lgcardone/junidecode/X78;->map:[Ljava/lang/String;

    .line 326
    goto/16 :goto_24

    .line 328
    :pswitch_15b
    sget-object v4, Lgcardone/junidecode/X79;->map:[Ljava/lang/String;

    .line 329
    goto/16 :goto_24

    .line 331
    :pswitch_15f
    sget-object v4, Lgcardone/junidecode/X7a;->map:[Ljava/lang/String;

    .line 332
    goto/16 :goto_24

    .line 334
    :pswitch_163
    sget-object v4, Lgcardone/junidecode/X7b;->map:[Ljava/lang/String;

    .line 335
    goto/16 :goto_24

    .line 337
    :pswitch_167
    sget-object v4, Lgcardone/junidecode/X7c;->map:[Ljava/lang/String;

    .line 338
    goto/16 :goto_24

    .line 340
    :pswitch_16b
    sget-object v4, Lgcardone/junidecode/X7d;->map:[Ljava/lang/String;

    .line 341
    goto/16 :goto_24

    .line 343
    :pswitch_16f
    sget-object v4, Lgcardone/junidecode/X7e;->map:[Ljava/lang/String;

    .line 344
    goto/16 :goto_24

    .line 346
    :pswitch_173
    sget-object v4, Lgcardone/junidecode/X7f;->map:[Ljava/lang/String;

    .line 347
    goto/16 :goto_24

    .line 349
    :pswitch_177
    sget-object v4, Lgcardone/junidecode/X80;->map:[Ljava/lang/String;

    .line 350
    goto/16 :goto_24

    .line 352
    :pswitch_17b
    sget-object v4, Lgcardone/junidecode/X81;->map:[Ljava/lang/String;

    .line 353
    goto/16 :goto_24

    .line 355
    :pswitch_17f
    sget-object v4, Lgcardone/junidecode/X82;->map:[Ljava/lang/String;

    .line 356
    goto/16 :goto_24

    .line 358
    :pswitch_183
    sget-object v4, Lgcardone/junidecode/X83;->map:[Ljava/lang/String;

    .line 359
    goto/16 :goto_24

    .line 361
    :pswitch_187
    sget-object v4, Lgcardone/junidecode/X84;->map:[Ljava/lang/String;

    .line 362
    goto/16 :goto_24

    .line 364
    :pswitch_18b
    sget-object v4, Lgcardone/junidecode/X85;->map:[Ljava/lang/String;

    .line 365
    goto/16 :goto_24

    .line 367
    :pswitch_18f
    sget-object v4, Lgcardone/junidecode/X86;->map:[Ljava/lang/String;

    .line 368
    goto/16 :goto_24

    .line 370
    :pswitch_193
    sget-object v4, Lgcardone/junidecode/X87;->map:[Ljava/lang/String;

    .line 371
    goto/16 :goto_24

    .line 373
    :pswitch_197
    sget-object v4, Lgcardone/junidecode/X88;->map:[Ljava/lang/String;

    .line 374
    goto/16 :goto_24

    .line 376
    :pswitch_19b
    sget-object v4, Lgcardone/junidecode/X89;->map:[Ljava/lang/String;

    .line 377
    goto/16 :goto_24

    .line 379
    :pswitch_19f
    sget-object v4, Lgcardone/junidecode/X8a;->map:[Ljava/lang/String;

    .line 380
    goto/16 :goto_24

    .line 382
    :pswitch_1a3
    sget-object v4, Lgcardone/junidecode/X8b;->map:[Ljava/lang/String;

    .line 383
    goto/16 :goto_24

    .line 385
    :pswitch_1a7
    sget-object v4, Lgcardone/junidecode/X8c;->map:[Ljava/lang/String;

    .line 386
    goto/16 :goto_24

    .line 388
    :pswitch_1ab
    sget-object v4, Lgcardone/junidecode/X8d;->map:[Ljava/lang/String;

    .line 389
    goto/16 :goto_24

    .line 391
    :pswitch_1af
    sget-object v4, Lgcardone/junidecode/X8e;->map:[Ljava/lang/String;

    .line 392
    goto/16 :goto_24

    .line 394
    :pswitch_1b3
    sget-object v4, Lgcardone/junidecode/X8f;->map:[Ljava/lang/String;

    .line 395
    goto/16 :goto_24

    .line 397
    :pswitch_1b7
    sget-object v4, Lgcardone/junidecode/X90;->map:[Ljava/lang/String;

    .line 398
    goto/16 :goto_24

    .line 400
    :pswitch_1bb
    sget-object v4, Lgcardone/junidecode/X91;->map:[Ljava/lang/String;

    .line 401
    goto/16 :goto_24

    .line 403
    :pswitch_1bf
    sget-object v4, Lgcardone/junidecode/X92;->map:[Ljava/lang/String;

    .line 404
    goto/16 :goto_24

    .line 406
    :pswitch_1c3
    sget-object v4, Lgcardone/junidecode/X93;->map:[Ljava/lang/String;

    .line 407
    goto/16 :goto_24

    .line 409
    :pswitch_1c7
    sget-object v4, Lgcardone/junidecode/X94;->map:[Ljava/lang/String;

    .line 410
    goto/16 :goto_24

    .line 412
    :pswitch_1cb
    sget-object v4, Lgcardone/junidecode/X95;->map:[Ljava/lang/String;

    .line 413
    goto/16 :goto_24

    .line 415
    :pswitch_1cf
    sget-object v4, Lgcardone/junidecode/X96;->map:[Ljava/lang/String;

    .line 416
    goto/16 :goto_24

    .line 418
    :pswitch_1d3
    sget-object v4, Lgcardone/junidecode/X97;->map:[Ljava/lang/String;

    .line 419
    goto/16 :goto_24

    .line 421
    :pswitch_1d7
    sget-object v4, Lgcardone/junidecode/X98;->map:[Ljava/lang/String;

    .line 422
    goto/16 :goto_24

    .line 424
    :pswitch_1db
    sget-object v4, Lgcardone/junidecode/X99;->map:[Ljava/lang/String;

    .line 425
    goto/16 :goto_24

    .line 427
    :pswitch_1df
    sget-object v4, Lgcardone/junidecode/X9a;->map:[Ljava/lang/String;

    .line 428
    goto/16 :goto_24

    .line 430
    :pswitch_1e3
    sget-object v4, Lgcardone/junidecode/X9b;->map:[Ljava/lang/String;

    .line 431
    goto/16 :goto_24

    .line 433
    :pswitch_1e7
    sget-object v4, Lgcardone/junidecode/X9c;->map:[Ljava/lang/String;

    .line 434
    goto/16 :goto_24

    .line 436
    :pswitch_1eb
    sget-object v4, Lgcardone/junidecode/X9d;->map:[Ljava/lang/String;

    .line 437
    goto/16 :goto_24

    .line 439
    :pswitch_1ef
    sget-object v4, Lgcardone/junidecode/X9e;->map:[Ljava/lang/String;

    .line 440
    goto/16 :goto_24

    .line 442
    :pswitch_1f3
    sget-object v4, Lgcardone/junidecode/X9f;->map:[Ljava/lang/String;

    .line 443
    goto/16 :goto_24

    .line 445
    :pswitch_1f7
    sget-object v4, Lgcardone/junidecode/Xa0;->map:[Ljava/lang/String;

    .line 446
    goto/16 :goto_24

    .line 448
    :pswitch_1fb
    sget-object v4, Lgcardone/junidecode/Xa1;->map:[Ljava/lang/String;

    .line 449
    goto/16 :goto_24

    .line 451
    :pswitch_1ff
    sget-object v4, Lgcardone/junidecode/Xa2;->map:[Ljava/lang/String;

    .line 452
    goto/16 :goto_24

    .line 454
    :pswitch_203
    sget-object v4, Lgcardone/junidecode/Xa3;->map:[Ljava/lang/String;

    .line 455
    goto/16 :goto_24

    .line 457
    :pswitch_207
    sget-object v4, Lgcardone/junidecode/Xa4;->map:[Ljava/lang/String;

    .line 458
    goto/16 :goto_24

    .line 460
    :pswitch_20b
    sget-object v4, Lgcardone/junidecode/Xac;->map:[Ljava/lang/String;

    .line 461
    goto/16 :goto_24

    .line 463
    :pswitch_20f
    sget-object v4, Lgcardone/junidecode/Xad;->map:[Ljava/lang/String;

    .line 464
    goto/16 :goto_24

    .line 466
    :pswitch_213
    sget-object v4, Lgcardone/junidecode/Xae;->map:[Ljava/lang/String;

    .line 467
    goto/16 :goto_24

    .line 469
    :pswitch_217
    sget-object v4, Lgcardone/junidecode/Xaf;->map:[Ljava/lang/String;

    .line 470
    goto/16 :goto_24

    .line 472
    :pswitch_21b
    sget-object v4, Lgcardone/junidecode/Xb0;->map:[Ljava/lang/String;

    .line 473
    goto/16 :goto_24

    .line 475
    :pswitch_21f
    sget-object v4, Lgcardone/junidecode/Xb1;->map:[Ljava/lang/String;

    .line 476
    goto/16 :goto_24

    .line 478
    :pswitch_223
    sget-object v4, Lgcardone/junidecode/Xb2;->map:[Ljava/lang/String;

    .line 479
    goto/16 :goto_24

    .line 481
    :pswitch_227
    sget-object v4, Lgcardone/junidecode/Xb3;->map:[Ljava/lang/String;

    .line 482
    goto/16 :goto_24

    .line 484
    :pswitch_22b
    sget-object v4, Lgcardone/junidecode/Xb4;->map:[Ljava/lang/String;

    .line 485
    goto/16 :goto_24

    .line 487
    :pswitch_22f
    sget-object v4, Lgcardone/junidecode/Xb5;->map:[Ljava/lang/String;

    .line 488
    goto/16 :goto_24

    .line 490
    :pswitch_233
    sget-object v4, Lgcardone/junidecode/Xb6;->map:[Ljava/lang/String;

    .line 491
    goto/16 :goto_24

    .line 493
    :pswitch_237
    sget-object v4, Lgcardone/junidecode/Xb7;->map:[Ljava/lang/String;

    .line 494
    goto/16 :goto_24

    .line 496
    :pswitch_23b
    sget-object v4, Lgcardone/junidecode/Xb8;->map:[Ljava/lang/String;

    .line 497
    goto/16 :goto_24

    .line 499
    :pswitch_23f
    sget-object v4, Lgcardone/junidecode/Xb9;->map:[Ljava/lang/String;

    .line 500
    goto/16 :goto_24

    .line 502
    :pswitch_243
    sget-object v4, Lgcardone/junidecode/Xba;->map:[Ljava/lang/String;

    .line 503
    goto/16 :goto_24

    .line 505
    :pswitch_247
    sget-object v4, Lgcardone/junidecode/Xbb;->map:[Ljava/lang/String;

    .line 506
    goto/16 :goto_24

    .line 508
    :pswitch_24b
    sget-object v4, Lgcardone/junidecode/Xbc;->map:[Ljava/lang/String;

    .line 509
    goto/16 :goto_24

    .line 511
    :pswitch_24f
    sget-object v4, Lgcardone/junidecode/Xbd;->map:[Ljava/lang/String;

    .line 512
    goto/16 :goto_24

    .line 514
    :pswitch_253
    sget-object v4, Lgcardone/junidecode/Xbe;->map:[Ljava/lang/String;

    .line 515
    goto/16 :goto_24

    .line 517
    :pswitch_257
    sget-object v4, Lgcardone/junidecode/Xbf;->map:[Ljava/lang/String;

    .line 518
    goto/16 :goto_24

    .line 520
    :pswitch_25b
    sget-object v4, Lgcardone/junidecode/Xc0;->map:[Ljava/lang/String;

    .line 521
    goto/16 :goto_24

    .line 523
    :pswitch_25f
    sget-object v4, Lgcardone/junidecode/Xc1;->map:[Ljava/lang/String;

    .line 524
    goto/16 :goto_24

    .line 526
    :pswitch_263
    sget-object v4, Lgcardone/junidecode/Xc2;->map:[Ljava/lang/String;

    .line 527
    goto/16 :goto_24

    .line 529
    :pswitch_267
    sget-object v4, Lgcardone/junidecode/Xc3;->map:[Ljava/lang/String;

    .line 530
    goto/16 :goto_24

    .line 532
    :pswitch_26b
    sget-object v4, Lgcardone/junidecode/Xc4;->map:[Ljava/lang/String;

    .line 533
    goto/16 :goto_24

    .line 535
    :pswitch_26f
    sget-object v4, Lgcardone/junidecode/Xc5;->map:[Ljava/lang/String;

    .line 536
    goto/16 :goto_24

    .line 538
    :pswitch_273
    sget-object v4, Lgcardone/junidecode/Xc6;->map:[Ljava/lang/String;

    .line 539
    goto/16 :goto_24

    .line 541
    :pswitch_277
    sget-object v4, Lgcardone/junidecode/Xc7;->map:[Ljava/lang/String;

    .line 542
    goto/16 :goto_24

    .line 544
    :pswitch_27b
    sget-object v4, Lgcardone/junidecode/Xc8;->map:[Ljava/lang/String;

    .line 545
    goto/16 :goto_24

    .line 547
    :pswitch_27f
    sget-object v4, Lgcardone/junidecode/Xc9;->map:[Ljava/lang/String;

    .line 548
    goto/16 :goto_24

    .line 550
    :pswitch_283
    sget-object v4, Lgcardone/junidecode/Xca;->map:[Ljava/lang/String;

    .line 551
    goto/16 :goto_24

    .line 553
    :pswitch_287
    sget-object v4, Lgcardone/junidecode/Xcb;->map:[Ljava/lang/String;

    .line 554
    goto/16 :goto_24

    .line 556
    :pswitch_28b
    sget-object v4, Lgcardone/junidecode/Xcc;->map:[Ljava/lang/String;

    .line 557
    goto/16 :goto_24

    .line 559
    :pswitch_28f
    sget-object v4, Lgcardone/junidecode/Xcd;->map:[Ljava/lang/String;

    .line 560
    goto/16 :goto_24

    .line 562
    :pswitch_293
    sget-object v4, Lgcardone/junidecode/Xce;->map:[Ljava/lang/String;

    .line 563
    goto/16 :goto_24

    .line 565
    :pswitch_297
    sget-object v4, Lgcardone/junidecode/Xcf;->map:[Ljava/lang/String;

    .line 566
    goto/16 :goto_24

    .line 568
    :pswitch_29b
    sget-object v4, Lgcardone/junidecode/Xd0;->map:[Ljava/lang/String;

    .line 569
    goto/16 :goto_24

    .line 571
    :pswitch_29f
    sget-object v4, Lgcardone/junidecode/Xd1;->map:[Ljava/lang/String;

    .line 572
    goto/16 :goto_24

    .line 574
    :pswitch_2a3
    sget-object v4, Lgcardone/junidecode/Xd2;->map:[Ljava/lang/String;

    .line 575
    goto/16 :goto_24

    .line 577
    :pswitch_2a7
    sget-object v4, Lgcardone/junidecode/Xd3;->map:[Ljava/lang/String;

    .line 578
    goto/16 :goto_24

    .line 580
    :pswitch_2ab
    sget-object v4, Lgcardone/junidecode/Xd4;->map:[Ljava/lang/String;

    .line 581
    goto/16 :goto_24

    .line 583
    :pswitch_2af
    sget-object v4, Lgcardone/junidecode/Xd5;->map:[Ljava/lang/String;

    .line 584
    goto/16 :goto_24

    .line 586
    :pswitch_2b3
    sget-object v4, Lgcardone/junidecode/Xd6;->map:[Ljava/lang/String;

    .line 587
    goto/16 :goto_24

    .line 589
    :pswitch_2b7
    sget-object v4, Lgcardone/junidecode/Xd7;->map:[Ljava/lang/String;

    .line 590
    goto/16 :goto_24

    .line 592
    :pswitch_2bb
    sget-object v4, Lgcardone/junidecode/Xf9;->map:[Ljava/lang/String;

    .line 593
    goto/16 :goto_24

    .line 595
    :pswitch_2bf
    sget-object v4, Lgcardone/junidecode/Xfa;->map:[Ljava/lang/String;

    .line 596
    goto/16 :goto_24

    .line 598
    :pswitch_2c3
    sget-object v4, Lgcardone/junidecode/Xfb;->map:[Ljava/lang/String;

    .line 599
    goto/16 :goto_24

    .line 601
    :pswitch_2c7
    sget-object v4, Lgcardone/junidecode/Xfc;->map:[Ljava/lang/String;

    .line 602
    goto/16 :goto_24

    .line 604
    :pswitch_2cb
    sget-object v4, Lgcardone/junidecode/Xfd;->map:[Ljava/lang/String;

    .line 605
    goto/16 :goto_24

    .line 607
    :pswitch_2cf
    sget-object v4, Lgcardone/junidecode/Xfe;->map:[Ljava/lang/String;

    .line 608
    goto/16 :goto_24

    .line 610
    :pswitch_2d3
    sget-object v4, Lgcardone/junidecode/Xff;->map:[Ljava/lang/String;

    .line 611
    goto/16 :goto_24

    .line 629
    .end local v0    # "codepoint":I
    .end local v1    # "hi":I
    .end local v3    # "low":I
    .end local v4    # "map":[Ljava/lang/String;
    :cond_2d7
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 71
    :pswitch_data_2dc
    .packed-switch 0x0
        :pswitch_22
        :pswitch_31
        :pswitch_34
        :pswitch_37
        :pswitch_3a
        :pswitch_3d
        :pswitch_40
        :pswitch_43
        :pswitch_1f
        :pswitch_46
        :pswitch_49
        :pswitch_4c
        :pswitch_4f
        :pswitch_52
        :pswitch_55
        :pswitch_58
        :pswitch_5b
        :pswitch_5e
        :pswitch_61
        :pswitch_64
        :pswitch_67
        :pswitch_6a
        :pswitch_6d
        :pswitch_70
        :pswitch_73
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_76
        :pswitch_79
        :pswitch_7c
        :pswitch_7f
        :pswitch_82
        :pswitch_85
        :pswitch_88
        :pswitch_8b
        :pswitch_8e
        :pswitch_91
        :pswitch_94
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_97
        :pswitch_9a
        :pswitch_9d
        :pswitch_a0
        :pswitch_a3
        :pswitch_a7
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_ab
        :pswitch_af
        :pswitch_b3
        :pswitch_b7
        :pswitch_bb
        :pswitch_bf
        :pswitch_c3
        :pswitch_c7
        :pswitch_cb
        :pswitch_cf
        :pswitch_d3
        :pswitch_d7
        :pswitch_db
        :pswitch_df
        :pswitch_e3
        :pswitch_e7
        :pswitch_eb
        :pswitch_ef
        :pswitch_f3
        :pswitch_f7
        :pswitch_fb
        :pswitch_ff
        :pswitch_103
        :pswitch_107
        :pswitch_10b
        :pswitch_10f
        :pswitch_113
        :pswitch_117
        :pswitch_11b
        :pswitch_11f
        :pswitch_123
        :pswitch_127
        :pswitch_12b
        :pswitch_12f
        :pswitch_133
        :pswitch_137
        :pswitch_13b
        :pswitch_13f
        :pswitch_143
        :pswitch_147
        :pswitch_14b
        :pswitch_14f
        :pswitch_153
        :pswitch_157
        :pswitch_15b
        :pswitch_15f
        :pswitch_163
        :pswitch_167
        :pswitch_16b
        :pswitch_16f
        :pswitch_173
        :pswitch_177
        :pswitch_17b
        :pswitch_17f
        :pswitch_183
        :pswitch_187
        :pswitch_18b
        :pswitch_18f
        :pswitch_193
        :pswitch_197
        :pswitch_19b
        :pswitch_19f
        :pswitch_1a3
        :pswitch_1a7
        :pswitch_1ab
        :pswitch_1af
        :pswitch_1b3
        :pswitch_1b7
        :pswitch_1bb
        :pswitch_1bf
        :pswitch_1c3
        :pswitch_1c7
        :pswitch_1cb
        :pswitch_1cf
        :pswitch_1d3
        :pswitch_1d7
        :pswitch_1db
        :pswitch_1df
        :pswitch_1e3
        :pswitch_1e7
        :pswitch_1eb
        :pswitch_1ef
        :pswitch_1f3
        :pswitch_1f7
        :pswitch_1fb
        :pswitch_1ff
        :pswitch_203
        :pswitch_207
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_20b
        :pswitch_20f
        :pswitch_213
        :pswitch_217
        :pswitch_21b
        :pswitch_21f
        :pswitch_223
        :pswitch_227
        :pswitch_22b
        :pswitch_22f
        :pswitch_233
        :pswitch_237
        :pswitch_23b
        :pswitch_23f
        :pswitch_243
        :pswitch_247
        :pswitch_24b
        :pswitch_24f
        :pswitch_253
        :pswitch_257
        :pswitch_25b
        :pswitch_25f
        :pswitch_263
        :pswitch_267
        :pswitch_26b
        :pswitch_26f
        :pswitch_273
        :pswitch_277
        :pswitch_27b
        :pswitch_27f
        :pswitch_283
        :pswitch_287
        :pswitch_28b
        :pswitch_28f
        :pswitch_293
        :pswitch_297
        :pswitch_29b
        :pswitch_29f
        :pswitch_2a3
        :pswitch_2a7
        :pswitch_2ab
        :pswitch_2af
        :pswitch_2b3
        :pswitch_2b7
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_1f
        :pswitch_2bb
        :pswitch_2bf
        :pswitch_2c3
        :pswitch_2c7
        :pswitch_2cb
        :pswitch_2cf
        :pswitch_2d3
    .end packed-switch
.end method
