.class public Lcom/jjoe64/graphview/series/DataPoint;
.super Ljava/lang/Object;
.source "DataPoint.java"

# interfaces
.implements Lcom/jjoe64/graphview/series/DataPointInterface;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x14c8b20c415L


# instance fields
.field private x:D

.field private y:D


# direct methods
.method public constructor <init>(DD)V
    .registers 5
    .param p1, "x"    # D
    .param p3, "y"    # D

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-wide p1, p0, Lcom/jjoe64/graphview/series/DataPoint;->x:D

    .line 41
    iput-wide p3, p0, Lcom/jjoe64/graphview/series/DataPoint;->y:D

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;D)V
    .registers 6
    .param p1, "x"    # Ljava/util/Date;
    .param p2, "y"    # D

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    long-to-double v0, v0

    iput-wide v0, p0, Lcom/jjoe64/graphview/series/DataPoint;->x:D

    .line 46
    iput-wide p2, p0, Lcom/jjoe64/graphview/series/DataPoint;->y:D

    .line 47
    return-void
.end method


# virtual methods
.method public getX()D
    .registers 3

    .prologue
    .line 51
    iget-wide v0, p0, Lcom/jjoe64/graphview/series/DataPoint;->x:D

    return-wide v0
.end method

.method public getY()D
    .registers 3

    .prologue
    .line 56
    iget-wide v0, p0, Lcom/jjoe64/graphview/series/DataPoint;->y:D

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/jjoe64/graphview/series/DataPoint;->x:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/jjoe64/graphview/series/DataPoint;->y:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
