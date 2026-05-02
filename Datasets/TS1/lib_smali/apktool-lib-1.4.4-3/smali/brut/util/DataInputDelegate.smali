.class public abstract Lbrut/util/DataInputDelegate;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/DataInput;


# instance fields
.field protected final mDelegate:Ljava/io/DataInput;


# direct methods
.method public constructor <init>(Ljava/io/DataInput;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    return-void
.end method


# virtual methods
.method public readBoolean()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readBoolean()Z

    move-result v0

    return v0
.end method

.method public readByte()B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readByte()B

    move-result v0

    return v0
.end method

.method public readChar()C
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readChar()C

    move-result v0

    return v0
.end method

.method public readDouble()D
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readFloat()F

    move-result v0

    return v0
.end method

.method public readFully([B)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0, p1}, Ljava/io/DataInput;->readFully([B)V

    return-void
.end method

.method public readFully([BII)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0, p1, p2, p3}, Ljava/io/DataInput;->readFully([BII)V

    return-void
.end method

.method public readInt()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readInt()I

    move-result v0

    return v0
.end method

.method public readLine()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readLine()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readLong()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public readShort()S
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readShort()S

    move-result v0

    return v0
.end method

.method public readUTF()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUnsignedByte()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedByte()I

    move-result v0

    return v0
.end method

.method public readUnsignedShort()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0}, Ljava/io/DataInput;->readUnsignedShort()I

    move-result v0

    return v0
.end method

.method public skipBytes(I)I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lbrut/util/DataInputDelegate;->mDelegate:Ljava/io/DataInput;

    invoke-interface {v0, p1}, Ljava/io/DataInput;->skipBytes(I)I

    move-result v0

    return v0
.end method
