.class public final Lorg/msgpack/util/android/DalvikVmChecker;
.super Ljava/lang/Object;
.source "DalvikVmChecker.java"


# static fields
.field private static final isDalvikVm:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 6
    const/4 v0, 0x0

    .line 8
    .local v0, "isIt":Z
    :try_start_1
    const-string v1, "java.vm.name"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Dalvik"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_10

    move-result v0

    .line 10
    sput-boolean v0, Lorg/msgpack/util/android/DalvikVmChecker;->isDalvikVm:Z

    .line 12
    return-void

    .line 10
    :catchall_10
    move-exception v1

    sput-boolean v0, Lorg/msgpack/util/android/DalvikVmChecker;->isDalvikVm:Z

    throw v1
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isDalvikVm()Z
    .registers 1

    .prologue
    .line 15
    sget-boolean v0, Lorg/msgpack/util/android/DalvikVmChecker;->isDalvikVm:Z

    return v0
.end method
