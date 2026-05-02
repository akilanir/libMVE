.class public final Lorg/acra/file/CrashReportPersister;
.super Ljava/lang/Object;
.source "CrashReportPersister.java"


# static fields
.field private static final CONTINUE:I = 0x3

.field private static final IGNORE:I = 0x5

.field private static final KEY_DONE:I = 0x4

.field private static final LINE_SEPARATOR:Ljava/lang/String; = "\n"

.field private static final NONE:I = 0x0

.field private static final SLASH:I = 0x1

.field private static final UNICODE:I = 0x2


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private dumpString(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V
    .registers 10
    .param p1, "buffer"    # Ljava/lang/StringBuilder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "key"    # Z

    .prologue
    const/16 v5, 0x20

    .line 302
    const/4 v2, 0x0

    .line 303
    .local v2, "i":I
    if-nez p3, :cond_18

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_18

    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_18

    .line 304
    const-string v4, "\\ "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    add-int/lit8 v2, v2, 0x1

    .line 308
    :cond_18
    :goto_18
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_78

    .line 309
    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 310
    .local v0, "ch":C
    packed-switch v0, :pswitch_data_7a

    .line 324
    :pswitch_25
    const-string v4, "\\#!=:"

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gez v4, :cond_31

    if-eqz p3, :cond_36

    if-ne v0, v5, :cond_36

    .line 325
    :cond_31
    const/16 v4, 0x5c

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 327
    :cond_36
    if-lt v0, v5, :cond_5a

    const/16 v4, 0x7e

    if-gt v0, v4, :cond_5a

    .line 328
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 308
    :goto_3f
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 312
    :pswitch_42
    const-string v4, "\\t"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3f

    .line 315
    :pswitch_48
    const-string v4, "\\n"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3f

    .line 318
    :pswitch_4e
    const-string v4, "\\f"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3f

    .line 321
    :pswitch_54
    const-string v4, "\\r"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3f

    .line 330
    :cond_5a
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 331
    .local v1, "hex":Ljava/lang/String;
    const-string v4, "\\u"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_64
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    rsub-int/lit8 v4, v4, 0x4

    if-ge v3, v4, :cond_74

    .line 333
    const/16 v4, 0x30

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 332
    add-int/lit8 v3, v3, 0x1

    goto :goto_64

    .line 335
    :cond_74
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3f

    .line 339
    .end local v0    # "ch":C
    .end local v1    # "hex":Ljava/lang/String;
    .end local v3    # "j":I
    :cond_78
    return-void

    .line 310
    nop

    :pswitch_data_7a
    .packed-switch 0x9
        :pswitch_42
        :pswitch_48
        :pswitch_25
        :pswitch_4e
        :pswitch_54
    .end packed-switch
.end method

.method private declared-synchronized load(Ljava/io/Reader;)Lorg/acra/collector/CrashReportData;
    .registers 23
    .param p1, "reader"    # Ljava/io/Reader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    monitor-enter p0

    const/4 v11, 0x0

    .local v11, "mode":I
    const/16 v17, 0x0

    .local v17, "unicode":I
    const/4 v4, 0x0

    .line 124
    .local v4, "count":I
    const/16 v19, 0x28

    :try_start_7
    move/from16 v0, v19

    new-array v3, v0, [C

    .line 125
    .local v3, "buf":[C
    const/4 v14, 0x0

    .local v14, "offset":I
    const/4 v10, -0x1

    .line 126
    .local v10, "keyLength":I
    const/4 v7, 0x1

    .line 128
    .local v7, "firstChar":Z
    new-instance v5, Lorg/acra/collector/CrashReportData;

    invoke-direct {v5}, Lorg/acra/collector/CrashReportData;-><init>()V

    .line 129
    .local v5, "crashData":Lorg/acra/collector/CrashReportData;
    new-instance v2, Ljava/io/BufferedReader;

    const/16 v19, 0x2000

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-direct {v2, v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_1e
    .catchall {:try_start_7 .. :try_end_1e} :catchall_43

    .local v2, "br":Ljava/io/BufferedReader;
    move v15, v14

    .line 132
    .end local v14    # "offset":I
    .local v15, "offset":I
    :cond_1f
    :goto_1f
    :try_start_1f
    invoke-virtual {v2}, Ljava/io/BufferedReader;->read()I

    move-result v8

    .line 133
    .local v8, "intVal":I
    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v8, v0, :cond_46

    .line 269
    const/16 v19, 0x2

    move/from16 v0, v19

    if-ne v11, v0, :cond_187

    const/16 v19, 0x4

    move/from16 v0, v19

    if-gt v4, v0, :cond_187

    .line 271
    new-instance v19, Ljava/lang/IllegalArgumentException;

    const-string v20, "luni.08"

    invoke-direct/range {v19 .. v20}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v19
    :try_end_3d
    .catchall {:try_start_1f .. :try_end_3d} :catchall_3d

    .line 290
    .end local v8    # "intVal":I
    :catchall_3d
    move-exception v19

    move v14, v15

    .end local v15    # "offset":I
    .restart local v14    # "offset":I
    :goto_3f
    :try_start_3f
    invoke-static {v2}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    throw v19
    :try_end_43
    .catchall {:try_start_3f .. :try_end_43} :catchall_43

    .line 122
    .end local v2    # "br":Ljava/io/BufferedReader;
    .end local v3    # "buf":[C
    .end local v5    # "crashData":Lorg/acra/collector/CrashReportData;
    .end local v7    # "firstChar":Z
    .end local v10    # "keyLength":I
    .end local v14    # "offset":I
    :catchall_43
    move-exception v19

    monitor-exit p0

    throw v19

    .line 136
    .restart local v2    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "buf":[C
    .restart local v5    # "crashData":Lorg/acra/collector/CrashReportData;
    .restart local v7    # "firstChar":Z
    .restart local v8    # "intVal":I
    .restart local v10    # "keyLength":I
    .restart local v15    # "offset":I
    :cond_46
    int-to-char v13, v8

    .line 138
    .local v13, "nextChar":C
    :try_start_47
    array-length v0, v3

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v15, v0, :cond_63

    .line 139
    array-length v0, v3

    move/from16 v19, v0

    mul-int/lit8 v19, v19, 0x2

    move/from16 v0, v19

    new-array v12, v0, [C

    .line 140
    .local v12, "newBuf":[C
    const/16 v19, 0x0

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v3, v0, v12, v1, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 141
    move-object v3, v12

    .line 143
    .end local v12    # "newBuf":[C
    :cond_63
    const/16 v19, 0x2

    move/from16 v0, v19

    if-ne v11, v0, :cond_a6

    .line 144
    const/16 v19, 0x10

    move/from16 v0, v19

    invoke-static {v13, v0}, Ljava/lang/Character;->digit(CI)I
    :try_end_70
    .catchall {:try_start_47 .. :try_end_70} :catchall_3d

    move-result v6

    .line 145
    .local v6, "digit":I
    if-ltz v6, :cond_97

    .line 146
    shl-int/lit8 v19, v17, 0x4

    add-int v17, v19, v6

    .line 147
    add-int/lit8 v4, v4, 0x1

    const/16 v19, 0x4

    move/from16 v0, v19

    if-lt v4, v0, :cond_1f

    .line 154
    :cond_7f
    const/4 v11, 0x0

    .line 155
    add-int/lit8 v14, v15, 0x1

    .end local v15    # "offset":I
    .restart local v14    # "offset":I
    move/from16 v0, v17

    int-to-char v0, v0

    move/from16 v19, v0

    :try_start_87
    aput-char v19, v3, v15
    :try_end_89
    .catchall {:try_start_87 .. :try_end_89} :catchall_1df

    .line 156
    const/16 v19, 0xa

    move/from16 v0, v19

    if-eq v13, v0, :cond_a5

    const/16 v19, 0x85

    move/from16 v0, v19

    if-eq v13, v0, :cond_a5

    move v15, v14

    .line 157
    .end local v14    # "offset":I
    .restart local v15    # "offset":I
    goto :goto_1f

    .line 150
    :cond_97
    const/16 v19, 0x4

    move/from16 v0, v19

    if-gt v4, v0, :cond_7f

    .line 152
    :try_start_9d
    new-instance v19, Ljava/lang/IllegalArgumentException;

    const-string v20, "luni.09"

    invoke-direct/range {v19 .. v20}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v19
    :try_end_a5
    .catchall {:try_start_9d .. :try_end_a5} :catchall_3d

    .end local v15    # "offset":I
    .restart local v14    # "offset":I
    :cond_a5
    move v15, v14

    .line 160
    .end local v6    # "digit":I
    .end local v14    # "offset":I
    .restart local v15    # "offset":I
    :cond_a6
    const/16 v19, 0x1

    move/from16 v0, v19

    if-ne v11, v0, :cond_db

    .line 161
    const/4 v11, 0x0

    .line 162
    sparse-switch v13, :sswitch_data_1e2

    .line 262
    :cond_b0
    :goto_b0
    const/4 v7, 0x0

    .line 263
    const/16 v19, 0x4

    move/from16 v0, v19

    if-ne v11, v0, :cond_b9

    .line 264
    move v10, v15

    .line 265
    const/4 v11, 0x0

    .line 267
    :cond_b9
    add-int/lit8 v14, v15, 0x1

    .end local v15    # "offset":I
    .restart local v14    # "offset":I
    :try_start_bb
    aput-char v13, v3, v15
    :try_end_bd
    .catchall {:try_start_bb .. :try_end_bd} :catchall_1df

    move v15, v14

    .end local v14    # "offset":I
    .restart local v15    # "offset":I
    goto/16 :goto_1f

    .line 164
    :sswitch_c0
    const/4 v11, 0x3

    .line 165
    goto/16 :goto_1f

    .line 168
    :sswitch_c3
    const/4 v11, 0x5

    .line 169
    goto/16 :goto_1f

    .line 171
    :sswitch_c6
    const/16 v13, 0x8

    .line 172
    goto :goto_b0

    .line 174
    :sswitch_c9
    const/16 v13, 0xc

    .line 175
    goto :goto_b0

    .line 177
    :sswitch_cc
    const/16 v13, 0xa

    .line 178
    goto :goto_b0

    .line 180
    :sswitch_cf
    const/16 v13, 0xd

    .line 181
    goto :goto_b0

    .line 183
    :sswitch_d2
    const/16 v13, 0x9

    .line 184
    goto :goto_b0

    .line 186
    :sswitch_d5
    const/4 v11, 0x2

    .line 187
    const/4 v4, 0x0

    move/from16 v17, v4

    .line 188
    goto/16 :goto_1f

    .line 191
    :cond_db
    sparse-switch v13, :sswitch_data_208

    .line 245
    :cond_de
    :try_start_de
    invoke-static {v13}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v19

    if-eqz v19, :cond_178

    .line 246
    const/16 v19, 0x3

    move/from16 v0, v19

    if-ne v11, v0, :cond_eb

    .line 247
    const/4 v11, 0x5

    .line 250
    :cond_eb
    if-eqz v15, :cond_1f

    if-eq v15, v10, :cond_1f

    const/16 v19, 0x5

    move/from16 v0, v19

    if-eq v11, v0, :cond_1f

    .line 253
    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v10, v0, :cond_178

    .line 254
    const/4 v11, 0x4

    .line 255
    goto/16 :goto_1f

    .line 194
    :sswitch_fe
    if-eqz v7, :cond_de

    .line 196
    :cond_100
    invoke-virtual {v2}, Ljava/io/BufferedReader;->read()I

    move-result v8

    .line 197
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v8, v0, :cond_1f

    .line 200
    int-to-char v13, v8

    .line 203
    const/16 v19, 0xd

    move/from16 v0, v19

    if-eq v13, v0, :cond_1f

    const/16 v19, 0xa

    move/from16 v0, v19

    if-eq v13, v0, :cond_1f

    const/16 v19, 0x85

    move/from16 v0, v19

    if-ne v13, v0, :cond_100

    goto/16 :goto_1f

    .line 211
    :sswitch_11f
    const/16 v19, 0x3

    move/from16 v0, v19

    if-ne v11, v0, :cond_128

    .line 212
    const/4 v11, 0x5

    .line 213
    goto/16 :goto_1f

    .line 218
    :cond_128
    :sswitch_128
    const/4 v11, 0x0

    .line 219
    const/4 v7, 0x1

    .line 220
    if-gtz v15, :cond_130

    if-nez v15, :cond_15f

    if-nez v10, :cond_15f

    .line 221
    :cond_130
    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v10, v0, :cond_137

    .line 222
    move v10, v15

    .line 224
    :cond_137
    new-instance v16, Ljava/lang/String;

    const/16 v19, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-direct {v0, v3, v1, v15}, Ljava/lang/String;-><init>([CII)V

    .line 225
    .local v16, "temp":Ljava/lang/String;
    const-class v19, Lorg/acra/ReportField;

    const/16 v20, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v19

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    .end local v16    # "temp":Ljava/lang/String;
    :cond_15f
    const/4 v10, -0x1

    .line 228
    const/4 v14, 0x0

    .end local v15    # "offset":I
    .restart local v14    # "offset":I
    move v15, v14

    .line 229
    .end local v14    # "offset":I
    .restart local v15    # "offset":I
    goto/16 :goto_1f

    .line 231
    :sswitch_164
    const/16 v19, 0x4

    move/from16 v0, v19

    if-ne v11, v0, :cond_16b

    .line 232
    move v10, v15

    .line 234
    :cond_16b
    const/4 v11, 0x1

    .line 235
    goto/16 :goto_1f

    .line 238
    :sswitch_16e
    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v10, v0, :cond_de

    .line 239
    const/4 v11, 0x0

    .line 240
    move v10, v15

    .line 241
    goto/16 :goto_1f

    .line 258
    :cond_178
    const/16 v19, 0x5

    move/from16 v0, v19

    if-eq v11, v0, :cond_184

    const/16 v19, 0x3

    move/from16 v0, v19

    if-ne v11, v0, :cond_b0

    .line 259
    :cond_184
    const/4 v11, 0x0

    goto/16 :goto_b0

    .line 273
    .end local v13    # "nextChar":C
    :cond_187
    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v10, v0, :cond_190

    if-lez v15, :cond_190

    .line 274
    move v10, v15

    .line 276
    :cond_190
    if-ltz v10, :cond_1d7

    .line 277
    new-instance v16, Ljava/lang/String;

    const/16 v19, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-direct {v0, v3, v1, v15}, Ljava/lang/String;-><init>([CII)V

    .line 278
    .restart local v16    # "temp":Ljava/lang/String;
    const-class v19, Lorg/acra/ReportField;

    const/16 v20, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v9

    check-cast v9, Lorg/acra/ReportField;

    .line 279
    .local v9, "key":Lorg/acra/ReportField;
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    .line 280
    .local v18, "value":Ljava/lang/String;
    const/16 v19, 0x1

    move/from16 v0, v19

    if-ne v11, v0, :cond_1d2

    .line 281
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\u0000"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 283
    :cond_1d2
    move-object/from16 v0, v18

    invoke-virtual {v5, v9, v0}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    .end local v9    # "key":Lorg/acra/ReportField;
    .end local v16    # "temp":Ljava/lang/String;
    .end local v18    # "value":Ljava/lang/String;
    :cond_1d7
    invoke-static/range {p1 .. p1}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V
    :try_end_1da
    .catchall {:try_start_de .. :try_end_1da} :catchall_3d

    .line 290
    :try_start_1da
    invoke-static {v2}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V
    :try_end_1dd
    .catchall {:try_start_1da .. :try_end_1dd} :catchall_43

    monitor-exit p0

    return-object v5

    .end local v15    # "offset":I
    .restart local v13    # "nextChar":C
    .restart local v14    # "offset":I
    :catchall_1df
    move-exception v19

    goto/16 :goto_3f

    .line 162
    :sswitch_data_1e2
    .sparse-switch
        0xa -> :sswitch_c3
        0xd -> :sswitch_c0
        0x62 -> :sswitch_c6
        0x66 -> :sswitch_c9
        0x6e -> :sswitch_cc
        0x72 -> :sswitch_cf
        0x74 -> :sswitch_d2
        0x75 -> :sswitch_d5
        0x85 -> :sswitch_c3
    .end sparse-switch

    .line 191
    :sswitch_data_208
    .sparse-switch
        0xa -> :sswitch_11f
        0xd -> :sswitch_128
        0x21 -> :sswitch_fe
        0x23 -> :sswitch_fe
        0x3a -> :sswitch_16e
        0x3d -> :sswitch_16e
        0x5c -> :sswitch_164
        0x85 -> :sswitch_128
    .end sparse-switch
.end method


# virtual methods
.method public load(Ljava/io/File;)Lorg/acra/collector/CrashReportData;
    .registers 5
    .param p1, "file"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 v2, 0x2000

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 56
    .local v0, "in":Ljava/io/InputStream;
    :try_start_c
    new-instance v1, Ljava/io/InputStreamReader;

    const-string v2, "ISO8859-1"

    invoke-direct {v1, v0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lorg/acra/file/CrashReportPersister;->load(Ljava/io/Reader;)Lorg/acra/collector/CrashReportData;
    :try_end_16
    .catchall {:try_start_c .. :try_end_16} :catchall_1b

    move-result-object v1

    .line 58
    invoke-static {v0}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    return-object v1

    :catchall_1b
    move-exception v1

    invoke-static {v0}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    throw v1
.end method

.method public store(Lorg/acra/collector/CrashReportData;Ljava/io/File;)V
    .registers 10
    .param p1, "crashData"    # Lorg/acra/collector/CrashReportData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "file"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v3, Ljava/io/OutputStreamWriter;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v5, "ISO8859_1"

    invoke-direct {v3, v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 75
    .local v3, "writer":Ljava/io/OutputStreamWriter;
    :try_start_c
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v4, 0xc8

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 77
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Lorg/acra/collector/CrashReportData;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 78
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/acra/ReportField;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/acra/ReportField;

    invoke-virtual {v4}, Lorg/acra/ReportField;->toString()Ljava/lang/String;

    move-result-object v2

    .line 79
    .local v2, "key":Ljava/lang/String;
    const/4 v4, 0x1

    invoke-direct {p0, v0, v2, v4}, Lorg/acra/file/CrashReportPersister;->dumpString(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    .line 80
    const/16 v4, 0x3d

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 81
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v6, 0x0

    invoke-direct {p0, v0, v4, v6}, Lorg/acra/file/CrashReportPersister;->dumpString(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    .line 82
    const-string v4, "\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 84
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->setLength(I)V
    :try_end_54
    .catchall {:try_start_c .. :try_end_54} :catchall_55

    goto :goto_1b

    .line 88
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lorg/acra/ReportField;Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    :catchall_55
    move-exception v4

    invoke-static {v3}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    throw v4

    .line 86
    .restart local v0    # "buffer":Ljava/lang/StringBuilder;
    :cond_5a
    :try_start_5a
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V
    :try_end_5d
    .catchall {:try_start_5a .. :try_end_5d} :catchall_55

    .line 88
    invoke-static {v3}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    .line 90
    return-void
.end method
