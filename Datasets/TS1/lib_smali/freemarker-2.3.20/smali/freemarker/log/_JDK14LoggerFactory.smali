.class public Lfreemarker/log/_JDK14LoggerFactory;
.super Ljava/lang/Object;
.source "_JDK14LoggerFactory.java"

# interfaces
.implements Lfreemarker/log/LoggerFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    return-void
.end method


# virtual methods
.method public getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;
    .registers 4
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 67
    new-instance v0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;

    invoke-static {p1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;-><init>(Ljava/util/logging/Logger;)V

    return-object v0
.end method
