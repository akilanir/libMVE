.class public Ljavassist/bytecode/LineNumberAttribute$Pc;
.super Ljava/lang/Object;
.source "LineNumberAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/LineNumberAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Pc"
.end annotation


# instance fields
.field public index:I

.field public line:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
