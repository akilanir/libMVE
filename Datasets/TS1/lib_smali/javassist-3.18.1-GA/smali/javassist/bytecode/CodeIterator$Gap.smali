.class public Ljavassist/bytecode/CodeIterator$Gap;
.super Ljava/lang/Object;
.source "CodeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/CodeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Gap"
.end annotation


# instance fields
.field public length:I

.field public position:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 563
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
