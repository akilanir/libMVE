.class public Lch/qos/logback/classic/spi/LoggerComparator;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lch/qos/logback/classic/Logger;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lch/qos/logback/classic/Logger;Lch/qos/logback/classic/Logger;)I
    .registers 5

    invoke-virtual {p1}, Lch/qos/logback/classic/Logger;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lch/qos/logback/classic/Logger;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x0

    :goto_f
    return v0

    :cond_10
    invoke-virtual {p1}, Lch/qos/logback/classic/Logger;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ROOT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    const/4 v0, -0x1

    goto :goto_f

    :cond_1e
    invoke-virtual {p2}, Lch/qos/logback/classic/Logger;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ROOT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    const/4 v0, 0x1

    goto :goto_f

    :cond_2c
    invoke-virtual {p1}, Lch/qos/logback/classic/Logger;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lch/qos/logback/classic/Logger;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_f
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    check-cast p1, Lch/qos/logback/classic/Logger;

    check-cast p2, Lch/qos/logback/classic/Logger;

    invoke-virtual {p0, p1, p2}, Lch/qos/logback/classic/spi/LoggerComparator;->compare(Lch/qos/logback/classic/Logger;Lch/qos/logback/classic/Logger;)I

    move-result v0

    return v0
.end method
