.class Ljavassist/runtime/Cflow$Depth;
.super Ljava/lang/Object;
.source "Cflow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/runtime/Cflow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Depth"
.end annotation


# instance fields
.field private depth:I


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Ljavassist/runtime/Cflow$Depth;->depth:I

    return-void
.end method


# virtual methods
.method dec()V
    .registers 2

    .prologue
    .line 32
    iget v0, p0, Ljavassist/runtime/Cflow$Depth;->depth:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Ljavassist/runtime/Cflow$Depth;->depth:I

    return-void
.end method

.method get()I
    .registers 2

    .prologue
    .line 30
    iget v0, p0, Ljavassist/runtime/Cflow$Depth;->depth:I

    return v0
.end method

.method inc()V
    .registers 2

    .prologue
    .line 31
    iget v0, p0, Ljavassist/runtime/Cflow$Depth;->depth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Ljavassist/runtime/Cflow$Depth;->depth:I

    return-void
.end method
