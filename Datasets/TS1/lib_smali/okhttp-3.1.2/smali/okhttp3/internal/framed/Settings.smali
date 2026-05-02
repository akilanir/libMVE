.class public final Lokhttp3/internal/framed/Settings;
.super Ljava/lang/Object;
.source "Settings.java"


# static fields
.field static final CLIENT_CERTIFICATE_VECTOR_SIZE:I = 0x8

.field static final COUNT:I = 0xa

.field static final CURRENT_CWND:I = 0x5

.field static final DEFAULT_INITIAL_WINDOW_SIZE:I = 0x10000

.field static final DOWNLOAD_BANDWIDTH:I = 0x2

.field static final DOWNLOAD_RETRANS_RATE:I = 0x6

.field static final ENABLE_PUSH:I = 0x2

.field static final FLAG_CLEAR_PREVIOUSLY_PERSISTED_SETTINGS:I = 0x1

.field static final FLOW_CONTROL_OPTIONS:I = 0xa

.field static final FLOW_CONTROL_OPTIONS_DISABLED:I = 0x1

.field static final HEADER_TABLE_SIZE:I = 0x1

.field static final INITIAL_WINDOW_SIZE:I = 0x7

.field static final MAX_CONCURRENT_STREAMS:I = 0x4

.field static final MAX_FRAME_SIZE:I = 0x5

.field static final MAX_HEADER_LIST_SIZE:I = 0x6

.field static final PERSISTED:I = 0x2

.field static final PERSIST_VALUE:I = 0x1

.field static final ROUND_TRIP_TIME:I = 0x3

.field static final UPLOAD_BANDWIDTH:I = 0x1


# instance fields
.field private persistValue:I

.field private persisted:I

.field private set:I

