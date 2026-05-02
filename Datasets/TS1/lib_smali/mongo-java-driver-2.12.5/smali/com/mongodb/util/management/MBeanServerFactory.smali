.class public Lcom/mongodb/util/management/MBeanServerFactory;
.super Ljava/lang/Object;
.source "MBeanServerFactory.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final mBeanServer:Lcom/mongodb/util/management/MBeanServer;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 35
    :try_start_0
    new-instance v1, Lcom/mongodb/util/management/jmx/JMXMBeanServer;

    invoke-direct {v1}, Lcom/mongodb/util/management/jmx/JMXMBeanServer;-><init>()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_5} :catch_8

    .line 40
    .local v1, "tmp":Lcom/mongodb/util/management/MBeanServer;
    :goto_5
    sput-object v1, Lcom/mongodb/util/management/MBeanServerFactory;->mBeanServer:Lcom/mongodb/util/management/MBeanServer;

    .line 41
    return-void

    .line 36
    .end local v1    # "tmp":Lcom/mongodb/util/management/MBeanServer;
    :catch_8
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v1, Lcom/mongodb/util/management/NullMBeanServer;

    invoke-direct {v1}, Lcom/mongodb/util/management/NullMBeanServer;-><init>()V

    .restart local v1    # "tmp":Lcom/mongodb/util/management/MBeanServer;
    goto :goto_5
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMBeanServer()Lcom/mongodb/util/management/MBeanServer;
    .registers 1

    .prologue
    .line 44
    sget-object v0, Lcom/mongodb/util/management/MBeanServerFactory;->mBeanServer:Lcom/mongodb/util/management/MBeanServer;

    return-object v0
.end method
