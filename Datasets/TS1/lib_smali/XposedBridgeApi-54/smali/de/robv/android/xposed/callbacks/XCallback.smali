.class public abstract Lde/robv/android/xposed/callbacks/XCallback;
.super Ljava/lang/Object;
.source "XCallback.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/robv/android/xposed/callbacks/XCallback$Param;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lde/robv/android/xposed/callbacks/XCallback;",
        ">;"
    }
.end annotation


# static fields
.field public static final PRIORITY_DEFAULT:I = 0x32

.field public static final PRIORITY_HIGHEST:I = 0x2710

.field public static final PRIORITY_LOWEST:I = -0x2710


# instance fields
.field public final priority:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/16 v0, 0x32

    iput v0, p0, Lde/robv/android/xposed/callbacks/XCallback;->priority:I

    .line 13
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "priority"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lde/robv/android/xposed/callbacks/XCallback;->priority:I

    .line 16
    return-void
.end method

.method public static final callAll(Lde/robv/android/xposed/callbacks/XCallback$Param;)V
    .registers 5
    .param p0, "param"    # Lde/robv/android/xposed/callbacks/XCallback$Param;

    .prologue
    .line 65
    iget-object v2, p0, Lde/robv/android/xposed/callbacks/XCallback$Param;->callbacks:[Ljava/lang/Object;

    if-nez v2, :cond_c

    .line 66
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "This object was not created for use with callAll"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 68
    :cond_c
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    iget-object v2, p0, Lde/robv/android/xposed/callbacks/XCallback$Param;->callbacks:[Ljava/lang/Object;

    array-length v2, v2

    if-lt v0, v2, :cond_13

    .line 73
    return-void

    .line 70
    :cond_13
    :try_start_13
    iget-object v2, p0, Lde/robv/android/xposed/callbacks/XCallback$Param;->callbacks:[Ljava/lang/Object;

    aget-object v2, v2, v0

    check-cast v2, Lde/robv/android/xposed/callbacks/XCallback;

    invoke-virtual {v2, p0}, Lde/robv/android/xposed/callbacks/XCallback;->call(Lde/robv/android/xposed/callbacks/XCallback$Param;)V
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_1c} :catch_1f

    .line 68
    :goto_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 71
    :catch_1f
    move-exception v1

    .local v1, "t":Ljava/lang/Throwable;
    invoke-static {v1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    goto :goto_1c
.end method


# virtual methods
.method protected call(Lde/robv/android/xposed/callbacks/XCallback$Param;)V
    .registers 2
    .param p1, "param"    # Lde/robv/android/xposed/callbacks/XCallback$Param;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 75
    return-void
.end method

.method public compareTo(Lde/robv/android/xposed/callbacks/XCallback;)I
    .registers 4
    .param p1, "other"    # Lde/robv/android/xposed/callbacks/XCallback;

    .prologue
    .line 79
    if-ne p0, p1, :cond_4

    .line 80
    const/4 v0, 0x0

    .line 89
    :goto_3
    return v0

    .line 83
    :cond_4
    iget v0, p1, Lde/robv/android/xposed/callbacks/XCallback;->priority:I

    iget v1, p0, Lde/robv/android/xposed/callbacks/XCallback;->priority:I

    if-eq v0, v1, :cond_10

    .line 84
    iget v0, p1, Lde/robv/android/xposed/callbacks/XCallback;->priority:I

    iget v1, p0, Lde/robv/android/xposed/callbacks/XCallback;->priority:I

    sub-int/2addr v0, v1

    goto :goto_3

    .line 86
    :cond_10
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    if-ge v0, v1, :cond_1c

    .line 87
    const/4 v0, -0x1

    goto :goto_3

    .line 89
    :cond_1c
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 1
    check-cast p1, Lde/robv/android/xposed/callbacks/XCallback;

    invoke-virtual {p0, p1}, Lde/robv/android/xposed/callbacks/XCallback;->compareTo(Lde/robv/android/xposed/callbacks/XCallback;)I

    move-result v0

    return v0
.end method
