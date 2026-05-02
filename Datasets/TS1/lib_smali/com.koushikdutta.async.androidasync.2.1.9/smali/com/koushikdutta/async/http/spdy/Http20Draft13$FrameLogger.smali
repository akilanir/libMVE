.class final Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;
.super Ljava/lang/Object;
.source "Http20Draft13.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/spdy/Http20Draft13;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FrameLogger"
.end annotation


# static fields
.field private static final BINARY:[Ljava/lang/String;

.field private static final FLAGS:[Ljava/lang/String;

.field private static final TYPES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 17

    .prologue
    .line 709
    const/16 v11, 0xa

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    const-string v13, "DATA"

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const-string v13, "HEADERS"

    aput-object v13, v11, v12

    const/4 v12, 0x2

    const-string v13, "PRIORITY"

    aput-object v13, v11, v12

    const/4 v12, 0x3

    const-string v13, "RST_STREAM"

    aput-object v13, v11, v12

    const/4 v12, 0x4

    const-string v13, "SETTINGS"

    aput-object v13, v11, v12

    const/4 v12, 0x5

    const-string v13, "PUSH_PROMISE"

    aput-object v13, v11, v12

    const/4 v12, 0x6

    const-string v13, "PING"

    aput-object v13, v11, v12

    const/4 v12, 0x7

    const-string v13, "GOAWAY"

    aput-object v13, v11, v12

    const/16 v12, 0x8

    const-string v13, "WINDOW_UPDATE"

    aput-object v13, v11, v12

    const/16 v12, 0x9

    const-string v13, "CONTINUATION"

    aput-object v13, v11, v12

    sput-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->TYPES:[Ljava/lang/String;

    .line 726
    const/16 v11, 0x40

    new-array v11, v11, [Ljava/lang/String;

    sput-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    .line 727
    const/16 v11, 0x100

    new-array v11, v11, [Ljava/lang/String;

    sput-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->BINARY:[Ljava/lang/String;

    .line 730
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_47
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->BINARY:[Ljava/lang/String;

    array-length v11, v11

    if-ge v4, v11, :cond_6d

    .line 731
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->BINARY:[Ljava/lang/String;

    sget-object v12, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v13, "%8s"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x20

    const/16 v14, 0x30

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v11, v4

    .line 730
    add-int/lit8 v4, v4, 0x1

    goto :goto_47

    .line 734
    :cond_6d
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/4 v12, 0x0

    const-string v13, ""

    aput-object v13, v11, v12

    .line 735
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/4 v12, 0x1

    const-string v13, "END_STREAM"

    aput-object v13, v11, v12

    .line 736
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/4 v12, 0x2

    const-string v13, "END_SEGMENT"

    aput-object v13, v11, v12

    .line 737
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/4 v12, 0x3

    const-string v13, "END_STREAM|END_SEGMENT"

    aput-object v13, v11, v12

    .line 738
    const/4 v11, 0x3

    new-array v10, v11, [I

    fill-array-data v10, :array_15c

    .line 741
    .local v10, "prefixFlags":[I
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/16 v12, 0x8

    const-string v13, "PADDED"

    aput-object v13, v11, v12

    .line 742
    move-object v0, v10

    .local v0, "arr$":[I
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_9a
    if-ge v5, v7, :cond_be

    aget v9, v0, v5

    .line 743
    .local v9, "prefixFlag":I
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    or-int/lit8 v12, v9, 0x8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v14, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v9

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "|PADDED"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    .line 742
    add-int/lit8 v5, v5, 0x1

    goto :goto_9a

    .line 746
    .end local v9    # "prefixFlag":I
    :cond_be
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/4 v12, 0x4

    const-string v13, "END_HEADERS"

    aput-object v13, v11, v12

    .line 747
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/16 v12, 0x20

    const-string v13, "PRIORITY"

    aput-object v13, v11, v12

    .line 748
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/16 v12, 0x24

    const-string v13, "END_HEADERS|PRIORITY"

    aput-object v13, v11, v12

    .line 749
    const/4 v11, 0x3

    new-array v3, v11, [I

    fill-array-data v3, :array_166

    .line 752
    .local v3, "frameFlags":[I
    move-object v0, v3

    array-length v7, v0

    const/4 v5, 0x0

    move v6, v5

    .end local v0    # "arr$":[I
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    .local v6, "i$":I
    :goto_df
    if-ge v6, v7, :cond_143

    aget v2, v0, v6

    .line 753
    .local v2, "frameFlag":I
    move-object v1, v10

    .local v1, "arr$":[I
    array-length v8, v1

    .local v8, "len$":I
    const/4 v5, 0x0

    .end local v6    # "i$":I
    .restart local v5    # "i$":I
    :goto_e6
    if-ge v5, v8, :cond_13f

    aget v9, v1, v5

    .line 754
    .restart local v9    # "prefixFlag":I
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    or-int v12, v9, v2

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v14, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v9

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x7c

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v2

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    .line 755
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    or-int v12, v9, v2

    or-int/lit8 v12, v12, 0x8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v14, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v9

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x7c

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v2

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "|PADDED"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    .line 753
    add-int/lit8 v5, v5, 0x1

    goto :goto_e6

    .line 752
    .end local v9    # "prefixFlag":I
    :cond_13f
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_df

    .line 760
    .end local v1    # "arr$":[I
    .end local v2    # "frameFlag":I
    .end local v8    # "len$":I
    :cond_143
    const/4 v4, 0x0

    :goto_144
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    array-length v11, v11

    if-ge v4, v11, :cond_15a

    .line 761
    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v11, v11, v4

    if-nez v11, :cond_157

    sget-object v11, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    sget-object v12, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v12, v12, v4

    aput-object v12, v11, v4

    .line 760
    :cond_157
    add-int/lit8 v4, v4, 0x1

    goto :goto_144

    .line 763
    :cond_15a
    return-void

    .line 738
    nop

    :array_15c
    .array-data 4
        0x1
        0x2
        0x3
    .end array-data

    .line 749
    :array_166
    .array-data 4
        0x4
        0x20
        0x24
    .end array-data
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 670
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static formatFlags(BB)Ljava/lang/String;
    .registers 5
    .param p0, "type"    # B
    .param p1, "flags"    # B

    .prologue
    .line 685
    if-nez p1, :cond_5

    const-string v1, ""

    .line 703
    :goto_4
    return-object v1

    .line 686
    :cond_5
    packed-switch p0, :pswitch_data_48

    .line 696
    :pswitch_8
    sget-object v1, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    array-length v1, v1

    if-ge p1, v1, :cond_31

    sget-object v1, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v0, v1, p1

    .line 698
    .local v0, "result":Ljava/lang/String;
    :goto_11
    const/4 v1, 0x5

    if-ne p0, v1, :cond_36

    and-int/lit8 v1, p1, 0x4

    if-eqz v1, :cond_36

    .line 699
    const-string v1, "HEADERS"

    const-string v2, "PUSH_PROMISE"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    .line 689
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_21
    const/4 v1, 0x1

    if-ne p1, v1, :cond_27

    const-string v1, "ACK"

    goto :goto_4

    :cond_27
    sget-object v1, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v1, v1, p1

    goto :goto_4

    .line 694
    :pswitch_2c
    sget-object v1, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v1, v1, p1

    goto :goto_4

    .line 696
    :cond_31
    sget-object v1, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v0, v1, p1

    goto :goto_11

    .line 700
    .restart local v0    # "result":Ljava/lang/String;
    :cond_36
    if-nez p0, :cond_45

    and-int/lit8 v1, p1, 0x20

    if-eqz v1, :cond_45

    .line 701
    const-string v1, "PRIORITY"

    const-string v2, "COMPRESSED"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_45
    move-object v1, v0

    .line 703
    goto :goto_4

    .line 686
    nop

    :pswitch_data_48
    .packed-switch 0x2
        :pswitch_2c
        :pswitch_2c
        :pswitch_21
        :pswitch_8
        :pswitch_21
        :pswitch_2c
        :pswitch_2c
    .end packed-switch
.end method

.method static formatHeader(ZIIBB)Ljava/lang/String;
    .registers 13
    .param p0, "inbound"    # Z
    .param p1, "streamId"    # I
    .param p2, "length"    # I
    .param p3, "type"    # B
    .param p4, "flags"    # B

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 673
    sget-object v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->TYPES:[Ljava/lang/String;

    array-length v2, v2

    if-ge p3, v2, :cond_34

    sget-object v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->TYPES:[Ljava/lang/String;

    aget-object v1, v2, p3

    .line 674
    .local v1, "formattedType":Ljava/lang/String;
    :goto_b
    invoke-static {p3, p4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$FrameLogger;->formatFlags(BB)Ljava/lang/String;

    move-result-object v0

    .line 675
    .local v0, "formattedFlags":Ljava/lang/String;
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "%s 0x%08x %5d %-13s %s"

    const/4 v2, 0x5

    new-array v5, v2, [Ljava/lang/Object;

    if-eqz p0, :cond_45

    const-string v2, "<<"

    :goto_1a
    aput-object v2, v5, v6

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v7

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    const/4 v2, 0x3

    aput-object v1, v5, v2

    const/4 v2, 0x4

    aput-object v0, v5, v2

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 673
    .end local v0    # "formattedFlags":Ljava/lang/String;
    .end local v1    # "formattedType":Ljava/lang/String;
    :cond_34
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "0x%02x"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_b

    .line 675
    .restart local v0    # "formattedFlags":Ljava/lang/String;
    .restart local v1    # "formattedType":Ljava/lang/String;
    :cond_45
    const-string v2, ">>"

    goto :goto_1a
.end method
