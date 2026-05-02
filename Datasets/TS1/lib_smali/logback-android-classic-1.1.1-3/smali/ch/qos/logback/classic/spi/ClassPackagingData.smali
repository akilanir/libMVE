.class public Lch/qos/logback/classic/spi/ClassPackagingData;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0xb2aaacd13ec78e9L


# instance fields
.field final codeLocation:Ljava/lang/String;

.field private final exact:Z

.field final version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->codeLocation:Ljava/lang/String;

    iput-object p2, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->version:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->exact:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->codeLocation:Ljava/lang/String;

    iput-object p2, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->version:Ljava/lang/String;

    iput-boolean p3, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->exact:Z

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
    check-cast p1, Lch/qos/logback/classic/spi/ClassPackagingData;

    iget-object v2, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->codeLocation:Ljava/lang/String;

    if-nez v2, :cond_21

    iget-object v2, p1, Lch/qos/logback/classic/spi/ClassPackagingData;->codeLocation:Ljava/lang/String;

    if-eqz v2, :cond_2d

    move v0, v1

    goto :goto_4

    :cond_21
    iget-object v2, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->codeLocation:Ljava/lang/String;

    iget-object v3, p1, Lch/qos/logback/classic/spi/ClassPackagingData;->codeLocation:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2d

    move v0, v1

    goto :goto_4

    :cond_2d
    iget-boolean v2, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->exact:Z

    iget-boolean v3, p1, Lch/qos/logback/classic/spi/ClassPackagingData;->exact:Z

    if-eq v2, v3, :cond_35

    move v0, v1

    goto :goto_4

    :cond_35
    iget-object v2, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->version:Ljava/lang/String;

    if-nez v2, :cond_3f

    iget-object v2, p1, Lch/qos/logback/classic/spi/ClassPackagingData;->version:Ljava/lang/String;

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_4

    :cond_3f
    iget-object v2, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->version:Ljava/lang/String;

    iget-object v3, p1, Lch/qos/logback/classic/spi/ClassPackagingData;->version:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    goto :goto_4
.end method

.method public getCodeLocation()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->codeLocation:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->version:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->codeLocation:Ljava/lang/String;

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_5
    add-int/lit8 v0, v0, 0x1f

    return v0

    :cond_8
    iget-object v0, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->codeLocation:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_5
.end method

.method public isExact()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/classic/spi/ClassPackagingData;->exact:Z

    return v0
.end method
