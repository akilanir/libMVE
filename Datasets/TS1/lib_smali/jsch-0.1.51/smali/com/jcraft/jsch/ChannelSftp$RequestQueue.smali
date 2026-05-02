.class Lcom/jcraft/jsch/ChannelSftp$RequestQueue;
.super Ljava/lang/Object;
.source "ChannelSftp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/ChannelSftp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RequestQueue"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;,
        Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;
    }
.end annotation


# instance fields
.field count:I

.field head:I

.field rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

.field final synthetic this$0:Lcom/jcraft/jsch/ChannelSftp;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/ChannelSftp;I)V
    .registers 6
    .param p2, "size"    # I

    .prologue
    .line 1181
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1179
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    .line 1182
    new-array v1, p2, [Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    iput-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    .line 1183
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    array-length v1, v1

    if-ge v0, v1, :cond_1e

    .line 1184
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    new-instance v2, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    invoke-direct {v2, p0}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;-><init>(Lcom/jcraft/jsch/ChannelSftp$RequestQueue;)V

    aput-object v2, v1, v0

    .line 1183
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 1186
    :cond_1e
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->init()V

    .line 1187
    return-void
.end method


# virtual methods
.method add(IJI)V
    .registers 9
    .param p1, "id"    # I
    .param p2, "offset"    # J
    .param p4, "length"    # I

    .prologue
    .line 1194
    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count:I

    if-nez v1, :cond_7

    const/4 v1, 0x0

    iput v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->head:I

    .line 1195
    :cond_7
    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->head:I

    iget v2, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count:I

    add-int v0, v1, v2

    .line 1196
    .local v0, "tail":I
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    array-length v1, v1

    if-lt v0, v1, :cond_16

    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    array-length v1, v1

    sub-int/2addr v0, v1

    .line 1197
    :cond_16
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v1, v1, v0

    iput p1, v1, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->id:I

    .line 1198
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v1, v1, v0

    iput-wide p2, v1, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->offset:J

    .line 1199
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v1, v1, v0

    int-to-long v2, p4

    iput-wide v2, v1, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->length:J

    .line 1200
    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count:I

    .line 1201
    return-void
.end method

.method cancel(Lcom/jcraft/jsch/ChannelSftp$Header;Lcom/jcraft/jsch/Buffer;)V
    .registers 10
    .param p1, "header"    # Lcom/jcraft/jsch/ChannelSftp$Header;
    .param p2, "buf"    # Lcom/jcraft/jsch/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1236
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count:I

    .line 1237
    .local v0, "_count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    if-ge v1, v0, :cond_30

    .line 1238
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    # invokes: Lcom/jcraft/jsch/ChannelSftp;->header(Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;
    invoke-static {v4, p2, p1}, Lcom/jcraft/jsch/ChannelSftp;->access$500(Lcom/jcraft/jsch/ChannelSftp;Lcom/jcraft/jsch/Buffer;Lcom/jcraft/jsch/ChannelSftp$Header;)Lcom/jcraft/jsch/ChannelSftp$Header;

    move-result-object p1

    .line 1239
    iget v3, p1, Lcom/jcraft/jsch/ChannelSftp$Header;->length:I

    .line 1240
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_e
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    array-length v4, v4

    if-ge v2, v4, :cond_24

    .line 1241
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v4, v4, v2

    iget v4, v4, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->id:I

    iget v5, p1, Lcom/jcraft/jsch/ChannelSftp$Header;->rid:I

    if-ne v4, v5, :cond_2d

    .line 1242
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v4, v4, v2

    const/4 v5, 0x0

    iput v5, v4, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->id:I

    .line 1246
    :cond_24
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->this$0:Lcom/jcraft/jsch/ChannelSftp;

    int-to-long v5, v3

    # invokes: Lcom/jcraft/jsch/ChannelSftp;->skip(J)V
    invoke-static {v4, v5, v6}, Lcom/jcraft/jsch/ChannelSftp;->access$600(Lcom/jcraft/jsch/ChannelSftp;J)V

    .line 1237
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 1240
    :cond_2d
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 1248
    .end local v2    # "j":I
    .end local v3    # "length":I
    :cond_30
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->init()V

    .line 1249
    return-void
.end method

.method count()I
    .registers 2

    .prologue
    .line 1228
    iget v0, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count:I

    return v0
.end method

.method get(I)Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;
    .registers 11
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;,
            Lcom/jcraft/jsch/SftpException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 1204
    iget v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count:I

    .line 1205
    iget v1, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->head:I

    .line 1206
    .local v1, "i":I
    iget v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->head:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->head:I

    .line 1207
    iget v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->head:I

    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    array-length v6, v6

    if-ne v5, v6, :cond_18

    iput v7, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->head:I

    .line 1208
    :cond_18
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v5, v5, v1

    iget v5, v5, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->id:I

    if-eq v5, p1, :cond_5f

    .line 1209
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->getOffset()J

    move-result-wide v3

    .line 1210
    .local v3, "offset":J
    const/4 v0, 0x0

    .line 1211
    .local v0, "find":Z
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_26
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    array-length v5, v5

    if-ge v2, v5, :cond_3a

    .line 1212
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v5, v5, v2

    iget v5, v5, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->id:I

    if-ne v5, p1, :cond_42

    .line 1213
    const/4 v0, 0x1

    .line 1214
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v5, v5, v2

    iput v7, v5, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->id:I

    .line 1218
    :cond_3a
    if-eqz v0, :cond_45

    .line 1219
    new-instance v5, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;

    invoke-direct {v5, p0, v3, v4}, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$OutOfOrderException;-><init>(Lcom/jcraft/jsch/ChannelSftp$RequestQueue;J)V

    throw v5

    .line 1211
    :cond_42
    add-int/lit8 v2, v2, 0x1

    goto :goto_26

    .line 1220
    :cond_45
    new-instance v5, Lcom/jcraft/jsch/SftpException;

    const/4 v6, 0x4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "RequestQueue: unknown request id "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/jcraft/jsch/SftpException;-><init>(ILjava/lang/String;)V

    throw v5

    .line 1223
    .end local v0    # "find":Z
    .end local v2    # "j":I
    .end local v3    # "offset":J
    :cond_5f
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v5, v5, v1

    iput v7, v5, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->id:I

    .line 1224
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v5, v5, v1

    return-object v5
.end method

.method getOffset()J
    .registers 6

    .prologue
    .line 1252
    const-wide v1, 0x7fffffffffffffffL

    .line 1254
    .local v1, "result":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    array-length v3, v3

    if-ge v0, v3, :cond_27

    .line 1255
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->id:I

    if-nez v3, :cond_16

    .line 1254
    :cond_13
    :goto_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 1257
    :cond_16
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v3, v3, v0

    iget-wide v3, v3, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->offset:J

    cmp-long v3, v1, v3

    if-lez v3, :cond_13

    .line 1258
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    aget-object v3, v3, v0

    iget-wide v1, v3, Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;->offset:J

    goto :goto_13

    .line 1261
    :cond_27
    return-wide v1
.end method

.method init()V
    .registers 2

    .prologue
    .line 1190
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->count:I

    iput v0, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->head:I

    .line 1191
    return-void
.end method

.method size()I
    .registers 2

    .prologue
    .line 1232
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSftp$RequestQueue;->rrq:[Lcom/jcraft/jsch/ChannelSftp$RequestQueue$Request;

    array-length v0, v0

    return v0
.end method
