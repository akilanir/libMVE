.class final Lfreemarker/core/FMParser$LookaheadSuccess;
.super Ljava/lang/Error;
.source "FMParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/FMParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LookaheadSuccess"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 4546
    invoke-direct {p0}, Ljava/lang/Error;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/core/FMParser$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/core/FMParser$1;

    .prologue
    .line 4546
    invoke-direct {p0}, Lfreemarker/core/FMParser$LookaheadSuccess;-><init>()V

    return-void
.end method
