.class public Lch/qos/logback/classic/spi/StackTraceElementProxy;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x20f378eaeeecbcceL


# instance fields
.field private cpd:Lch/qos/logback/classic/spi/ClassPackagingData;

.field final ste:Ljava/lang/StackTraceElement;

.field private transient steAsString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/StackTraceElement;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ste cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    iput-object p1, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->ste:Ljava/lang/StackTraceElement;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_5

    :cond_4
    :goto_4
    return v0

    :cond_5
    if-nez p1, :cond_9

    move v0, v1

    goto :goto_4

    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_15

    move v0, v1

    goto :goto_4

    :cond_15
    check-cast p1, Lch/qos/logback/classic/spi/StackTraceElementProxy;

    iget-object v2, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->ste:Ljava/lang/StackTraceElement;

    iget-object v3, p1, Lch/qos/logback/classic/spi/StackTraceElementProxy;->ste:Ljava/lang/StackTraceElement;

    invoke-virtual {v2, v3}, Ljava/lang/StackTraceElement;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_23

    move v0, v1

    goto :goto_4

    :cond_23
    iget-object v2, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->cpd:Lch/qos/logback/classic/spi/ClassPackagingData;

    if-nez v2, :cond_2d

    iget-object v2, p1, Lch/qos/logback/classic/spi/StackTraceElementProxy;->cpd:Lch/qos/logback/classic/spi/ClassPackagingData;

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_4

    :cond_2d
    iget-object v2, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->cpd:Lch/qos/logback/classic/spi/ClassPackagingData;

    iget-object v3, p1, Lch/qos/logback/classic/spi/StackTraceElementProxy;->cpd:Lch/qos/logback/classic/spi/ClassPackagingData;

    invoke-virtual {v2, v3}, Lch/qos/logback/classic/spi/ClassPackagingData;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    goto :goto_4
.end method

.method public getClassPackagingData()Lch/qos/logback/classic/spi/ClassPackagingData;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->cpd:Lch/qos/logback/classic/spi/ClassPackagingData;

    return-object v0
.end method

.method public getSTEAsString()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->steAsString:Ljava/lang/String;

    if-nez v0, :cond_1f

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "at "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->ste:Ljava/lang/StackTraceElement;

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->steAsString:Ljava/lang/String;

    :cond_1f
    iget-object v0, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->steAsString:Ljava/lang/String;

    return-object v0
.end method

.method public getStackTraceElement()Ljava/lang/StackTraceElement;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->ste:Ljava/lang/StackTraceElement;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->ste:Ljava/lang/StackTraceElement;

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->hashCode()I

    move-result v0

    return v0
.end method

.method public setClassPackagingData(Lch/qos/logback/classic/spi/ClassPackagingData;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->cpd:Lch/qos/logback/classic/spi/ClassPackagingData;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Packaging data has been already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iput-object p1, p0, Lch/qos/logback/classic/spi/StackTraceElementProxy;->cpd:Lch/qos/logback/classic/spi/ClassPackagingData;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/classic/spi/StackTraceElementProxy;->getSTEAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