.field private final values:[I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    const/16 v0, 0xa

    new-array v0, v0, [I

    iput-object v0, p0, Lokhttp3/internal/framed/Settings;->values:[I

    return-void
.end method


# virtual methods
.method clear()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 85
    iput v1, p0, Lokhttp3/internal/framed/Settings;->persisted:I

    iput v1, p0, Lokhttp3/internal/framed/Settings;->persistValue:I

    iput v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    .line 86
    iget-object v0, p0, Lokhttp3/internal/framed/Settings;->values:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 87
    return-void
.end method

.method flags(I)I
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 124
    const/4 v0, 0x0

    .line 125
    .local v0, "result":I
    invoke-virtual {p0, p1}, Lokhttp3/internal/framed/Settings;->isPersisted(I)Z

    move-result v1

    if-eqz v1, :cond_9

    or-int/lit8 v0, v0, 0x2

    .line 126
    :cond_9
    invoke-virtual {p0, p1}, Lokhttp3/internal/framed/Settings;->persistValue(I)Z

    move-result v1

    if-eqz v1, :cond_11

    or-int/lit8 v0, v0, 0x1

    .line 127
    :cond_11
    return v0
.end method

.method get(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 119
    iget-object v0, p0, Lokhttp3/internal/framed/Settings;->values:[I

    aget v0, v0, p1

    return v0
.end method

.method getClientCertificateVectorSize(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 203
    const/16 v0, 0x100

    .line 204
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_d

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/16 v2, 0x8

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_d
    return p1
.end method

.method getCurrentCwnd(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 174
    const/16 v0, 0x20

    .line 175
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x5

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_c
    return p1
.end method

.method getDownloadBandwidth(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 149
    const/4 v0, 0x4

    .line 150
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_b

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x2

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_b
    return p1
.end method

.method getDownloadRetransRate(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 186
    const/16 v0, 0x40

    .line 187
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x6

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_c
    return p1
.end method

.method getEnablePush(Z)Z
    .registers 7
    .param p1, "defaultValue"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 156
    const/4 v0, 0x4

    .line 157
    .local v0, "bit":I
    iget v3, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v3, v0

    if-eqz v3, :cond_10

    iget-object v3, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v4, 0x2

    aget v3, v3, v4

    :goto_d
    if-ne v3, v1, :cond_16

    :goto_f
    return v1

    :cond_10
    if-eqz p1, :cond_14

    move v3, v1

    goto :goto_d

    :cond_14
    move v3, v2

    goto :goto_d

    :cond_16
    move v1, v2

    goto :goto_f
.end method

.method getHeaderTableSize()I
    .registers 4

    .prologue
    .line 143
    const/4 v0, 0x2

    .line 144
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    :goto_b
    return v1

    :cond_c
    const/4 v1, -0x1

    goto :goto_b
.end method

.method getInitialWindowSize(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 197
    const/16 v0, 0x80

    .line 198
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x7

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_c
    return p1
.end method

.method getMaxConcurrentStreams(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 168
    const/16 v0, 0x10

    .line 169
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x4

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_c
    return p1
.end method

.method getMaxFrameSize(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 180
    const/16 v0, 0x20

    .line 181
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x5

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_c
    return p1
.end method

.method getMaxHeaderListSize(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 192
    const/16 v0, 0x40

    .line 193
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x6

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_c
    return p1
.end method

.method getRoundTripTime(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 162
    const/16 v0, 0x8

    .line 163
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x3

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_c
    return p1
.end method

.method getUploadBandwidth(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 137
    const/4 v0, 0x2

    .line 138
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_b

    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/4 v2, 0x1

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_b
    return p1
.end method

.method isFlowControlDisabled()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 209
    const/16 v0, 0x400

    .line 210
    .local v0, "bit":I
    iget v3, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v3, v0

    if-eqz v3, :cond_14

    iget-object v3, p0, Lokhttp3/internal/framed/Settings;->values:[I

    const/16 v4, 0xa

    aget v1, v3, v4

    .line 211
    .local v1, "value":I
    :goto_e
    and-int/lit8 v3, v1, 0x1

    if-eqz v3, :cond_13

    const/4 v2, 0x1

    :cond_13
    return v2

    .end local v1    # "value":I
    :cond_14
    move v1, v2

    .line 210
    goto :goto_e
.end method

.method isPersisted(I)Z
    .registers 5
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x1

    .line 225
    shl-int v0, v1, p1

    .line 226
    .local v0, "bit":I
    iget v2, p0, Lokhttp3/internal/framed/Settings;->persisted:I

    and-int/2addr v2, v0

    if-eqz v2, :cond_9

    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method isSet(I)Z
    .registers 5
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x1

    .line 113
    shl-int v0, v1, p1

    .line 114
    .local v0, "bit":I
    iget v2, p0, Lokhttp3/internal/framed/Settings;->set:I

    and-int/2addr v2, v0

    if-eqz v2, :cond_9

    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method merge(Lokhttp3/internal/framed/Settings;)V
    .registers 5
    .param p1, "other"    # Lokhttp3/internal/framed/Settings;

    .prologue
    .line 234
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0xa

    if-ge v0, v1, :cond_1a

    .line 235
    invoke-virtual {p1, v0}, Lokhttp3/internal/framed/Settings;->isSet(I)Z

    move-result v1

    if-nez v1, :cond_e

    .line 234
    :goto_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 236
    :cond_e
    invoke-virtual {p1, v0}, Lokhttp3/internal/framed/Settings;->flags(I)I

    move-result v1

    invoke-virtual {p1, v0}, Lokhttp3/internal/framed/Settings;->get(I)I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lokhttp3/internal/framed/Settings;->set(III)Lokhttp3/internal/framed/Settings;

    goto :goto_b

    .line 238
    :cond_1a
    return-void
.end method

.method persistValue(I)Z
    .registers 5
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x1

    .line 219
    shl-int v0, v1, p1

    .line 220
    .local v0, "bit":I
    iget v2, p0, Lokhttp3/internal/framed/Settings;->persistValue:I

    and-int/2addr v2, v0

    if-eqz v2, :cond_9

    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method set(III)Lokhttp3/internal/framed/Settings;
    .registers 7
    .param p1, "id"    # I
    .param p2, "idFlags"    # I
    .param p3, "value"    # I

    .prologue
    .line 90
    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    array-length v1, v1

    if-lt p1, v1, :cond_6

    .line 108
    :goto_5
    return-object p0

    .line 94
    :cond_6
    const/4 v1, 0x1

    shl-int v0, v1, p1

    .line 95
    .local v0, "bit":I
    iget v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    or-int/2addr v1, v0

    iput v1, p0, Lokhttp3/internal/framed/Settings;->set:I

    .line 96
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_25

    .line 97
    iget v1, p0, Lokhttp3/internal/framed/Settings;->persistValue:I

    or-int/2addr v1, v0

    iput v1, p0, Lokhttp3/internal/framed/Settings;->persistValue:I

    .line 101
    :goto_17
    and-int/lit8 v1, p2, 0x2

    if-eqz v1, :cond_2d

    .line 102
    iget v1, p0, Lokhttp3/internal/framed/Settings;->persisted:I

    or-int/2addr v1, v0

    iput v1, p0, Lokhttp3/internal/framed/Settings;->persisted:I

    .line 107
    :goto_20
    iget-object v1, p0, Lokhttp3/internal/framed/Settings;->values:[I

    aput p3, v1, p1

    goto :goto_5

    .line 99
    :cond_25
    iget v1, p0, Lokhttp3/internal/framed/Settings;->persistValue:I

    xor-int/lit8 v2, v0, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lokhttp3/internal/framed/Settings;->persistValue:I

    goto :goto_17

    .line 104
    :cond_2d
    iget v1, p0, Lokhttp3/internal/framed/Settings;->persisted:I

    xor-int/lit8 v2, v0, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lokhttp3/internal/framed/Settings;->persisted:I

    goto :goto_20
.end method

.method size()I
    .registers 2

    .prologue
    .line 132
    iget v0, p0, Lokhttp3/internal/framed/Settings;->set:I

    invoke-static {v0}, Ljava/lang/Integer;->bitCount(I)I

    move-result v0

    return v0
.end method
