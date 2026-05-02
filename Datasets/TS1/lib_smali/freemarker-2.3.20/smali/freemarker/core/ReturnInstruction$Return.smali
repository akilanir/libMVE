.class public Lfreemarker/core/ReturnInstruction$Return;
.super Ljava/lang/RuntimeException;
.source "ReturnInstruction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/ReturnInstruction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Return"
.end annotation


# static fields
.field static final INSTANCE:Lfreemarker/core/ReturnInstruction$Return;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 100
    new-instance v0, Lfreemarker/core/ReturnInstruction$Return;

    invoke-direct {v0}, Lfreemarker/core/ReturnInstruction$Return;-><init>()V

    sput-object v0, Lfreemarker/core/ReturnInstruction$Return;->INSTANCE:Lfreemarker/core/ReturnInstruction$Return;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 102
    return-void
.end method
