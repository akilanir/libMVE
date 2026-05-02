.class abstract Lcom/nispok/snackbar/DisplayCompat$Impl;
.super Ljava/lang/Object;
.source "DisplayCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nispok/snackbar/DisplayCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Impl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract getRealSize(Landroid/view/Display;Landroid/graphics/Point;)V
.end method

.method abstract getSize(Landroid/view/Display;Landroid/graphics/Point;)V
.end method
