.class public Lcom/koushikdutta/ion/bitmap/Exif;
.super Ljava/lang/Object;
.source "Exif.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraExif"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getOrientation([BII)I
    .registers 15
    .param p0, "jpeg"    # [B
    .param p1, "offset"    # I
    .param p2, "size"    # I

    .prologue
    .line 26
    if-nez p0, :cond_4

    .line 27
    const/4 v9, 0x0

    .line 119
    :goto_3
    return v9

    .line 30
    :cond_4
    const/4 v3, 0x0

    .line 31
    .local v3, "length":I
    add-int v2, p1, p2

    .local v2, "last":I
    move v6, p1

    .line 34
    .end local p1    # "offset":I
    .local v6, "offset":I
    :goto_8
    add-int/lit8 v9, v6, 0x3

    if-ge v9, v2, :cond_fa

    add-int/lit8 p1, v6, 0x1

    .end local v6    # "offset":I
    .restart local p1    # "offset":I
    aget-byte v9, p0, v6

    and-int/lit16 v9, v9, 0xff

    const/16 v10, 0xff

    if-ne v9, v10, :cond_33

    .line 35
    aget-byte v9, p0, p1

    and-int/lit16 v5, v9, 0xff

    .line 38
    .local v5, "marker":I
    const/16 v9, 0xff

    if-ne v5, v9, :cond_20

    move v6, p1

    .line 39
    .end local p1    # "offset":I
    .restart local v6    # "offset":I
    goto :goto_8

    .line 41
    .end local v6    # "offset":I
    .restart local p1    # "offset":I
    :cond_20
    add-int/lit8 p1, p1, 0x1

    .line 44
    const/16 v9, 0xd8

    if-eq v5, v9, :cond_f7

    const/4 v9, 0x1

    if-ne v5, v9, :cond_2b

    move v6, p1

    .line 45
    .end local p1    # "offset":I
    .restart local v6    # "offset":I
    goto :goto_8

    .line 48
    .end local v6    # "offset":I
    .restart local p1    # "offset":I
    :cond_2b
    const/16 v9, 0xd9

    if-eq v5, v9, :cond_33

    const/16 v9, 0xda

    if-ne v5, v9, :cond_50

    .line 74
    .end local v5    # "marker":I
    :cond_33
    :goto_33
    const/16 v9, 0x8

    if-le v3, v9, :cond_f4

    .line 76
    const/4 v9, 0x4

    const/4 v10, 0x0

    invoke-static {p0, p1, v9, v10}, Lcom/koushikdutta/ion/bitmap/Exif;->pack([BIIZ)I

    move-result v8

    .line 77
    .local v8, "tag":I
    const v9, 0x49492a00    # 823968.0f

    if-eq v8, v9, :cond_8f

    const v9, 0x4d4d002a    # 2.14958752E8f

    if-eq v8, v9, :cond_8f

    .line 78
    const-string v9, "CameraExif"

    const-string v10, "Invalid byte order"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    const/4 v9, 0x0

    goto :goto_3

    .line 53
    .end local v8    # "tag":I
    .restart local v5    # "marker":I
    :cond_50
    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-static {p0, p1, v9, v10}, Lcom/koushikdutta/ion/bitmap/Exif;->pack([BIIZ)I

    move-result v3

    .line 54
    const/4 v9, 0x2

    if-lt v3, v9, :cond_5d

    add-int v9, p1, v3

    if-le v9, v2, :cond_66

    .line 55
    :cond_5d
    const-string v9, "CameraExif"

    const-string v10, "Invalid length"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    const/4 v9, 0x0

    goto :goto_3

    .line 60
    :cond_66
    const/16 v9, 0xe1

    if-ne v5, v9, :cond_8a

    const/16 v9, 0x8

    if-lt v3, v9, :cond_8a

    add-int/lit8 v9, p1, 0x2

    const/4 v10, 0x4

    const/4 v11, 0x0

    .line 61
    invoke-static {p0, v9, v10, v11}, Lcom/koushikdutta/ion/bitmap/Exif;->pack([BIIZ)I

    move-result v9

    const v10, 0x45786966

    if-ne v9, v10, :cond_8a

    add-int/lit8 v9, p1, 0x6

    const/4 v10, 0x2

    const/4 v11, 0x0

    .line 62
    invoke-static {p0, v9, v10, v11}, Lcom/koushikdutta/ion/bitmap/Exif;->pack([BIIZ)I

    move-result v9

    if-nez v9, :cond_8a

    .line 63
    add-int/lit8 p1, p1, 0x8

    .line 64
    add-int/lit8 v3, v3, -0x8

    .line 65
    goto :goto_33

    .line 69
    :cond_8a
    add-int/2addr p1, v3

    .line 70
    const/4 v3, 0x0

    move v6, p1

    .line 71
    .end local p1    # "offset":I
    .restart local v6    # "offset":I
    goto/16 :goto_8

    .line 81
    .end local v5    # "marker":I
    .end local v6    # "offset":I
    .restart local v8    # "tag":I
    .restart local p1    # "offset":I
    :cond_8f
    const v9, 0x49492a00    # 823968.0f

    if-ne v8, v9, :cond_ae

    const/4 v4, 0x1

    .line 84
    .local v4, "littleEndian":Z
    :goto_95
    add-int/lit8 v9, p1, 0x4

    const/4 v10, 0x4

    invoke-static {p0, v9, v10, v4}, Lcom/koushikdutta/ion/bitmap/Exif;->pack([BIIZ)I

    move-result v9

    add-int/lit8 v0, v9, 0x2

    .line 85
    .local v0, "count":I
    const/16 v9, 0xa

    if-lt v0, v9, :cond_a4

    if-le v0, v3, :cond_b0

    .line 86
    :cond_a4
    const-string v9, "CameraExif"

    const-string v10, "Invalid offset"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    const/4 v9, 0x0

    goto/16 :goto_3

    .line 81
    .end local v0    # "count":I
    .end local v4    # "littleEndian":Z
    :cond_ae
    const/4 v4, 0x0

    goto :goto_95

    .line 89
    .restart local v0    # "count":I
    .restart local v4    # "littleEndian":Z
    :cond_b0
    add-int/2addr p1, v0

    .line 90
    sub-int/2addr v3, v0

    .line 93
    add-int/lit8 v9, p1, -0x2

    const/4 v10, 0x2

    invoke-static {p0, v9, v10, v4}, Lcom/koushikdutta/ion/bitmap/Exif;->pack([BIIZ)I

    move-result v0

    move v1, v0

    .line 94
    .end local v0    # "count":I
    .local v1, "count":I
    :goto_ba
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    if-lez v1, :cond_f4

    const/16 v9, 0xc

    if-lt v3, v9, :cond_f4

    .line 96
    const/4 v9, 0x2

    invoke-static {p0, p1, v9, v4}, Lcom/koushikdutta/ion/bitmap/Exif;->pack([BIIZ)I

    move-result v8

    .line 97
    const/16 v9, 0x112

    if-ne v8, v9, :cond_ee

    .line 99
    add-int/lit8 v9, p1, 0x8

    const/4 v10, 0x2

    invoke-static {p0, v9, v10, v4}, Lcom/koushikdutta/ion/bitmap/Exif;->pack([BIIZ)I

    move-result v7

    .line 100
    .local v7, "orientation":I
    packed-switch v7, :pswitch_data_fe

    .line 110
    :pswitch_d5
    const-string v9, "CameraExif"

    const-string v10, "Unsupported orientation"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const/4 v9, 0x0

    goto/16 :goto_3

    .line 102
    :pswitch_df
    const/4 v9, 0x0

    goto/16 :goto_3

    .line 104
    :pswitch_e2
    const/16 v9, 0xb4

    goto/16 :goto_3

    .line 106
    :pswitch_e6
    const/16 v9, 0x5a

    goto/16 :goto_3

    .line 108
    :pswitch_ea
    const/16 v9, 0x10e

    goto/16 :goto_3

    .line 113
    .end local v7    # "orientation":I
    :cond_ee
    add-int/lit8 p1, p1, 0xc

    .line 114
    add-int/lit8 v3, v3, -0xc

    move v1, v0

    .end local v0    # "count":I
    .restart local v1    # "count":I
    goto :goto_ba

    .line 119
    .end local v1    # "count":I
    .end local v4    # "littleEndian":Z
    .end local v8    # "tag":I
    :cond_f4
    const/4 v9, 0x0

    goto/16 :goto_3

    .restart local v5    # "marker":I
    :cond_f7
    move v6, p1

    .end local p1    # "offset":I
    .restart local v6    # "offset":I
    goto/16 :goto_8

    .end local v5    # "marker":I
    :cond_fa
    move p1, v6

    .end local v6    # "offset":I
    .restart local p1    # "offset":I
    goto/16 :goto_33

    .line 100
    nop

    :pswitch_data_fe
    .packed-switch 0x1
        :pswitch_df
        :pswitch_d5
        :pswitch_e2
        :pswitch_d5
        :pswitch_d5
        :pswitch_e6
        :pswitch_d5
        :pswitch_ea
    .end packed-switch
.end method

.method private static pack([BIIZ)I
    .registers 9
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "littleEndian"    # Z

    .prologue
    .line 124
    const/4 v1, 0x1

    .line 125
    .local v1, "step":I
    if-eqz p3, :cond_7

    .line 126
    add-int/lit8 v3, p2, -0x1

    add-int/2addr p1, v3

    .line 127
    const/4 v1, -0x1

    .line 130
    :cond_7
    const/4 v2, 0x0

    .local v2, "value":I
    move v0, p2

    .line 131
    .end local p2    # "length":I
    .local v0, "length":I
    :goto_9
    add-int/lit8 p2, v0, -0x1

    .end local v0    # "length":I
    .restart local p2    # "length":I
    if-lez v0, :cond_18

    .line 132
    shl-int/lit8 v3, v2, 0x8

    aget-byte v4, p0, p1

    and-int/lit16 v4, v4, 0xff

    or-int v2, v3, v4

    .line 133
    add-int/2addr p1, v1

    move v0, p2

    .end local p2    # "length":I
    .restart local v0    # "length":I
    goto :goto_9

    .line 135
    .end local v0    # "length":I
    .restart local p2    # "length":I
    :cond_18
    return v2
.end method
