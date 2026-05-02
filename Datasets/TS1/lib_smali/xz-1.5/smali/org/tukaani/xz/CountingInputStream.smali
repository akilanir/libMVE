.class Lorg/tukaani/xz/CountingInputStream;
.super Ljava/io/FilterInputStream;


# instance fields
.field private size:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4

    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/tukaani/xz/CountingInputStream;->size:J

    return-void
.end method


# virtual methods
.method public getSize()J
    .registers 3

    iget-wide v0, p0, Lorg/tukaani/xz/CountingInputStream;->size:J

    return-wide v0
.end method

.method public read()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/CountingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_18

    iget-wide v1, p0, Lorg/tukaani/xz/CountingInputStream;->size:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_18

    iget-wide v1, p0, Lorg/tukaani/xz/CountingInputStream;->size:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/tukaani/xz/CountingInputStream;->size:J

    :cond_18
    return v0
.end method

.method public read([BII)I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/CountingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    if-lez v0, :cond_16

    iget-wide v1, p0, Lorg/tukaani/xz/CountingInputStream;->size:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_16

    iget-wide v1, p0, Lorg/tukaani/xz/CountingInputStream;->size:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/tukaani/xz/CountingInputStream;->size:J

    :cond_16
    return v0
.end method
