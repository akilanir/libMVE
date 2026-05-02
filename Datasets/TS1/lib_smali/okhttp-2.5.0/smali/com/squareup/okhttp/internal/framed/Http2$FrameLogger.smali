.class final Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;
.super Ljava/lang/Object;
.source "Http2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/framed/Http2;
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
    .registers 14

    .prologue
    const/16 v11, 0x8

    const/4 v13, 0x4

    const/4 v12, 0x3

    const/4 v10, 0x1

    const/4 v6, 0x0

    .line 705
    const/16 v5, 0xa

    new-array v5, v5, [Ljava/lang/String;

    const-string v7, "DATA"

    aput-object v7, v5, v6

    const-string v7, "HEADERS"

    aput-object v7, v5, v10

    const/4 v7, 0x2

    const-string v8, "PRIORITY"

    aput-object v8, v5, v7

    const-string v7, "RST_STREAM"

    aput-object v7, v5, v12

    const-string v7, "SETTINGS"

    aput-object v7, v5, v13

    const/4 v7, 0x5

    const-string v8, "PUSH_PROMISE"

    aput-object v8, v5, v7

    const/4 v7, 0x6

    const-string v8, "PING"

    aput-object v8, v5, v7

    const/4 v7, 0x7

    const-string v8, "GOAWAY"

    aput-object v8, v5, v7

    const-string v7, "WINDOW_UPDATE"

    aput-object v7, v5, v11

    const/16 v7, 0x9

    const-string v8, "CONTINUATION"

    aput-object v8, v5, v7

    sput-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->TYPES:[Ljava/lang/String;

    .line 722
    const/16 v5, 0x40

    new-array v5, v5, [Ljava/lang/String;

    sput-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    .line 723
    const/16 v5, 0x100

    new-array v5, v5, [Ljava/lang/String;

    sput-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->BINARY:[Ljava/lang/String;

    .line 726
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_47
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->BINARY:[Ljava/lang/String;

    array-length v5, v5

    if-ge v2, v5, :cond_69

    .line 727
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->BINARY:[Ljava/lang/String;

    const-string v7, "%8s"

    new-array v8, v10, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v6

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x20

    const/16 v9, 0x30

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v2

    .line 726
    add-int/lit8 v2, v2, 0x1

    goto :goto_47

    .line 730
    :cond_69
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    const-string v7, ""

    aput-object v7, v5, v6

    .line 731
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    const-string v7, "END_STREAM"

    aput-object v7, v5, v10

    .line 733
    new-array v4, v10, [I

    aput v10, v4, v6

    .line 735
    .local v4, "prefixFlags":[I
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    const-string v7, "PADDED"

    aput-object v7, v5, v11

    .line 736
    array-length v7, v4

    move v5, v6

    :goto_81
    if-ge v5, v7, :cond_a5

    aget v3, v4, v5

    .line 737
    .local v3, "prefixFlag":I
    sget-object v8, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    or-int/lit8 v9, v3, 0x8

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v11, v11, v3

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "|PADDED"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    .line 736
    add-int/lit8 v5, v5, 0x1

    goto :goto_81

    .line 740
    .end local v3    # "prefixFlag":I
    :cond_a5
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    const-string v7, "END_HEADERS"

    aput-object v7, v5, v13

    .line 741
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/16 v7, 0x20

    const-string v8, "PRIORITY"

    aput-object v8, v5, v7

    .line 742
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/16 v7, 0x24

    const-string v8, "END_HEADERS|PRIORITY"

    aput-object v8, v5, v7

    .line 743
    new-array v1, v12, [I

    fill-array-data v1, :array_13e

    .line 746
    .local v1, "frameFlags":[I
    array-length v8, v1

    move v7, v6

    :goto_c2
    if-ge v7, v8, :cond_125

    aget v0, v1, v7

    .line 747
    .local v0, "frameFlag":I
    array-length v9, v4

    move v5, v6

    :goto_c8
    if-ge v5, v9, :cond_121

    aget v3, v4, v5

    .line 748
    .restart local v3    # "prefixFlag":I
    sget-object v10, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    or-int v11, v3, v0

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v13, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v13, v13, v3

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x7c

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    sget-object v13, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v13, v13, v0

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    .line 749
    sget-object v10, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    or-int v11, v3, v0

    or-int/lit8 v11, v11, 0x8

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v13, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v13, v13, v3

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x7c

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    sget-object v13, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v13, v13, v0

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "|PADDED"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    .line 747
    add-int/lit8 v5, v5, 0x1

    goto :goto_c8

    .line 746
    .end local v3    # "prefixFlag":I
    :cond_121
    add-int/lit8 v5, v7, 0x1

    move v7, v5

    goto :goto_c2

    .line 754
    .end local v0    # "frameFlag":I
    :cond_125
    const/4 v2, 0x0

    :goto_126
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    array-length v5, v5

    if-ge v2, v5, :cond_13c

    .line 755
    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v5, v5, v2

    if-nez v5, :cond_139

    sget-object v5, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    sget-object v6, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v6, v6, v2

    aput-object v6, v5, v2

    .line 754
    :cond_139
    add-int/lit8 v2, v2, 0x1

    goto :goto_126

    .line 757
    :cond_13c
    return-void

    .line 743
    nop

    :array_13e
    .array-data 4
        0x4
        0x20
        0x24
    .end array-data
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 668
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static formatFlags(BB)Ljava/lang/String;
    .registers 5
    .param p0, "type"    # B
    .param p1, "flags"    # B

    .prologue
    .line 683
    if-nez p1, :cond_5

    const-string v1, ""

    .line 701
    :goto_4
    return-object v1

    .line 684
    :cond_5
    packed-switch p0, :pswitch_data_48

    .line 694
    :pswitch_8
    sget-object v1, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    array-length v1, v1

    if-ge p1, v1, :cond_31

    sget-object v1, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v0, v1, p1

    .line 696
    .local v0, "result":Ljava/lang/String;
    :goto_11
    const/4 v1, 0x5

    if-ne p0, v1, :cond_36

    and-int/lit8 v1, p1, 0x4

    if-eqz v1, :cond_36

    .line 697
    const-string v1, "HEADERS"

    const-string v2, "PUSH_PROMISE"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    .line 687
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_21
    const/4 v1, 0x1

    if-ne p1, v1, :cond_27

    const-string v1, "ACK"

    goto :goto_4

    :cond_27
    sget-object v1, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v1, v1, p1

    goto :goto_4

    .line 692
    :pswitch_2c
    sget-object v1, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v1, v1, p1

    goto :goto_4

    .line 694
    :cond_31
    sget-object v1, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v0, v1, p1

    goto :goto_11

    .line 698
    .restart local v0    # "result":Ljava/lang/String;
    :cond_36
    if-nez p0, :cond_45

    and-int/lit8 v1, p1, 0x20

    if-eqz v1, :cond_45

    .line 699
    const-string v1, "PRIORITY"

    const-string v2, "COMPRESSED"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_45
    move-object v1, v0

    .line 701
    goto :goto_4

    .line 684
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
    .registers 12
    .param p0, "inbound"    # Z
    .param p1, "streamId"    # I
    .param p2, "length"    # I
    .param p3, "type"    # B
    .param p4, "flags"    # B

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 671
    sget-object v2, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->TYPES:[Ljava/lang/String;

    array-length v2, v2

    if-ge p3, v2, :cond_32

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->TYPES:[Ljava/lang/String;

    aget-object v1, v2, p3

    .line 672
    .local v1, "formattedType":Ljava/lang/String;
    :goto_b
    invoke-static {p3, p4}, Lcom/squareup/okhttp/internal/framed/Http2$FrameLogger;->formatFlags(BB)Ljava/lang/String;

    move-result-object v0

    .line 673
    .local v0, "formattedFlags":Ljava/lang/String;
    const-string v3, "%s 0x%08x %5d %-13s %s"

    const/4 v2, 0x5

    new-array v4, v2, [Ljava/lang/Object;

    if-eqz p0, :cond_41

    const-string v2, "<<"

    :goto_18
    aput-object v2, v4, v5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v6

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    const/4 v2, 0x3

    aput-object v1, v4, v2

    const/4 v2, 0x4

    aput-object v0, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 671
    .end local v0    # "formattedFlags":Ljava/lang/String;
    .end local v1    # "formattedType":Ljava/lang/String;
    :cond_32
    const-string v2, "0x%02x"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_b

    .line 673
    .restart local v0    # "formattedFlags":Ljava/lang/String;
    .restart local v1    # "formattedType":Ljava/lang/String;
    :cond_41
    const-string v2, ">>"

    goto :goto_18
.end method
